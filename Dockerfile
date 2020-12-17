FROM node
RUN npm install 
COPY server.js
CMD ["node", "server.js" ]
EXPOSE 8000
