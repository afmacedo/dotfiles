SOURCE		:= $(CURDIR)
TARGET		:= $(HOME)
FILES		:= git-prompt.sh bash_aliases vimrc bash_profile bashrc bash_functions gitconfig gitignore slate

UNAME		:= $(shell uname)

all: clean install

install_dotfiles:
	@for f in $(FILES); do \
		ln -sf $(SOURCE)/$$f $(TARGET)/.$$f; \
	done
	@mkdir -p ~/.ssh/
	@chmod 700 ~/.ssh/

clean_dotfiles:
	@-for f in $(FILES); do \
		unlink $(TARGET)/.$$f; \
	done

install: install_dotfiles

clean: clean_dotfiles
