PROJECT_PATH=.
SRC_DIR=js/flat_ui/resources/sass
CSS_DIR=js/flat_ui/resources/css

.SUFFIXES: .sass .min.css
.sass.min.css:
	compass compile $(PROJECT_PATH) $< --sass-dir $(SRC_DIR) --css-dir $(SRC_DIR) --environment production
	mv $*.css $@
	cp $@ $(CSS_DIR)
SASS=js/flat_ui/resources/sass/flat-ui.sass
MINCSS = $(SASS:.sass=.min.css)

all: $(MINCSS)

clean:
	find . -type d -name .sass-cache |xargs rm -rf
	find ./ -name "*.pyc" -delete
	find ./ -name .DS_Store -delete
	rm -f $(MINCSS) $(CSS_DIR)/*.min.css

deploy: update_frontends update_backends

.PHONY: all clean deploy
