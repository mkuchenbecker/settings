To get a terminal launching with a keyboard shortcut:
Go to automator and create a new automation with an applescript action.

Applescript to create a new terminal window:
```
tell application "iTerm"
	if it is running then
		create window with default profile
	end if
	activate
end tell
```


Download solarized and set it as the Iterm color pallate:
https://ethanschoonover.com/solarized/

