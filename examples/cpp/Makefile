# target: prerequisites
# <TAB> recipe
hello: hello.cc
	g++ $^ -o $@

# $^ and $@ are defined in 
# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

# https://stackoverflow.com/a/2145605/1801749
.PHONY = clean install uninstall

clean:
	rm -f hello

install:
	install hello /usr/local/bin

uninstall:
	rm -f /usr/local/bin/hello
