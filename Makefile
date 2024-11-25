


all: venv
	venv/bin/sphinx-build -j auto -b html -D language=en -d build/en/doctrees source dist/en


venv:
	python -m venv venv
	venv/bin/pip3 install -r requirements.txt

