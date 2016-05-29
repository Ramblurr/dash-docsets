SETS := $(patsubst docsets/%,%,$(wildcard docsets/*.docset))
FEEDS := $(SETS:.docset=.tgz)

.PHONY: feeds

%.tgz: docsets/%.docset
	@echo "Archiving $(<F)..."
	@tar -C docsets --exclude='.DS_Store' -czf feeds/$@ $(<F)

feeds: $(FEEDS)
	@echo Done.

clean:
	rm -rf feeds/*.tgz


