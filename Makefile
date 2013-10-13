SOURCE		:= $(CURDIR)
TARGET		:= $(HOME)
FILES		:= git-prompt.sh bash_aliases vimrc bash_profile bashrc bash_functions gitconfig gitignore slate

UNAME		:= $(shell uname)

all: clean install

install_dotfiles:
	@for f in $(FILES); do \
		ln -sf $(SOURCE)/$$f $(TARGET)/.$$f; \
	done
	@mkdir -p $(HOME)/.ssh/
	@chmod 700 $(HOME)/.ssh/
	@mkdir -p $(TARGET)/.vim/colors
	@ln -sf $(SOURCE)/easyballs.vim $(TARGET)/.vim/colors/easyballs.vim
	@ln -sf $(SOURCE)/Preferences.sublime-settings $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

clean_dotfiles:
	@-for f in $(FILES); do \
		unlink $(TARGET)/.$$f; \
	done
	@rm -rf $(TARGET)/.vim/colors
	@unlink $(HOME)/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

install: install_dotfiles

clean: clean_dotfiles
