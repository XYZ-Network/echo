# echo

<img align="right" width="100" height="100" title="XYZ Network logotype"
src="https://avatars.githubusercontent.com/u/74674198?s=200&v=4">

Just a HTTP requests logger

## Usage

Take Docker image and run it. Server will start on `host:3000`
```shell
docker run -it -p 3000:3000 docker.pkg.github.com/vldc-hq/vldc-bot/bot:latest
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