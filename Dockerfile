FROM node
RUN npm install 
COPY server.js
EXPOSE 8080
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8080 || exit 1


