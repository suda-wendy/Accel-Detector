//#include "sys.h"
#include "sdcard.h"			   

/*--------------------------------PART 1----------------------------------------------------*/
SPI_InitTypeDef  G_SPI_InitStructure;
/*---------------------------------------------------------------------*/
void SD_GPIO_Config(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB2PeriphClockCmd(	SD_GPIO_RCC_Periph, ENABLE );


	GPIO_InitStructure.GPIO_Pin = SD_SPI_SCLK_Pin | SD_SPI_SDI_Pin | SD_SPI_SDO_Pin;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  //复用推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(SD_SPI_Port, &GPIO_InitStructure);


	GPIO_InitStructure.GPIO_Pin = SD_GPIO_CS_Pin;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //上拉输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(SD_GPIO_CS_Port, &GPIO_InitStructure);
	GPIO_SetBits(SD_GPIO_CS_Port,SD_GPIO_CS_Pin);

}	
/*---------------------------------------------------------------------*/
void SD_SPI_Config(void)
{

#if(SD_USING_SPI == 2)
	RCC_APB1PeriphClockCmd(SD_SPI_RCC_Periph, ENABLE );
#endif

#if(SD_USING_SPI == 1)
	RCC_APB2PeriphClockCmd(SD_SPI_RCC_Periph, ENABLE );
#endif

	G_SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;  //设置SPI单向或者双向的数据模式:SPI设置为双线双向全双工
	G_SPI_InitStructure.SPI_Mode = SPI_Mode_Master;		//设置SPI工作模式:设置为主SPI
	G_SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;	//设置SPI的数据大小:SPI发送接收8位帧结构
	G_SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;			//选择了串行时钟的稳态:时钟悬空高
	G_SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;		//数据捕获于第二个时钟沿
	G_SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;			//NSS信号由硬件（NSS管脚）还是软件（使用SSI位）管理:内部NSS信号有SSI位控制
	G_SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_256;
	G_SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;	//指定数据传输从MSB位还是LSB位开始:数据传输从MSB位开始
	G_SPI_InitStructure.SPI_CRCPolynomial = 7;			//CRC值计算的多项式

	SPI_Init(SD_SPI, &G_SPI_InitStructure);  		//根据SPI_InitStruct中指定的参数初始化外设SPIx寄存器
	SPI_Cmd(SD_SPI, ENABLE); //使能SPI外设
		
}
/*---------------------------------------------------------------------*/
//SD卡初始化的时候,需要低速
void SD_SPI_SpeedLow(void)
{ 		
	G_SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_256 ;
  	SPI_Init(SD_SPI, &G_SPI_InitStructure);//设置到低速模式	
}
//SD卡正常工作的时候,可以高速了
/*---------------------------------------------------------------------*/
void SD_SPI_SpeedHigh(void)
{
 	G_SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;
  	SPI_Init(SD_SPI, &G_SPI_InitStructure);//设置到高速模式	
}
/*---------------------------------------------------------------------*/
u8 SD_SPI_ReadWriteByte(u8 TxData)
{
	u8 retry=0;				 
	while (SPI_I2S_GetFlagStatus(SD_SPI, SPI_I2S_FLAG_TXE) == RESET) //检查指定的SPI标志位设置与否:发送缓存空标志位
		{
			retry++;
			if(retry>200)
				return 0;
		}			  

	SPI_I2S_SendData(SD_SPI, TxData); //通过外设SPIx发送一个数据
	retry=0;
	while (SPI_I2S_GetFlagStatus(SD_SPI, SPI_I2S_FLAG_RXNE) == RESET); //检查指定的SPI标志位设置与否:接受缓存非空标志位
		{
			retry++;
			if(retry>200)
				return 0;
		}	  						    
	return SPI_I2S_ReceiveData(SD_SPI); //返回通过SPIx最近接收的数据	
}
/*--------------------------------PART 2----------------------------------------------------*/						   
u8  SD_Type=0;//SD卡的类型 
//取消选择,释放SPI总线
void SD_DisSelect(void)
{
	SD_CS=1;
	SD_SPI_ReadWriteByte(0xff);//提供额外的8个时钟
}
//选择sd卡,并且等待卡准备OK
//返回值:0,成功;1,失败;
u8 SD_Select(void)
{
	SD_CS=0;
	if(SD_WaitReady()==0)return 0;//等待成功
	SD_DisSelect();
	return 1;//等待失败
}
//等待卡准备好
//返回值:0,准备好了;其他,错误代码
u8 SD_WaitReady(void)
{
	u32 t=0;
	do
	{
		if(SD_SPI_ReadWriteByte(0XFF)==0XFF)return 0;//OK
		t++;		  	
	}while(t<0XFFFFFF);//等待 
	return 1;
}
//等待SD卡回应
//Response:要得到的回应值
//返回值:0,成功得到了该回应值
//    其他,得到回应值失败
u8 SD_GetResponse(u8 Response)
{
	u16 Count=0xFFF;//等待次数	   						  
	while ((SD_SPI_ReadWriteByte(0XFF)!=Response)&&Count)Count--;//等待得到准确的回应  	  
	if (Count==0)return MSD_RESPONSE_FAILURE;//得到回应失败   
	else return MSD_RESPONSE_NO_ERROR;//正确回应
}
//从sd卡读取一个数据包的内容
//buf:数据缓存区
//len:要读取的数据长度.
//返回值:0,成功;其他,失败;	
u8 SD_RecvData(u8*buf,u16 len)
{			  	  
	if(SD_GetResponse(0xFE))return 1;//等待SD卡发回数据起始令牌0xFE
    while(len--)//开始接收数据
    {
        *buf=SD_SPI_ReadWriteByte(0xFF);
        buf++;
    }
    //下面是2个伪CRC（dummy CRC）
    SD_SPI_ReadWriteByte(0xFF);
    SD_SPI_ReadWriteByte(0xFF);									  					    
    return 0;//读取成功
}
//向sd卡写入一个数据包的内容 512字节
//buf:数据缓存区
//cmd:指令
//返回值:0,成功;其他,失败;	
u8 SD_SendBlock(u8*buf,u8 cmd)
{	
	u16 t;		  	  
	if(SD_WaitReady())return 1;//等待准备失效
	SD_SPI_ReadWriteByte(cmd);
	if(cmd!=0XFD)//不是结束指令
	{
		for(t=0;t<512;t++)SD_SPI_ReadWriteByte(buf[t]);//提高速度,减少函数传参时间
	    SD_SPI_ReadWriteByte(0xFF);//忽略crc
	    SD_SPI_ReadWriteByte(0xFF);
		t=SD_SPI_ReadWriteByte(0xFF);//接收响应
		if((t&0x1F)!=0x05)return 2;//响应错误									  					    
	}						 									  					    
    return 0;//写入成功
}

