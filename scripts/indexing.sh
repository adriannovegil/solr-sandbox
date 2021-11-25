#!/bin/bash

curl "http://localhost:8983/solr/admin/collections?action=CREATE&name=mycoll2&numShards=3&replicationFactor=1"

for i in {1..1000000}
  do echo $i
  curl "http://localhost:8981/solr/mycoll2/update" -X POST -d "[{'id':'id$i'}, {'id':'myid$i'}]" -H "Content-type: application/json"
  curl "http://localhost:8982/solr/mycoll2/update" -X POST -d "[{'id':'id$i'}, {'id':'myid$i'}]" -H "Content-type: application/json"  
  curl "http://localhost:8983/solr/mycoll2/update" -X POST -d "[{'id':'id$i'}, {'id':'myid$i'}]" -H "Content-type: application/json"
done
