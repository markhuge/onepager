DIST=$(shell pwd)/dist

build: clean
	lsc -p -b -c index.ls | uglifyjs -o dist/index.js
	echo '#!/usr/bin/env node' > dist/bin/cli.js
	lsc -p -b -c bin/cli.ls >> dist/bin/cli.js
	lsc -p -b -c lib/parse-opts.ls | uglifyjs -o dist/lib/parse-opts.js
	lsc -p -b -c lib/template.ls | uglifyjs -o dist/lib/template.js
	lsc -p -b -c lib/markdown.ls | uglifyjs -o dist/lib/markdown.js

clean:
	rm -rf $(DIST) || exit 0 && mkdir -p $(DIST)/{bin,lib}

pkg:
	cp -R  $(shell pwd)/{package.json,node_modules,README.md,assets} $(DIST)

publish: clean build pkg
	cd $(DIST) && npm publish .
