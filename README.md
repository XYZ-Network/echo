# echo
Just a HTTP requests logger

## Usage

Take Docker image and run it. Server will start on `host:3000`
```shell
docker run -p 3000:3000
```

## Development

Update packages list, and install deps:

```shell
cabal update
cabal install
```

Run it locally:

```shell
cabal run
```

or like repl:

```shell
cabal repl
```