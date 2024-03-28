#!/bin/bash
if ! grep -q "action.auto_create_index: false" /etc/elasticsearch/elasticsearch.yml; then
    echo "action.auto_create_index: false" >> /etc/elasticsearch/elasticsearch.yml
fi
