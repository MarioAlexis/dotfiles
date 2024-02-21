# Table Of Content
* [Download Font](#download-font)
* [Install zsh](#install-zsh)
* [Install oh-my-zsh](#install-oh-my-zsh)
* [Install powerlevel10k](#install-powerlevel10k)
* [Download dotfiles](#download-dotfiles)

## Download Font
The font recommended for p10k is `MesloLGS NF`.

Download & install the font in [here](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k).

**NOTE:** Make sure to set the correct font in your terminal or VSCode


## Install zsh
<details linux>
  <summary>Intall on Linux</summary>

  ```bash
  sudo apt install zsh
  ```

  Make zsh default shell
  ```bash
  chsh -s $(which zsh)
  ```
</details>

---

<details macos>
  <summary>Install on MacOs</summary>
  Install Homebrew
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

  Add `brew` into user PATH
  ```bash
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
  ```
  ```bash
  eval "$(/opt/homebrew/bin/brew shellenv)"
  ```

  Install zsh
  ```bash
  brew install zsh
  ```

  Set zsh as your default shell.
  * For m1 macs:
    ```bash
      chsh -s /opt/homebrew/bin/zsh
    ```

  Verify installation
  ```bash
  zsh --version
  ```
</details>

---


## Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Download dotfiles
```bash
bash -c "$(curl -sL --proto-redir -all,https https://raw.githubusercontent.com/MarioAlexis/dotfile/master/install.sh)"
```

## VIM oneliner
```bash
echo "color desert|set nu|set et|set ts=4|set nowrap|set hls|set is|set pt=<F2>|inoremap jk <esc>" > ~/.vimrc
```
## Alias oneliner
```bash
echo -n "alias ll='ls -hal'\nalias ..='cd ..'" >> ~/.bashrc && source ~/.bashrc
```

## Install Python version with PYENV
Install `pyenv`
```bash
curl https://pyenv.run | bash
```
The installation creates `$HOME/.pyenv` directory which is then detected by the _doftiles install script_ to setup corresponding env vars.

List all available Python version
```bash
pyenv install --list
```

**NOTE**: At this point, `dotfiles install` script has been already executed.
Install a specific Python version
```bash
pyenv install 3.8
```

Ensure to set the correct Python version for your project directory
```bash
pyenv local 3.8
```

Create your Python virtual env using `pyenv`
```bash
pipenv --python $(pyenv which python)
```
This command tells `pipenv` to use the Python interpreter that `pyenv` has set for the current directory.
Python interpreter specified by the .python-version file.