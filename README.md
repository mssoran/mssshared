# mssshared

Some useful scripts and other utilities that I use daily. 

Used with Mac and not tested in different environments, but should work with no or limited change.

Scripts under `bin` directory or mostly self explanatory and have usage/help as part of the script.

# Usage
- Clone the repository
  ```sh
  cd $HOME
  git clone https://github.com/mssoran/mssshared.git
  ```
- Set `MSS_SHARED` var in your shell's initialization script (.zshrc, .bashrc etc)
  ```sh
  # assuming repository is cloned under $HOME/mssshared
  export MSS_SHARED=$HOME/mssshared
  ```
- Add `bin` directory to your `PATH` for easy usage
  ```sh
  export PATH=$PATH:$MSS_SHAREDPATH/bin
  ```
