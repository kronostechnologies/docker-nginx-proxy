[ ! -z $HTPASSWD ] && HTPASSWD=$(echo $HTPASSWD | base64 -d)
dockerize -template "/etc/nginx/nginx.tmpl:/etc/nginx/nginx.conf" -template "/etc/nginx/htpasswd.tmpl:/etc/nginx/htpasswd" nginx -g "daemon off;"
