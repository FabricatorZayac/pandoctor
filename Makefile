SRCS     := $(shell find . -name "*.md" $(shell printf "! -name %s " $(IGNORE)))
TARGETS  := $(SRCS:%.md=%.html)

.PHONY: all clean serve

all: $(TARGETS)

%.html: %.md $(TEMPLATE)
	@if [ $(TEMPLATE) = "" ]; then\
		pandoc $< -o $@;\
	else\
		pandoc $< --template=$(TEMPLATE) --metadata title="..." -o $@;\
	fi

# DON'T USE OUTSIDE OF PAGES DEPLOYMENT
purge-deploy: all
	rm -f $(SRCS)
 
