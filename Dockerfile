FROM docker.io/madnight/docker-alpine-wkhtmltopdf:latest as wkhtmltopdf

FROM docker.io/pandoc/core:latest

LABEL maintainer="Will Fantom <willfantom@gmail.com>"

COPY --from=wkhtmltopdf /bin/wkhtmltopdf /bin/

RUN apk add --update --no-cache \
    libgcc libstdc++ libx11 glib libxrender libxext libintl \
    libcrypto1.1 libssl1.1 \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family 

COPY entrypoint.sh /entrypoint.sh
COPY css/style.css /css/style.css
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-C", "/entrypoint.sh"]
