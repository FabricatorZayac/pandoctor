SRCS     := $(shell find . -name "*.md" $(shell printf "! -name %s " $(IGNORE)))
TARGETS  := $(SRCS:%.md=%.html)

.PHONY: all clean serve

all: $(TARGETS)

%.html: %.md $(TEMPLATE)
	pandoc --template=$(TEMPLATE) $< -o $@

# DON'T USE OUTSIDE OF PAGES DEPLOYMENT
purge-deploy: all
	rm -f $(SRCS)
 
