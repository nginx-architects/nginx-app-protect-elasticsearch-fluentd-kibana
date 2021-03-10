# nginx-app-protect-elasticsearch-fluentd-kibana

For testing purposes only. Use at your own risk.

The NGINX instance will log all availible variables (from here: <http://nginx.org/en/docs/varindex.html> as of 3/10/2021) to Elasticsearch. Using the json parser in FluentD, to avoid creating a grok for it.

## Usage

* Copy nginx plus keys to nginx-app-protect dir
* make sure to do a find all on the current password in the docker-compose file and replace
* The app-protect host listening on 80 and 443 automatically redirects to kibana and logs that traffic to elastic
* Either copy your nginx-repo keys to the nginx-app-protect dir or change the build to your image in the docker-compose
* I included certificates to *.nginx.rocks, feel free to replace them with your own.
* Update the IP the line `- "es.nginx.rocks:10.0.1.82"` with your host's IP (not 127.0.0.1)
* Bring up with `docker-compose up --build`
* The default login is elastic/yourpasswordhere
* Import the Kibana Dashboard file if desired


This is essentially a fork of the F5 Dev Central version, I just removed logstash and using Fluentd.

If these dashboards are updated (I copied as of Mar 10, 2021), they should still work with this repo:
<https://github.com/f5devcentral/f5-waf-elk-dashboards/tree/master/kibana>
