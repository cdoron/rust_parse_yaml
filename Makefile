all: obtain parse

obtain: sample.yaml

sample.yaml:
	wget https://raw.githubusercontent.com/fybrik/arrow-flight-module/master/sample/sample.yaml

parse: target/wasm32-wasi/debug/parse.wasm
target/wasm32-wasi/debug/parse.wasm: parse.rs
	cargo build --target wasm32-wasi

run:
	wasmtime --dir=. target/wasm32-wasi/debug/parse.wasm

clean:
	rm target/wasm32-wasi/debug/parse.wasm
