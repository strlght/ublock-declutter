VPATH = filters

TARGET_NAME := all
FILTERS_DIR := ./filters

SRCS := $(shell find $(FILTERS_DIR) -name '*.txt')

$(FILTERS_DIR)/$(TARGET_NAME).txt: $(SRCS)
	@echo "Generating $@..."
	@touch "$@"
	@sed -r "s/^! Last modified:/! Last modified: $(shell date -Ru)/g" helpers/header.txt >>"$@"
	@grep -h "^[^!;]" $^ >>"$@"

.PHONY: clean
clean:
	@rm -f $(FILTERS_DIR)/all.txt
