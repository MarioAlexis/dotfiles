# Table Of Content
* [Terminal Setup](#terminal-setup)
  * [Download Font](#download-font)
  * [Install zsh](#install-zsh)
  * [Install oh-my-zsh](#install-oh-my-zsh)
  * [Install powerlevel10k](#install-powerlevel10k)
  * [Download dotfiles](#download-dotfiles)


# Terminal Setup
<details terminalsetup>
  <summary>Terminal Setup</summary>

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
</details>

# VIM oneliner
```bash
echo "color desert|set nu|set et|set ts=4|set nowrap|set hls|set is|set pt=<F2>|inoremap jk <esc>" > ~/.vimrc
```
# Alias oneliner
```bash
echo -n "alias ll='ls -hal'\nalias ..='cd ..'" >> ~/.bashrc && source ~/.bashrc
```

# Install Python version and setup Python virtualenv with PYENV
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

`pyenv virtualenv [python_version] [virtualenv_name]`
```bash
pyenv virtualenv 3.8 myvenv
```

Start using Python virtualenv in your project

`pyenv local [virtualenv_name]`
```bash
pyenv local myvenv
```

# Install NVM (Node Version Manager)
Run the install script
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

List available node version
```bash
nvm ls-remote
```

Install latest LTS version
```bash
nvm install --lts
```

Verify installation
```bash
node --version
```
```bash
npm --version
``