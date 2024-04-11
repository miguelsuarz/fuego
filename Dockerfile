
FROM hugomods/hugo as builder
WORKDIR /app
COPY . .
CMD [ "hugo", "server","--bind=0.0.0.0" ]

# Etapa de producción
FROM nginx:stable
COPY --from=builder /app/public /usr/share/nginx/html
#COPY --from=builder /app/themes /usr/share/nginx/html/themes
LABEL org.opencontainers.image.source="https://github.com/miguelsuarz/fuego"