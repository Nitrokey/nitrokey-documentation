

all: __preview
	sphinx-build -a -D language='en' -b html . ___preview

watch:
	while true; do inotifywait -e MODIFY `find . -name '*.rst'`; make; sleep 1; done


.PHONY: watch

__preview:
	mkdir -p __preview
