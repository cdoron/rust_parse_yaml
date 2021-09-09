all: obtain parse

obtain: sample.yaml

sample.yaml:
	wget https://raw.githubusercontent.com/fybrik/arrow-flight-module/master/sample/sample.yaml

parse: target/debug/parse 
target/debug/parse: parse.rs
	cargo build

run:
	./target/debug/parse

clean:
	rm target/debug/parse
