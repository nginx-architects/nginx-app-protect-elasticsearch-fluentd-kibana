# nginx-app-protect-elasticsearch-fluentd-kibana

For testing purposes only. Use at your own risk.

The NGINX instance will log all availible variables (from here: <http://nginx.org/en/docs/varindex.html> as of 3/10/2021) to Elasticsearch. Using the json parser in FluentD, to avoid creating a grok for it.

## Usage

* Make sure you have set vm.max_map_count=262144 in /etc/sysctl.conf `sysctl -w vm.max_map_count=262144`
* Find all on the current password in the docker-compose file and replace
* Find all `- "es.nginx.rocks:10.0.1.82"` lines and replace with your host's IP (not 127.0.0.1)
* The app-protect host listening on 80 and 443 automatically redirects to kibana and logs that traffic to elastic
* Either copy your nginx-repo keys to the nginx-app-protect dir or change the build to your image in the docker-compose
* Certificates to nginx.rocks are included, feel free to replace them with your own
* Bring up with `docker-compose up --build`
* The default login is elastic/yourpasswordhere
* Import the Kibana Dashboard/Settings if desired

This is essentially a fork of the F5 Dev Central version and removed logstash. Using Fluentd instead.

If these dashboards are updated (I copied as of Mar 10, 2021), they should still work with this repo:
<https://github.com/f5devcentral/f5-waf-elk-dashboards/tree/master/kibana>
