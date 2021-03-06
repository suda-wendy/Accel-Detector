s��         Ph     O  T   �     QX                                           File Browser                                     � ��char **  �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<p class="Body">This instrument driver contains functions for creating and configuring file browsers.</p>

<p class="Body">A file browser is a tree�based method of browsing and selecting files in your computer. Use file browser attributes to customize browser features, such as start paths and file filters. You also can specify whether to browse only directories or whether to browse only selected drives.</p>


</body>
</html>
      �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Create</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<h1 class="function">FileBrowser_Create</h1>

<p class="syntax">int FileBrowser_Create (int panel, int control, char *startPath);</p>

<h2 class="purpose">Purpose</h2>
<p class="Body">Creates a new file browser from an existing tree control.</p>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Create</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">panel</td>
<td class="paramDataType">integer</td>

<td>The handle of the panel for the file browser.</td>
</tr>
</table>

</body>
</html>
        <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Create</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">control</td>
<td class="paramDataType">integer</td>

<td>The ID of a tree control to convert into a file browser. This control must exist on the panel identified by the <strong>panel</strong> parameter.</td>
</tr>
</table>

</body>
</html>
    $    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Create</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">startPath</td>
<td class="paramDataType">char&nbsp;*</td>

<td>The path that the file browser uses as its root. Refer to the documentation for <span class="Monospace">ATTR_START_PATH</span> in the <strong>attribute</strong> parameter of the <span class="Monospace"><a href="javascript:LaunchMergedHelp('cvi.chm', 'toolslib.chm', 'FunctionReference/cviFileBrowser_SetAttribute.htm')">FileBrowser_SetAttribute</a></span> function panel for the supported formats of the string.</td>
</tr>
</table>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Create</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">status</td>
<td class="paramDataType">integer</td>

<td>Return value that indicates whether the function was successful. A negative number indicates that an error occurred. Call the <span class="Monospace"><a href="javascript:LaunchMergedHelp('cvi.chm', 'toolslib.chm', 'FunctionReference/cviGetGeneralErrorString.htm')">GetGeneralErrorString</a></span> toolbox function to get a descriptive error message.</td>
</tr>
</table>

