# For Debian 10:
FROM debian:buster
#RUN groupadd -r nginx \
#  && useradd -r -g nginx nginx 

# Download certificate and key from the customer portal (https://my.f5.com)
# and copy to the build context:
COPY nginx-repo.crt nginx-repo.key /etc/ssl/nginx/

# Install prerequisite packages:
RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates wget gnupg2 curl vim

# Download and add the NGINX signing key:
RUN wget https://cs.nginx.com/static/keys/nginx_signing.key && apt-key add nginx_signing.key \
  && wget https://cs.nginx.com/static/keys/app-protect-security-updates.key && apt-key add app-protect-security-updates.key

# Add NGINX Plus repository:
RUN printf "deb https://plus-pkgs.nginx.com/debian `lsb_release -cs` nginx-plus\n" | tee /etc/apt/sources.list.d/nginx-plus.list \
  && printf "deb https://app-protect-security-updates.nginx.com/debian/ `lsb_release -cs` nginx-plus\n" | tee /etc/apt/sources.list.d/app-protect-security-updates.list

# Download the apt configuration to `/etc/apt/apt.conf.d`:
RUN wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx \
 && wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90app-protect-security-updates
    
# Update the repository and install the most recent version of the NGINX App Protect package (which includes NGINX Plus):
RUN apt-get update  \
 && apt-get install -y app-protect app-protect-attack-signatures app-protect-threat-campaigns

# Remove nginx repository key/cert from docker
RUN rm -rf /etc/ssl/nginx

# Forward request logs to Docker log collector:
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && chown -R nginx:nginx /var/log/app_protect/ \
    && mkdir /etc/nginx/html

# Copy configuration files:
# COPY etc/nginx/all-log-vars.conf etc/nginx/nginx.conf etc/nginx/custom_log_format.json /etc/nginx/
COPY entrypoint.sh  /root/

EXPOSE 80 443

CMD ["sh", "/root/entrypoint.sh"]