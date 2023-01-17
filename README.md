# My Neovim Config
![nvim](~/nvim.png) 

### Introduction
Run checkhealth in your Neovim
```vim
:checkhealth
```
Make sure you analyzed the output properly: 
- Your neovim must be >= 0.7.0 to run this config ✅
- You need to setup [Packer](https://github.com/wbthomason/packer.nvim)
```vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
- You should install global python provider ✅
```python
pip install pynvim
```
- You should install clipboard tool (I use xclip but you can use something diffrent) ✅

### Installation
> Easy way

You can just clone this repo to your .config folder

```bash
git clone https://github.com/dsrcr/nvim ~/.config
```
> Recommended way

I use gnu-stow to manage my dotfiles, so I encourage you to use it too.

Use your package manage of choice to get stow, for example: 

```bash
paru -S stow
```
Clone this repo to your prefered dir and use stow to symlink

In order to do this you need an empty nvim directory in your .config folder
```bash
cd ~/.config
mkdir nvim
cd ~/yourDirectory
git clone https://github.com/dsrcr/nvim
stow -d ~/yourDirectory -t ~/.config/nvim nvim/

```

The last step is running this command in your neovim

```vim
:PackerSync
```
This command should pull everything you need
