USE search;
DROP TABLE IF EXISTS search_customerquery_to_es;
CREATE EXTERNAL TABLE search_customerquery_to_es (id String, customerid BIGINT, querystring String, querycount INT) STORED BY 'org.elasticsearch.hadoop.hive.EsStorageHandler' TBLPROPERTIES('es.resource' = 'topqueries/custquery', 'es.nodes' = 'localhost', 'es.port' = '9200', 'es.input.json' = 'false', 'es.write.operation' = 'index', 'es.mapping.id' = 'id', 'es.index.auto.create' = 'yes');
INSERT OVERWRITE TABLE search_customerquery_to_es SELECT qcust.id, qcust.customerid, qcust.queryString, qcust.querycount FROM search_customerquery qcust;
