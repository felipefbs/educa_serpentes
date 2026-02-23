.PHONY: all clean

build: output.pdf
	typst compile main.typ output.pdf

clean:
	rm -f output.pdf
