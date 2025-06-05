# Personal AutoHotkey Hotkey Configuration

## Application Launchers

### Basic App Shortcuts
- `Alt + N`: Open Notepad
- `Alt + B`: Open Microsoft Edge
- `Alt + C`: Open Visual Studio Code
- `Ctrl + Alt + T`: Open Command Prompt at user's home directory
- `Ctrl + Alt + Q`: Open QMK MSYS

### Apps Key Shortcuts (Global)
- `Apps + 1`: Open File Explorer
- `Apps + 2`: Open Microsoft Edge
- `Apps + 3`: Open Visual Studio Code
- `Apps + 4`: Open Autodesk Fusion 360
- `Apps + 5`: Open PrusaSlicer
- `Apps + 6`: Open QMK MSYS
- `Apps + 7-0`: Open Notepad (multiple instances)

### Apps Key Shortcuts (Microsoft Edge Only)
When Microsoft Edge is active:
- `Apps + 1`: Navigate to Google
- `Apps + 2`: Navigate to Google Docs
- `Apps + 3`: Navigate to Google Drive
- `Apps + 4`: Navigate to YouTube
- `Apps + 5-9`: Open Notepad
- `Apps + 0`: Navigate to localhost/phpmyadmin

### Quick Website Access
- `Ctrl + Alt + S`: Open Moodle and Google Docs in Edge

## File Explorer & Directory Navigation

### Quick Directory Access
- `Win + Alt + A`: Open Archive folder
- `Win + Alt + C`: Open Screenshots folder
- `Win + Alt + D`: Open Downloads folder
- `Win + Alt + P`: Open Pictures folder

### File Explorer Utilities
- `Ctrl + F2`: Toggle hidden files visibility in File Explorer
- `Shift + Alt + C`: Open current File Explorer directory in VS Code
- `Ctrl + Alt + Shift + T`: Open Command Prompt at current File Explorer location

### File Renaming Tools (File Explorer Only)
- `Ctrl + Alt + Shift + R`: Rename multiple selected files with numbering
- `Ctrl + Alt + Shift + P`: Add prefix to selected file names
- `Ctrl + Alt + Shift + S`: Add suffix to selected file names

## Text Editing & Selection

### Text Selection Shortcuts (Non-VS Code)
- `Ctrl + L`: Select entire current line
- `Ctrl + D`: Select current word under cursor

### Text Deletion Shortcuts
- `Ctrl + Shift + Delete`: Delete entire current line
- `Ctrl + Shift + Backspace`: Delete entire current line
- `Shift + Delete`: Delete word to the right of cursor
- `Shift + Backspace`: Delete word to the left of cursor

### Date & Time Insertion
- `]FullDate`: Insert full date format (e.g., "Mon 09 Dec 2024.")
- `]ND`: Insert numeric date (DD/MM/YYYY)
- `]CD`: Insert current day name
- `]Time`: Insert current time (HH:MM:SS)

### Text Expansion & Auto-Corrections
#### Common Shortcuts
- `btw` → `by the way`
- `]email` → `saidmrini2019@gmail.com`
- `idk` → `I don't know`

#### Contraction Auto-Corrections
- `dont` → `don't`
- `isnt` → `isn't`
- `wasnt` → `wasn't`
- `werent` → `weren't`
- `wouldnt` → `wouldn't`
- `shouldnt` → `shouldn't`
- `couldnt` → `couldn't`
- `didnt` → `didn't`
- `doesnt` → `doesn't`
- `hasnt` → `hasn't`
- `havent` → `haven't`
- `hadnt` → `hadn't`
- `cant` → `can't`
- `couldve` → `could've`
- `shouldve` → `should've`
- `wouldve` → `would've`

## Auto-Wrap Functionality

Automatically wraps selected text or positions cursor for typing:
- `"`: Wrap in double quotes
- `'`: Wrap in single quotes
- `{`: Wrap in curly braces
- `(`: Wrap in parentheses
- `[`: Wrap in square brackets
- `<`: Wrap in angle brackets

*Note: Disabled in Adobe Illustrator and VS Code*

## Keyboard Remapping & Navigation

### CapsLock Modifications
- `Shift + CapsLock`: Toggle CapsLock on/off
- `CapsLock`: Alt + Tab (window switcher)
- `Ctrl + CapsLock`: Windows + Shift + S (screenshot tool)
- `CapsLock` (in typing practice): Move cursor left by word

### Enhanced Movement
- `Ctrl + Shift + Up`: Move up 5 lines
- `Ctrl + Shift + Down`: Move down 5 lines

## Scrolling & Volume Control

### Enhanced Scrolling
- `Shift + Wheel Up/Down`: Adaptive scrolling (fast scroll or single line based on timing)
- `Shift + Wheel Left/Right`: Adaptive horizontal scrolling

### Volume Control
- `Ctrl + Alt + Wheel Up`: Volume up (or scroll if quick)
- `Ctrl + Alt + Wheel Down`: Volume down (or scroll if quick)
- `Ctrl + Alt + Middle Click`: Mute/unmute

## Web & Search Utilities

### Search & Navigation
- `Ctrl + Alt + G`: Search selected text on Google
- `Ctrl + Alt + Win + S`: Open copied link in new browser tab
- `Ctrl + Shift + D`: Download file from copied URL with smart naming and path detection

## Fusion 360 Specific Controls

- `Ctrl + Shift + Z`: Redo (maps to Ctrl + Y)
- `XButton2` (mouse side button): Pan view (Shift + Middle Mouse)
- `XButton1` (mouse side button): Cancel/Escape

## AutoHotkey Script Management

- `Ctrl + Alt + ,`: Suspend/resume all hotkeys
- `Ctrl + Alt + .`: Reload the script
- `Ctrl + Alt + -`: Edit the script file

## Advanced Features

### Smart Text Detection
- Auto-wrap functions detect if text is selected and behave accordingly
- If text is selected: wraps the selection
- If no selection: inserts brackets and positions cursor inside

### Touchpad Optimization
- Scroll functions include timing detection to differentiate between touchpad and mouse wheel usage
- Provides different scroll speeds based on input method

### Download Utility Features
- Automatically extracts filename from URL
- Handles special characters and spaces in filenames
- Creates unique filenames if file already exists
- Uses system default download folder
- Provides success notification with option to open download folder

## Installation and Usage

1. Ensure AutoHotkey v2.0 is installed
2. Save the script with a `.ahk` extension
3. Run the script to activate all hotkeys
4. Customize hotkeys by editing the script file

## Notes

- Some shortcuts are context-sensitive and only work in specific applications
- The script includes error handling for most functions
- File operations include safety checks to prevent data loss
- All hotkeys can be suspended temporarily using `Ctrl + Alt + ,`

## Customization

Modify the script directly to change hotkey behaviors or add new functionality. The script is well-commented for easy understanding and modification.

## License

[CC BY-NC License](https://creativecommons.org/licenses/by-nc/4.0/)

## Author

Said Mrini

---

*For issues, suggestions, or improvements, please contact the author.*