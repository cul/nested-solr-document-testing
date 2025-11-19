#!/usr/bin/env ruby

# frozen_string_literal: true

# Require all gems in Gemfile
require 'bundler'
Bundler.require(:default)

# Auto-load all files in lib directory
loader = Zeitwerk::Loader.new
loader.push_dir('lib')
loader.setup # ready!

# Run code!

documents = [{
  id: 'collection:1',
  title_ssi: 'Collection 1',
  cool_nested_docs: [{
    id: 'series:1.1',
    title_ssi: 'Series 1.1',
    cool_nested_docs: [{
      id: 'subseries:1.1.1',
      title_ssi: 'Sub-Series 1.1.1',
      cool_nested_docs: [{
        id: 'subsubseries:1.1.1',
        title_ssi: 'Sub-Sub-Series 1.1.1.1'
      }]
    }]
  }, {
    id: 'series:1.2',
    title_ssi: 'Series 1.2',
    cool_nested_docs: [{
      id: 'subseries:1.2.1',
      title_ssi: 'Sub-Series 1.2.1',
      cool_nested_docs: [{
        id: 'subsubseries:1.2.1',
        title_ssi: 'Sub-Sub-Series 1.2.1.1'
      }]
    }]
  }]
}]

solr = RSolr.connect(url: 'http://localhost:8983/solr/nested-solr-document-testing')
documents.each { |document| solr.add(document) }
solr.commit

response = solr.post('select', data: {
  q: '*:*',
  fl: 'id,title_ssi,_root_,_nest_parent_,_nest_path_'
})['response']

puts "Found #{response['numFound']} documents:"
pp response['docs']
