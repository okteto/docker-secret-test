FROM nginx

# Mount the secret 'mysecret' during the build process and use its content to create index.html
RUN --mount=type=secret,id=mysecret,target=/mysecret \
      SECRET_CONTENT=$(cat /mysecret) && \
      echo $SECRET_CONTENT > /usr/share/nginx/html/index.html
