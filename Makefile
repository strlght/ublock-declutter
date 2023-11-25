VPATH = filters

TARGET_NAME := all
FILTERS_DIR := ./filters

SRCS := $(shell find $(FILTERS_DIR) -name '*.txt')

$(FILTERS_DIR)/$(TARGET_NAME).txt: $(SRCS)
	@echo "Generating $@..."
	@touch "$@"
	@sed -r "s/^! Last modified:/! Last modified: $(date -Ru)/g" helpers/header.txt >>"$@" 2>&1
	@grep -h "^[^!;]" $^ >>"$@" 2>&1

.PHONY: clean
clean:
	@rm $(FILTERS_DIR)/all.txt
