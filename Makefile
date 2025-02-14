SETS := systemd
URL := https://ramblurr.github.io/dash-docsets/feeds

.PHONY: build $(SETS)

build: $(SETS)

$(SETS):
	@echo "Building $@..."
	$(MAKE) -C $@