//向SD卡发送一个命令
//输入: u8 cmd   命令 
//      u32 arg  命令参数
//      u8 crc   crc校验值	   
//返回值:SD卡返回的响应															  
u8 SD_SendCmd(u8 cmd, u32 arg, u8 crc)
{
    u8 r1;	
	u8 Retry=0; 
	SD_DisSelect();//取消上次片选
	if(SD_Select())return 0XFF;//片选失效 
	//发送
    SD_SPI_ReadWriteByte(cmd | 0x40);//分别写入命令
    SD_SPI_ReadWriteByte(arg >> 24);
    SD_SPI_ReadWriteByte(arg >> 16);
    SD_SPI_ReadWriteByte(arg >> 8);
    SD_SPI_ReadWriteByte(arg);	  
    SD_SPI_ReadWriteByte(crc); 
	if(cmd==CMD12)SD_SPI_ReadWriteByte(0xff);//Skip a stuff byte when stop reading
    //等待响应，或超时退出
	Retry=0X1F;
	do
	{
		r1=SD_SPI_ReadWriteByte(0xFF);
	}while((r1&0X80) && Retry--);	 
	//返回状态值
    return r1;
}		    																			  
//获取SD卡的CID信息，包括制造商信息
//输入: u8 *cid_data(存放CID的内存，至少16Byte）	  
//返回值:0：NO_ERR
//		 1：错误														   
u8 SD_GetCID(u8 *cid_data)
{
    u8 r1;	   
    //发CMD10命令，读CID
    r1=SD_SendCmd(CMD10,0,0x01);
    if(r1==0x00)
	{
		r1=SD_RecvData(cid_data,16);//接收16个字节的数据	 
    }
	SD_DisSelect();//取消片选
	if(r1)return 1;
	else return 0;
}																				  
//获取SD卡的CSD信息，包括容量和速度信息
//输入:u8 *cid_data(存放CID的内存，至少16Byte）	    
//返回值:0：NO_ERR
//		 1：错误														   
u8 SD_GetCSD(u8 *csd_data)
{
    u8 r1;	 
    r1=SD_SendCmd(CMD9,0,0x01);//发CMD9命令，读CSD
    if(r1==0)
	{
    	r1=SD_RecvData(csd_data, 16);//接收16个字节的数据 
    }
	SD_DisSelect();//取消片选
	if(r1)return 1;
	else return 0;
}  
//获取SD卡的总扇区数（扇区数）   
//返回值:0： 取容量出错 
//       其他:SD卡的容量(扇区数/512字节)
//每扇区的字节数必为512，因为如果不是512，则初始化不能通过.														  
u32 SD_GetSectorCount(void)
{
    u8 csd[16];
    u32 Capacity;  
    u8 n;
	u16 csize;  					    
	//取CSD信息，如果期间出错，返回0
    if(SD_GetCSD(csd)!=0) return 0;	    
    //如果为SDHC卡，按照下面方式计算
    if((csd[0]&0xC0)==0x40)	 //V2.00的卡
    {	
		csize = csd[9] + ((u16)csd[8] << 8) + 1;
		Capacity = (u32)csize << 10;//得到扇区数	 		   
    }else//V1.XX的卡
    {	
		n = (csd[5] & 15) + ((csd[10] & 128) >> 7) + ((csd[9] & 3) << 1) + 2;
		csize = (csd[8] >> 6) + ((u16)csd[7] << 2) + ((u16)(csd[6] & 3) << 10) + 1;
		Capacity= (u32)csize << (n - 9);//得到扇区数   
    }
    return Capacity;
}
//初始化SD卡
u8 SD_Initialize(void)
{
    u8 r1;      // 存放SD卡的返回值
    u16 retry;  // 用来进行超时计数
    u8 buf[4];  
	u16 i;

	SD_GPIO_Config();
	SD_SPI_Config();	
	SD_CS=1;

 	SD_SPI_SpeedLow();	//设置到低速模式 
		  
	for(i=0;i<10;i++)
		SD_SPI_ReadWriteByte(0XFF);//发送最少74个脉冲

	retry=20;

	while((r1!=0X01) && retry--)
		r1=SD_SendCmd(CMD0,0,0x95);//进入IDLE状态;

 	SD_Type=0;//默认无卡

	if(r1==0X01)
	{
		if(SD_SendCmd(CMD8,0x1AA,0x87)==1)//SD V2.0
		{
			for(i=0;i<4;i++)
				buf[i]=SD_SPI_ReadWriteByte(0XFF);	//Get trailing return value of R7 resp
			
			if(buf[2]==0X01&&buf[3]==0XAA)//卡是否支持2.7~3.6V
			{
				retry=0XFFFE;

				while(r1&&retry--)
				{
					SD_SendCmd(CMD55,0,0X01);	//发送CMD55
					r1=SD_SendCmd(CMD41,0x40000000,0X01);//发送CMD41	
				}

				if(retry&&SD_SendCmd(CMD58,0,0X01)==0)//鉴别SD2.0卡版本开始
				{
					for(i=0;i<4;i++)
						buf[i]=SD_SPI_ReadWriteByte(0XFF);//得到OCR值

					if(buf[0]&0x40)
						SD_Type=SD_TYPE_V2HC;    //检查CCS
					else 
						SD_Type=SD_TYPE_V2;   
				}
			}
		}
		else//SD V1.x/ MMC	V3
		{
			SD_SendCmd(CMD55,0,0X01);		//发送CMD55
			r1=SD_SendCmd(CMD41,0,0X01);	//发送CMD41
			if(r1<=1)
			{		
				SD_Type=SD_TYPE_V1;

				retry=0XFFFE;
				while(r1&&retry--)
				{
					SD_SendCmd(CMD55,0,0X01);	//发送CMD55
					r1=SD_SendCmd(CMD41,0,0X01);//发送CMD41	
				}
			}
			else
			{
				SD_Type=SD_TYPE_MMC;//MMC V3
				retry=0XFFFE;

				while(r1&&retry--)
				{
					r1=SD_SendCmd(CMD1,0,0X01);//发送CMD1	
				}  
			}
			if(retry==0||SD_SendCmd(CMD16,512,0X01)!=0)
				SD_Type=SD_TYPE_ERR;//错误的卡
		}
	}
	SD_DisSelect();//取消片选
	SD_SPI_SpeedHigh();//高速
	if(SD_Type)
		return 0;
	else 
	{
		if(r1)
			return r1;		
	}
 	   
	return 0xaa;//其他错误
}
 
