FROM docker.elastic.co/kibana/kibana-oss:6.2.4
MAINTAINER cgiraldo@gradiant.org

# custom favicons
COPY favicons/* /usr/share/kibana/src/ui/public/assets/favicons/

# custom throbber
RUN sed -i 's/Kibana/Homer-Elastic/g' /usr/share/kibana/src/core_plugins/kibana/translations/en.json
RUN sed -i 's/image\/svg+xml.*");/image\/svg+xml;base64,PHN2ZyB3aWR0aD0iMTU0LjAzIiBoZWlnaHQ9IjIwMC4xMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4NCiA8bWV0YWRhdGEgaWQ9Im1ldGFkYXRhMzAiPmltYWdlL3N2Zyt4bWxMb2dvLUtpYmFuYUljb248L21ldGFkYXRhPg0KDQogPHRpdGxlPkxvZ28tS2liYW5hSWNvbjwvdGl0bGU+DQogPGc+DQogIDx0aXRsZT5iYWNrZ3JvdW5kPC90aXRsZT4NCiAgPHJlY3QgZmlsbD0ibm9uZSIgaWQ9ImNhbnZhc19iYWNrZ3JvdW5kIiBoZWlnaHQ9IjIwMi4xMSIgd2lkdGg9IjE1Ni4wMyIgeT0iLTEiIHg9Ii0xIi8+DQogPC9nPg0KIDxnPg0KICA8dGl0bGU+TGF5ZXIgMTwvdGl0bGU+DQogIDxlbGxpcHNlIHJ5PSI2MS41IiByeD0iNjQuNSIgaWQ9InN2Z18xIiBjeT0iMTAzLjQ1NDk5IiBjeD0iNzguMDE1MDEiIHN0cm9rZS1vcGFjaXR5PSJudWxsIiBzdHJva2Utd2lkdGg9Im51bGwiIHN0cm9rZT0ibnVsbCIgZmlsbD0iI2ViMjAyNiIvPg0KICA8dGV4dCBmb250LXdlaWdodD0iYm9sZCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgdGV4dC1hbmNob3I9InN0YXJ0IiBmb250LWZhbWlseT0iSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiIgZm9udC1zaXplPSI4OSIgaWQ9InN2Z18yIiB5PSIxMzQuOTU0OTkiIHg9IjQ2LjUxNTAxIiBzdHJva2Utb3BhY2l0eT0ibnVsbCIgc3Ryb2tlLXdpZHRoPSIwIiBzdHJva2U9Im51bGwiIGZpbGw9IiNGRkZGRkYiPkg8L3RleHQ+DQogPC9nPg0KPC9zdmc+
# custom HTML title information
RUN sed -i 's/title Kibana/title Homer/g' /usr/share/kibana/src/ui/ui_render/views/chrome.jade

# custom plugin css
COPY testing.zip /
RUN sed -i "s/bundleFile('commons.style.css')/bundleFile('commons.style.css'),bundleFile('gradiant_style.style.css')/g" /usr/share/kibana/src/ui/ui_render/views/ui_app.jade
RUN bin/kibana-plugin install https://github.com/qxip/Kibana-style-plugin/archive/v6.2.4.zip


