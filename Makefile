SETS := $(patsubst docsets/%,%,$(wildcard docsets/*.docset))
FEEDS := $(SETS:.docset=.tgz)
URL := https://ramblurr.github.io/dash-docsets/feeds

.PHONY: feeds

%.tgz: docsets/%.docset
	@echo "Archiving $(<F)..."
	@tar -C docsets --exclude='.DS_Store' -czf feeds/$@ $(<F)

feeds: #$(FEEDS)
	@echo "<!DOCTYPE html><ul>" > feeds/index.html
	@for feed in $(FEEDS) ; do \
		echo "<li><a href="${URL}/$$feed">$$feed</a></li>" >> feeds/index.html ; \
	done
	@echo "</ul>" >> feeds/index.html
	@echo Done.

clean:
	rm -rf feeds/*.tgz


