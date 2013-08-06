SOURCE		:= $(CURDIR)
TARGET		:= $(HOME)
FILES		:= aliases vim vimrc bash_profile bashrc functions gitconfig gitignore 

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
