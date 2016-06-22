Higgins
========
Yet another application launcher: start applications, search for things, do calculations or whatever you want through external plugins.

<p align="center">
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/Oxygen_collapsed.png"</img>
</p>


Internal plugins:
========
* Evaluate expressions (calculator)
* Find recently opened documents
* Find desktop applications
* Find executables
* Find local bookmarks
* Lists the content of folders
* Find files by indexing user-specified folders

External plugins:
========
higgins also supports plugins located in ~/.config/gambas3/higgins/extbin/
and since it parses the external plugin output,
the plugins can be written in any language, from bash to c++
Take a look to External_plugin_locate.sh or External_plugin_kill.sh

Fully themable:
========
You can define corner radius, background color, image, shadows and more:
<p align="center">
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/Standard.png"</img>
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/BlackFrame.png"</img>
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/BlueRounded.png"</img>
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/Chrome.png"</img>
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/oxygen.png"</img>
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/White.png"</img>
 <img src="http://wpage.unina.it/aorefice/sharevari/higgins/shots/Fresh_extraround.png"</img>
</p>

Mandatory requirements:
========
  * Gambas 3 (usually the very latest version)

Recommended tools:
========
  * xbindkeys (higgins use it to register a global X11 shortcut)


Compiling it:
========
After you installed gambas 3, just checkout and compile higgins that way:
```
# git clone https://github.com/kokoko3k/higgins.git
# cd higgins/
# /path/to/gambas/binaries/gbc3 -e -a -g -t -p -m
# /path/to/gambas/binaries/gba3
# ./higgins.gambas
```
