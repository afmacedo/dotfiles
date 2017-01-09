SOURCE		:= $(CURDIR)
TARGET		:= $(HOME)
FILES		:= git-prompt.sh bash_aliases vimrc bash_profile bashrc bash_functions gitconfig gitignore slate inputrc

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

clean_dotfiles:
	@-for f in $(FILES); do \
		unlink $(TARGET)/.$$f; \
	done
	@rm -rf $(TARGET)/.vim/colors

install: install_dotfiles

clean: clean_dotfiles
