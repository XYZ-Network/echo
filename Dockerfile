FROM haskell:8.8 as builder

RUN apt-get update && apt-get install -y upx

RUN cabal update

RUN cabal install cabal-plan \
  --constraint='cabal-plan ^>=0.7' \
  --constraint='cabal-plan +exe' \
  --installdir=/usr/local/bin

COPY echo.cabal /build/
WORKDIR /build
RUN --mount=type=cache,target=dist-newstyle cabal build --only-dependencies

COPY . /build

RUN --mount=type=cache,target=dist-newstyle cabal build exe:echo \
  && mkdir -p /build/artifacts && cp $(cabal-plan list-bin echo) /build/artifacts/
  
RUN upx /build/artifacts/echo


FROM alpine

COPY --from=builder /build/artifacts/echo /
EXPOSE 3000:3000
CMD ["/echo"]