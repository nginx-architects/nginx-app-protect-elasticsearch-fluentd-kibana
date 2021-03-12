# nginx-app-protect-elasticsearch-fluentd-kibana

For testing purposes only. Use at your own risk.

The NGINX instance will log all availible variables (from here: <http://nginx.org/en/docs/varindex.html> as of 3/10/2021) to Elasticsearch. Using the json parser in FluentD, to avoid creating a grok for it.

## Usage

* Update .env file with your values
* The app-protect host is listening on 80 and 443 automatically redirects to kibana and logs that traffic to elasticsearch
* Either copy your nginx-repo keys to the nginx-app-protect dir or change the build to your existing image in docker-compose.yml
* I included certificates to *.nginx.rocks, feel free to replace them with your own.
* Certificates to nginx.rocks are included, feel free to replace them with your own
* Bring up with `run.sh`
* The default login is elastic/yourpasswordhere
* Import the Kibana Dashboards file if desired, instructions below
* Turn on dark mode in Stack Management>Advanced Settings*


This is essentially a fork of the F5 Dev Central version, I just removed logstash and using Fluentd.

If these dashboards are updated (I copied as of Mar 10, 2021), they should still work with this repo:
<https://github.com/f5devcentral/f5-waf-elk-dashboards/tree/master/kibana>

## Dashboards Installation
Import dashboards to kibana through UI (Kibana->Management->Saved Objects) or use API calls below.
```
source .env && curl -F "file=@kibana-indexes-dashboards.ndjson" \
    -X POST -u elastic:$PASSWORD -H "kbn-xsrf: true" \
    --resolve es.$DOMAIN_NAME:5601:127.0.0.1 \
    https://es.$DOMAIN_NAME:5601/api/saved_objects/_import?createNewCopies=false&overwrite=true
```

*=Unless you really like the glare