//读SD卡
//buf:数据缓存区
//sector:扇区
//cnt:扇区数
//返回值:0,ok;其他,失败.
u8 SD_ReadDisk(u8*buf,u32 sector,u8 cnt)
{
	u8 r1;
	if(SD_Type!=SD_TYPE_V2HC)sector <<= 9;//转换为字节地址
	if(cnt==1)
	{
		r1=SD_SendCmd(CMD17,sector,0X01);//读命令
		if(r1==0)//指令发送成功
		{
			r1=SD_RecvData(buf,512);//接收512个字节	   
		}
	}else
	{
		r1=SD_SendCmd(CMD18,sector,0X01);//连续读命令
		do
		{
			r1=SD_RecvData(buf,512);//接收512个字节	 
			buf+=512;  
		}while(--cnt && r1==0); 	
		SD_SendCmd(CMD12,0,0X01);	//发送停止命令
	}   
	SD_DisSelect();//取消片选
	return r1;//
}
//写SD卡
//buf:数据缓存区
//sector:起始扇区
//cnt:扇区数
//返回值:0,ok;其他,失败.
u8 SD_WriteDisk(u8*buf,u32 sector,u8 cnt)
{
	u8 r1;
	if(SD_Type!=SD_TYPE_V2HC)sector *= 512;//转换为字节地址
	if(cnt==1)
	{
		r1=SD_SendCmd(CMD24,sector,0X01);//读命令
		if(r1==0)//指令发送成功
		{
			r1=SD_SendBlock(buf,0xFE);//写512个字节	   
		}
	}else
	{
		if(SD_Type!=SD_TYPE_MMC)
		{
			SD_SendCmd(CMD55,0,0X01);	
			SD_SendCmd(CMD23,cnt,0X01);//发送指令	
		}
 		r1=SD_SendCmd(CMD25,sector,0X01);//连续读命令
		if(r1==0)
		{
			do
			{
				r1=SD_SendBlock(buf,0xFC);//接收512个字节	 
				buf+=512;  
			}while(--cnt && r1==0);
			r1=SD_SendBlock(0,0xFD);//接收512个字节 
		}
	}   
	SD_DisSelect();//取消片选
	return r1;//
}	   
























	  






