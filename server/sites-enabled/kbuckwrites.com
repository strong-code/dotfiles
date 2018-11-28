#server {
#  listen 80;
#  server_name 107.170.227.56;
#  root /home/kbuckwrites/website/_site;
#  index index.html;
#  expires 1d;
#}
