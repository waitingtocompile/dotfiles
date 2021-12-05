# Dotfiles
This is my standard set of dotfiles for various applications (primarily neovim). A few of these have platform specific settings, which are noted. 


### Nvim
The nvim file held is my *windows* nvim file, though it's almost identical to my linux configuration (a couple of filepaths and fonts need tweaking)

It depends on the following:
 - The droid sans mono nerd font at https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono/complete, which needs to be installed on the system
 - Plugged, from https://github.com/junegunn/vim-plug, which needs to placed in nvim's autoexecute folder

It also has a regedit file to quickly add the context menu options in windows (though the exact file path might need to be updated), and the "intro to vim" file I made for Molly
