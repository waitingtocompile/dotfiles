## A quick foreword
This isn't going to be comprehensive, there's a few specifics and niche things that I'm not covering. This is the stuff that I consider fundamental and that I use a lot
It's also a blend of "normal" nvim stuff, and things that are specific to the configuration I've given you. I'll try to make it clear where I can.
While this intro is for nvim *almost* all of it can also be applied to "old" vim, obviously excluding all my fun custom fiddles.
Nvim commands and hotkeys are case sensitive, if I show a captial it means you need to be holding down shift

Do not, my friends, become addicted to vim. It will take hold of you, and you will resent its absence!

## Modes
There's a ton of different modes in vim. Some of these are going to have their own breakdown, but the broad strokes are:
 - Normal Mode - this is the default mode of vim, think of it as the "hotkey" mode. Almost all of the key bindings are for normal mode. You can almost always get back to normal mode with ESC
 - Insert Mode - this is where you actually type text. Pressing `i` or `a` put you into insert mode at the current cursor position (with `a` putting you "after" the cursor, and `i` putting you before it)
 - Visual Mode - this mode is all about selecting regions of text. Enter it with `v`. This is mostly for doing large copy/delete operations
 - Command Mode - this one isn't really a mode, but instead while you in normal, visual, or a few other modes, `:` starts enterting commands. 
 - Search Mode - again, not really a mode but functions like command mode when you press `/`
 - Block Modes - A few modes have special "block" versions, specifically Insert and Visual, that let you do large scale edits across many lines

The bottom bar, called the "airline" shows what mode you're in on the left, and changes colour based on the mode

## Moving Around
When in normal or visual mode, you can use `hjkl` to move around the document, arrow keys also work, and arrows still work in insert mode as well
You also have some other options:
 - `w` jumps you forward one word at a time
 - `e` does the same, but at the ends of words
 - `b` jumps you backwards one word at a time
 - `%` when over a bracket jumps you to the corresponding bracket
 - `gg` jumps you to the start of the document
 - `GG` jumps you to the end of the document
 - Typing in a number and then pressing any navigation key will move you by that amount (`4j` would move you four lines down, `2w` would move you forward two lines)
 - Directly entering a number as a command jumps you to that line number (`:69` would take you straight to line 69)

## Splits and tabs
Vim inherently supports splits and tabs, but it's slow and lazy so I added some nice hotkeys for them
 - `,tn` opens a new empty tab
 - `,t,` jumps to the next tab
 - `,tl` jumps to the previous tab
 - `,to` closes all other tabs
 - `,s,` splits side-by-side
 - `,ss` splits above-and-below
 - CTRL and `hkjl` move between splits (including the file browser if it's open)
ALL of these are custom keybindings

## General file operations
There's special hotkeys or quick commands for just about every simple operation you can think of
 - `:q` exits the current file, prompting to ask if you want to save if there's changes
 - `:q!` exists without saving
 - `:w` saves the current file, you can also give it a name to save as a particular file, e.g `:w readme.md`
 - `:x` or `:wq` saves and exits
 - `x` deletes the character under the cursor, or the entire selection in visual mode
 - `r` replaces the character under the cursor with the next key pressed.
 - `p` pastes the current clipboard

Some operations use a couple of keys in concert with each other. The first key is the kind of operation to perform, the following determines what on. Generally, this means navigation keys.
 - `d` deletes the area covered by the navigation `d2w` deletes two words foward, `dd` deletes the current line. Deleting this way always puts the removed character into the clipboard
 - `y` yanks (copies) the area covered by the naviation into the clipboard. `y3y` yanks the current line and the two after it.
Using either of these in visual mode just applies to the current selection instantly instead of neading some navigation aread defined

Vim's clipboard is seperate from the system clipboard. You can use `,y` to copy the current selection to the system, and `,p` to paste from the system cliboard. (these are both my own custom bindings)

## Find and replace
If you want to search the current file for some particular term, you can press `/` to start searching, and press enter to "lock in" that search. Every instance of that term is highligted, and you can jump to to the next one with `n`. You can enter `,/` to clear the search highlights.

Search and replace uses the `:s` command, it's tedious to esplain all it's mintua here, but it works very well and there's a good explanation at https://vim.fandom.com/wiki/Search_and_replace
Added bonus: you now have the cursed knowledge that there's a vim fandomwiki

## File browser
While nvim does have a built in file browser, it sucks ass. Fortunately, one of our addons gives us a very nice filebrowser we can use. If you open vim in a folder, and when you open a new tab, it will be shown on the left by default. You can toggle it on and off with `,e`. You can enter and leave it like any split panel, and navigate around it with `hjkl` or arrow keys. Enter opens the selected file in the current tab (if you have multiple split panels, it'll prompt you for which one to open
it in), or unfold that folder. There's also, as always, a bunch of other useful hotkeys:
 - `r` to rename the selected file
 - `y` to copy the filename to clipboard
 - `Y` to copy the relative file path to clipboard
 - `gy` to copy the absoulte file path to clipboard
 - `d` to delete the selected file
 - `s` to open a file in the system default application (as if you'd opened it from windows explorer)
 - CTRL`v` to open the file in a new side-by-side split
 - CTRL`x` to open the file in a new above-and-below split
 - CTRL`t` to open the file in a new tab
 - `I` to toggle visibility of system hidden files
 - `H` to toggle visibility of dotfiles
 - `R` refreshes the tree (it doesn't always keep updated properly across multiple windows and tabs)

## Block select and multi-line edit
Pressing CTRL`v` puts you into visual block mode, to select blocks without caring about line wrapping. You can copy, delete, etc entire blocks in one go.
If you select multiple lines in visual block mode, you can press `I` to enter a multi line insert. Once you exit the insert mode, whatever you've typed will be addded to every line you had selected

## Git Integration
Nvim doesn't have any inbuilt git integration, however an extension called fugitive provides full git integration. The `:G` command runs any normal git command in the current directory (for instance `:G push origin main`).
We also see git information in our airline, showing our current branch and if we have uncommited changes, and in the file browser file icons will indicate their current git status

## Virtual console
You can run any arbitrary console command in the current location by using `:!`. For instance `:!nmp run build-main` to run a particular npm script.

## Plugins
There's quite a few plugins in use here, the file browser, git integration, airline, and so on. Plug handles those. You can install new plugins by adding them to the list at the start of the init.vim file, and then running `:PlugInstall`. You can also update things with `:PlugUpdate`, though be careful since some developers like to play it fast and loose with breaking changes.

## Other bits
Just a couple of other nice details that don't fit anywhere else
 - Currently nvim auto extends tabs into four spaces. You can change this in the init.vim file, just search for "INDENTATION" and you should find it
 - `,rc` instantly opens the init.vim file to edit, which can be helpful
 - If you make changes to init.vim, nvim will try to hot-reload them when you save. It saves some time and tedium, and almost never blows up in your face