</body>
</html>
    ( 0 (      x    Panel                             � 0 �     x    Control                           � 0w    �    Start Path                        &}��    x    Status                                     ROOT_LEVEL_STRING    	           �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_SetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<h1 class="function">FileBrowser_SetAttribute</h1>

<p class="syntax">int FileBrowser_SetAttribute (int panel, int control, int attribute, . . .);</p>

<h2 class="purpose">Purpose</h2>
<p class="Body">Sets the specified file browser attribute.</p>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_SetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">panel</td>
<td class="paramDataType">integer</td>

<td>The handle of the panel for the file browser.</td>
</tr>
</table>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_SetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">control</td>
<td class="paramDataType">integer</td>

<td>The ID of the file browser.</td>
</tr>
</table>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_SetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">status</td>
<td class="paramDataType">integer</td>

<td>Return value that indicates whether the function was successful. A negative number indicates that an error occurred. Call the <span class="Monospace"><a href="javascript:LaunchMergedHelp('cvi.chm', 'toolslib.chm', 'FunctionReference/cviGetGeneralErrorString.htm')">GetGeneralErrorString</a></span> toolbox function to get a descriptive error message.</td>
</tr>
</table>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_SetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">attribute</td>
<td class="paramDataType">integer</td>

<td>The <a href="javascript:LaunchMergedHelp('cvi.chm','toolslib.chm','ListOfFileBrowserAttrs.html')">File Browser attribute</a> value to set.<br><br>

In the function panel, when you click the control or press &lt;Enter&gt;, &lt;Spacebar&gt;, or &lt;Ctrl-down arrow&gt;, a dialog box appears containing a hierarchical list of the available attributes. Attributes whose values cannot be obtained are dimmed. Help text is shown for each attribute. To select an attribute, double-click it or select it and then press &lt;Enter&gt;.<br><br>

If the attribute shown in this ring control has named constants as valid values, you can open a list of them by moving to the Attribute Value control and pressing &lt;Enter&gt;. The Attribute Values dialog box displays the values and value help for the constants.
</td>
</tr>
</table>

</body>
</html>
    F    <html>
<head>
<script src="launchhelp.js"></script>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_SetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">attributeValue</td>
<td class="paramDataType">any&nbsp;type (passed by value)</td>

<td>The value of the specified <a href="javascript:LaunchMergedHelp('cvi.chm','toolslib.chm','ListOfFileBrowserAttrs.html')">File Browser attribute</a>.<br><br>

If the attribute shown in this control has named constants as valid values, you can open a list of them by pressing &lt;Enter&gt;. The Attribute Values dialog box displays the values and value help for the constants.</td>
</tr>
</table>



</body>
</html>
     . (      x    Panel                             � . �     x    Control                           u���    x    Status                            c +C    �    Attribute                         ; ~ (    x    Attribute Value                            	                        0       	    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<h1 class="function">FileBrowser_GetAttribute</h1>

<p class="syntax">int FileBrowser_GetAttribute (int panel, int control, int attribute, void *attributeValue);</p>

<h2 class="purpose">Purpose</h2>
<p class="Body">Gets the specified file browser attribute.</p>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">panel</td>
<td class="paramDataType">integer</td>

<td>The handle of the panel for the file browser.</td>
</tr>
</table>

</body>
</html>    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">control</td>
<td class="paramDataType">integer</td>

<td>The ID of the file browser.</td>
</tr>
</table>

</body>
</html>    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">status</td>
<td class="paramDataType">integer</td>

<td>Return value that indicates whether the function was successful. A negative number indicates that an error occurred. Call the <span class="Monospace"><a href="javascript:LaunchMergedHelp('cvi.chm', 'toolslib.chm', 'FunctionReference/cviGetGeneralErrorString.htm')">GetGeneralErrorString</a></span> toolbox function to get a descriptive error message.</td>
</tr>
</table>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">attribute</td>
<td class="paramDataType">integer</td>

<td>The <a href="javascript:LaunchMergedHelp('cvi.chm','toolslib.chm','ListOfFileBrowserAttrs.html')">File Browser attribute</a> value to obtain.<br><br>

In the function panel, when you click the control or press &lt;Enter&gt;, &lt;Spacebar&gt;, or &lt;Ctrl-down arrow&gt;, a dialog box appears containing a hierarchical list of the available attributes. Attributes whose values cannot be obtained are dimmed. Help text is shown for each attribute. To select an attribute, double-click it or select it and then press &lt;Enter&gt;.<br><br>

If the attribute shown in this ring control has named constants as valid values, you can open a list of them by moving to the Attribute Value control and pressing &lt;Enter&gt;. The Attribute Values dialog box displays the values and value help for the constants.
</td>
</tr>
</table>

</body>
</html>
    2    <html>
<head>
<script src="launchhelp.js"></script>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetAttribute</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">attributeValue</td>
<td class="paramDataType">void&nbsp;*</td>

<td>The value of the specified <a href="javascript:LaunchMergedHelp('cvi.chm','toolslib.chm','ListOfFileBrowserAttrs.html')">File Browser attribute</a>.<br><br>

If the attribute shown in this control has named constants as valid values, you can open a list of them by pressing &lt;Enter&gt;. The Attribute Values dialog box displays the values and value help for the constants.</td>
</tr>
</table>



</body>
</html>
    #� . (      x    Panel                             %� . �     x    Control                           '3���    x    Status                            *! .C    �    Attribute                         .� ~ (    x    Attribute Value                            	                        0       q    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetSelectedFiles</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<h1 class="function">FileBrowser_GetSelectedFiles</h1>

<p class="syntax">int FileBrowser_GetSelectedFiles (int panel, int control, char ***files);</p>

<h2 class="purpose">Purpose</h2>
<p class="Body">Gets the current list of selected files and directories in the file browser. Depending on the <span class="Monospace">ATTR_PATH_RELATIVE</span> attribute, the list contains absolute paths or paths relative to the starting path of the file browser. The function sets the <strong>files</strong> parameter to point to an array of strings. The caller frees all of the strings and the array that contains the strings.</p>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetSelectedFiles</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">panel</td>
<td class="paramDataType">integer</td>

<td>The handle of the panel for the file browser.</td>
</tr>
</table>

</body>
</html>    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetSelectedFiles</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">control</td>
<td class="paramDataType">integer</td>

<td>The ID of the file browser.</td>
</tr>
</table>

</body>
</html>    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetSelectedFiles</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">status</td>
<td class="paramDataType">integer</td>

<td>Return value that indicates whether the function was successful. A negative number indicates that an error occurred. Call the <span class="Monospace"><a href="javascript:LaunchMergedHelp('cvi.chm', 'toolslib.chm', 'FunctionReference/cviGetGeneralErrorString.htm')">GetGeneralErrorString</a></span> toolbox function to get a descriptive error message.</td>
</tr>
</table>

</body>
</html>
    u    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_GetSelectedFiles</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">files</td>
<td class="paramDataType">char&nbsp;***</td>

<td>Buffer that contains an array of strings in which each string is the name of one of the files or directories selected. The last element of the array is a NULL pointer. The caller frees all of the strings and the array that contains the strings.<br><br>

The following example illustrates how to free each string in the file list and then free the file list array itself.<br><br>


<p class="code">char **files = NULL;</p>
<p class="code">int status;</p>
<p class="code">int i;</p><br>

<p class="code">status = FileBrowser_GetSelectedFiles (panel, control, &amp;files);</p>

<p class="code">if (status &gt;= 0) {</p>
<p class="code1">if (files) {</p>
<p class="code2">for(i=0; files[i] != NULL; i++) {</p>
<p class="code3">printf (&quot;Selected File : %s\n&quot;, files[i]);</p>
<p class="code3">free (files[i]);</p>
<p class="code3">files[i] = NULL;</p>
<p class="code2">}</p>
<p class="code2">free (files);</p>
<p class="code2">files = NULL;</p>
<p class="code1">}</p>
<p class="code">}</p>

</td>
</tr>
</table> 

</body>
</html>
    6� 3 (      x    Panel                             8� 3 �     x    Control                           :P|��    x    Status                            =B 3~ �  x    Files                                      	            	           1    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Refresh</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<h1 class="function">FileBrowser_Refresh</h1>

<p class="syntax">int FileBrowser_Refresh (int panel, int control, int index);</p>

<h2 class="purpose">Purpose</h2>
<p class="Body">Refreshes a section of the file browser to make sure that this section is the same as the state of the file system on disk.</p>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Refresh</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">panel</td>
<td class="paramDataType">integer</td>

<td>The handle of the panel for the file browser.</td>
</tr>
</table>

</body>
</html>    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Refresh</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">control</td>
<td class="paramDataType">integer</td>

<td>The ID of the file browser.</td>
</tr>
</table>

</body>
</html>    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Refresh</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">status</td>
<td class="paramDataType">integer</td>

<td>Return value that indicates whether the function was successful. A negative number indicates that an error occurred. Call the <span class="Monospace"><a href="javascript:LaunchMergedHelp('cvi.chm', 'toolslib.chm', 'FunctionReference/cviGetGeneralErrorString.htm')">GetGeneralErrorString</a></span> toolbox function to get a descriptive error message.</td>
</tr>
</table>

</body>
</html>
    �    <html>
<head>
<script src="launchhelp.js"></script>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<title>FileBrowser_Refresh</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>
<table class=borderless><TR>

     <td class="paramName">index</td>
<td class="paramDataType">integer</td>

<td>The starting point of the refresh action. The descendants of the item at the specified index are refreshed.</td>
</tr>
</table>  

</body>
</html>
    E� 3 (      x    Panel                             G� 3 �     x    Control                           IH���    x    Status                            L1 3�     x    Index                                      	             ����         .       K.    FileBrowser_Create              ����            �     K.    FileBrowser_SetAttribute        ����         !�  26     K.    FileBrowser_GetAttribute        ����         3i  B�     K.    FileBrowser_GetSelectedFiles    ����         C�  N(     K.    FileBrowser_Refresh                    �                                     DNew File Browser                     DSet File Browser Attribute           DGet File Browser Attribute           DGet Selected Files                   DRefresh File Browser                  toolbox.fp 