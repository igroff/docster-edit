.PHONY: watch build site_structure ck_editor

watch: build
	gulp
	cd site && python -m SimpleHTTPServer

build: ckeditor site_structure
	cp ./src/index.html ./site

ckeditor: site_structure
	cp ./src/js/ckeditor/styles.js ./site/ckeditor/
	cp ./src/js/ckeditor/lang/en.js ./site/ckeditor/lang/
	cp -R ./src/js/ckeditor/skins/moono/* ./site/ckeditor/skins/moono/
	cp ./src/js/ckeditor/contents.css ./site/ckeditor/

site_structure: clean
	mkdir -p ./site/ckeditor/lang
	mkdir -p ./site/ckeditor/lang
	mkdir -p ./site/ckeditor/skins/moono

clean:
	rm -rf ./site/
