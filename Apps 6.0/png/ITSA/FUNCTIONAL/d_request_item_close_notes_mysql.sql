SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM  
png_mdwdb.d_request_item a 
JOIN png_mdsdb.sc_req_item_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance 

where
close_notes <> b.close_notes;