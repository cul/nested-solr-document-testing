FROM solr:9.8.1

WORKDIR /data

COPY ./setup-and-start.sh .

COPY --chown=solr:solr './solr_cores/nested-solr-document-testing-solr-9' /template-cores/nested-solr-document-testing
RUN echo 'name=nested-solr-document-testing' > /template-cores/nested-solr-document-testing/core.properties

CMD /bin/bash ./setup-and-start.sh
