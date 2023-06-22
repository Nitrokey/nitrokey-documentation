

all: __preview venv
	. venv/bin/activate && sphinx-build -j auto -a -D language='en' -b html . __preview

watch:
	while true; do inotifywait -e MODIFY `find . -name '*.rst'`; make; sleep 1; done

venv:
	virtualenv venv
	. venv/bin/activate && pip install -r requirements.txt


.PHONY: watch

__preview:
	mkdir -p __preview

.PHONY: clean
clean:
	rm -rf __preview venv
