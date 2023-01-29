# My Neovim Configuration

This repo contains my Neovim config files as well as instructions on how to install the editor and the dependencies for this configuration.

> ⚠️  **Warning:** Some dependencies will be installed in the user install directory, so `~/.local/bin` need to be in your `$PATH`
>
> ```
> echo -e '\nexport PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
> source ~/.bashrc
> ```

> ℹ️  **Note:** In this guide we are going to install Neovim from source. If you are looking for an easier way to install the editor, [this other guide](https://github.com/neovim/neovim/wiki/Installing-Neovim) provides instructions on how to get Neovim from pre-built archives and package repositories.

## 1 Install Neovim

### 1.1 Install Dependencies

```sh
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

### 1.2 Build & Install Neovim

```sh
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
```

### 1.3 Checkhealth

Neovim ships with healthchecks to help us troubleshoot the editor configuration.

After intalling Neovim, it is a good idea to check its health. A healthcheck can tell you if there are misconfigurations, performance issues or missing dependencies.

Open the editor (`nvim` command) and run `:checkhealth`.

## 2 Install Providers

In the output generated by `:checkhealth` you may find some WARNING messages about missing (**optional**) providers. Providers are processes that communicate with Neovim and add extra features to the editor. 

Let's intall some of them!

### 2.1 Clipboard Tool

If our system doesn't have a clipboard tool installed, then Neovim will not be able to communicate with clipboard backends (including the system clipboard).

We will probably want to copy data from clipboard to Neovim and vice-versa, so let's install a clipboard tool.

```sh
sudo apt install xsel
```

### 2.2 Remote Plugins

One way of extending Neovim is by using [remote plugins](https://neovim.io/doc/user/remote_plugin.html), which are plugins that run in separate processes. Those plugins can be written in any programming language as long as there is a plugin host available for the chosen language.

I want my Neovim setup to support remote plugins written in Python and Javascript, so I'll install the providers for those two languages. `:checkhealth` has information on how to add support for other languages.

#### 2.2.1 Python Provider

To use Python remote plugins, we need to install the `pynvim` module.

```sh
python3 -m pip install --user --upgrade pynvim
```

#### 2.2.2 Node.js Provider

To use Javascript remote plugins, we need to install the `neovim` npm package.

```sh
# install node.js
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# change npm's default directory (this is to avoid permission errors)
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo -e '\nexport PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.profile
source ~/.profile 

# install the provider
npm install -g neovim
```

## 3 Install a Patched Font

Some plugins use glyphs (icons) to identify folders and files, separate sections of information, identify severity levels in diagnostics, etc. If the font used by your terminal emulator doesn't contain those glyphs, then instead of nice-looking icons you will see just weird boxes.

In the steps below we are going to install `Hack Nerd Font`, a patched font from [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts).

```sh
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts/
./install.sh Hack
```

After the installation, set `Hack` as your terminal emulator's font.

## 4 Install Telescope Dependencies

Telescope is the fuzzy finder used in this setup of Neovim. It will be installed later by a plugin manager, but some **optional** dependencies need to be installed from the command line. Let's install them now!

```sh
# install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# install fd
curl -LO https://github.com/sharkdp/fd/releases/download/v8.4.0/fd_8.4.0_amd64.deb
sudo dpkg -i fd_8.4.0_amd64.deb

# create symlink in order use fd instead of fdfind command
ln -s $(which fdfind) ~/.local/bin/fd
```

## 5 Install Language Servers

Neovim provides an LSP client, but to get LSP features we need to install the language servers (which are provided by third parties).

### 5.1 Clangd

`clangd` is a C++ language server. Run the the following commands to install it:

```sh
sudo apt install clangd-14
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-14 100
```

For more information about installation and setup, click [here](https://clangd.llvm.org/installation).

### 5.2 Pyright

`pyright` is a static type checker and language server for python. We can install it using `npm`.

```sh
npm i -g pyright
```

### 5.3 Rust Analyzer

`rust-analyzer` is an implementation of LSP for the Rust programming language. Assuming you already have Rust installed on your machine, then you can install `rust-analyzer` with the following command:

```sh
rustup component add rust-analyzer
```

### 5.4 CMake Language Server

`cmake-language-server` is a CMake LSP Implementation. Install it with the following command:

```
python3 -m pip install --user cmake-language-server
```

## 6 Install This Configuration

Clone this repo into your `stdpath('config')` directory[^1]:

```sh
git clone --depth=1 https://github.com/renanrdaros/nvimconfig.git ~/.config/nvim
```

> **Note:** The first time you run `nvim` again it will automatically install a plugin manager ([`packer.nvim`](https://github.com/wbthomason/packer.nvim)) as well as all the plugins used by this config. Just wait for the procedure to finish.

---
## References

- [Neovim Wiki - Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)
- [Neovim Wiki - Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [:h pi_health](https://neovim.io/doc/user/pi_health.html)
- [:h provider](https://neovim.io/doc/user/provider.html)
- [:h remote-plugin](https://neovim.io/doc/user/remote_plugin.html)
- [npm Docs - Resolving EACCES permissions errors...](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)
- [Nerd Fonts - Font Installation](https://github.com/ryanoasis/nerd-fonts#font-installation)
- [Telescope - Getting Started](https://github.com/nvim-telescope/telescope.nvim#getting-started)

[^1]: `~/.config/nvim` on UNIX systems.
