# Tiny static webserver with Nginx
FROM nginx:alpine
# Replace default index.html with our custom one
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
