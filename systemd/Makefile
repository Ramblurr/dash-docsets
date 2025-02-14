BUILD := build
DOCSET := $(BUILD)/systemd.docset
TGZ := $(BUILD)/systemd.tgz
SRC := $(BUILD)/html

all: tgz
tgz: $(TGZ)

clean:
	rm -rf $(TGZ) $(DOCSET) $(BUILD)/result $(BUILD)/result-man $(BUILD)


$(SRC):
	mkdir -p $(BUILD)
	nix build --impure --out-link $(BUILD)/result --expr 'with import <nixpkgs> {}; systemd.overrideAttrs ({ mesonFlags, ... }: { mesonFlags = mesonFlags ++ [ "-Dhtml=enabled" ]; })'
	cp -r $(BUILD)/result/share/doc/systemd/html $(SRC)
	sudo chown -R $(USER):$(USER) $(SRC) && sudo chmod u+rw -R $(SRC)

$(DOCSET): $(SRC)
	cd $(dir $@) \
	dashing build --source $(SRC) --config ../dashing.json


$(TGZ): $(DOCSET)
	cd $(dir $@) \
	&& tar --exclude='.DS_Store' -czf $(notdir $@) $(patsubst %.tgz,%.docset,$(notdir $@))

install:
	rm -rf ~/.var/app/org.zealdocs.Zeal/data/Zeal/Zeal/docsets/systemd.docset && cp -r systemd.docset ~/.var/app/org.zealdocs.Zeal/data/Zeal/Zeal/docsets/


