FROM nginx:latest
COPY index.html /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

#Make sure you name this just as dockerfile within your directory.
