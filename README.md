# playwright-ja

日本語フォント入りの Playwright のイメージ。`mcr.microsoft.com/playwright` に Noto Sans CJK を足し、`lang=ja` の sans-serif を Noto Sans CJK JP にしてある。`playwright` と `@playwright/test` をグローバルに入れてある。

## 使い方

```yaml
services:
  browser:
    image: ghcr.io/cognitom/playwright-ja:1.61.1
    working_dir: /repo
    volumes:
      - .:/repo
    command: sleep infinity
```

`NODE_PATH=/usr/lib/node_modules` を設定してあるので、スクリプトの `require('playwright')` がそのまま通る。テストは `playwright test` で回す。

## 版を上げる

`Dockerfile` の `ARG PLAYWRIGHT_VERSION` を書き換える。main に push すると、その版と `latest` のタグで公開される。

最初の公開のあと、[パッケージの設定](https://github.com/users/cognitom/packages/container/playwright-ja/settings) で Public にする。
