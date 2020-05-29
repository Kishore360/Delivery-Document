SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_request_item.catalog_item_key' ELSE 'SUCCESS' END as Message
FROM
(select count(1) as CNT FROM wpl_mdsdb.sc_req_item_final src
join wpl_mdwdb.f_request_item a
on src.sys_id=a.row_id and src.sourceinstance=a.source_id
 JOIN wpl_mdwdb.d_master_item mi 
 ON a.catalog_item_key = mi.row_key
 where a.catalog_item_key <> mi.row_key
 ) der;