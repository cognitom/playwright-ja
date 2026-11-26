# Playwright の版はここだけで決める (イメージのタグもここから取る)
ARG PLAYWRIGHT_VERSION=1.61.1

FROM mcr.microsoft.com/playwright:v${PLAYWRIGHT_VERSION}-noble
ARG PLAYWRIGHT_VERSION

RUN apt-get update \
 && apt-get install -y --no-install-recommends fonts-noto-cjk \
 && rm -rf /var/lib/apt/lists/*

COPY fonts.conf /etc/fonts/local.conf
RUN fc-cache -f

RUN npm install -g --no-audit --no-fund \
      playwright@${PLAYWRIGHT_VERSION} \
      @playwright/test@${PLAYWRIGHT_VERSION} \
 && npm cache clean --force

ENV NODE_PATH=/usr/lib/node_modules

LABEL org.opencontainers.image.source=https://github.com/cognitom/playwright-ja
