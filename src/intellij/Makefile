DOCSET := IntelliJ

default:
	cheatset generate ${DOCSET}.rb
	rm -rf ../../docsets/${DOCSET}.docset/
	mv ${DOCSET}.docset ../../docsets/
	cp icon.png icon@2x.png ../../docsets/${DOCSET}.docset/
