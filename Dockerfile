# The privacy pages are static, so a file server is the whole app.
FROM caddy:2-alpine

COPY *.html /site/
COPY *.css /site/

# Railway hands the port in as $PORT, and Caddy's own health is enough.
ENV PORT=8080
EXPOSE 8080
CMD ["sh", "-c", "caddy file-server --listen :${PORT} --root /site"]
