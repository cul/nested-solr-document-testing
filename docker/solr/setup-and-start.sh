#!/bin/bash

# Set up symlinks if they don't exist.  The conditional checks ensure that this only runs if
# the volume is re-created.
[ ! -L /var/solr/nested-solr-document-testing ] && ln -s /data/nested-solr-document-testing /var/solr/nested-solr-document-testing

precreate-core nested-solr-document-testing /template-cores/nested-solr-document-testing

# Start solr
solr-foreground
