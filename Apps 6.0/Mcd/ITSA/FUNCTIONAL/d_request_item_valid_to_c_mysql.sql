select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from ( select count(1) cnt 
 FROM
 mcdonalds_mdwdb.d_request_item trgt
INNER  JOIN mcdonalds_mdsdb.sc_req_item_final src ON trgt.row_id=src.sys_id AND trgt.source_id=src.sourceinstance
LEFT JOIN mcdonalds_mdsdb.sc_req_item_ext_final ext ON trgt.row_id = ext.record_id AND trgt.source_id = ext.sourceinstance
where trgt.valid_to_c <> CONVERT_TZ(ext.valid_to,'GMT','US/Central'))a