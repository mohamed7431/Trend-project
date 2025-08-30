# Use Nginx to serve static files
FROM nginx:alpine

# Copy your static app files into Nginx web root
COPY app/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
