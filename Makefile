.PHONY: serve build site_structure ck_editor

watch:
	./node_modules/.bin/supervisor -x bash -- -c 'exec make serve'

serve: build
	cd site && exec python -m SimpleHTTPServer

build: ckeditor site_structure
	gulp
	cp ./src/index.html ./site

ckeditor: site_structure
	cp ./lib/ckeditor/styles.js ./site/ckeditor/
	cp ./lib/ckeditor/lang/en.js ./site/ckeditor/lang/
	cp -R ./lib/ckeditor/skins/moono/* ./site/ckeditor/skins/moono/
	cp ./lib/ckeditor/contents.css ./site/ckeditor/

site_structure: clean
	mkdir -p ./site/ckeditor/lang
	mkdir -p ./site/ckeditor/lang
	mkdir -p ./site/ckeditor/skins/moono

clean:
	rm -rf ./site/
