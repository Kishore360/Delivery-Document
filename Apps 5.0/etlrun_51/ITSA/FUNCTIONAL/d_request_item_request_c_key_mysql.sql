SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt
 from wow_mdsdb.sc_req_item_final SRC left join
wow_mdwdb.d_request_item TGT 
ON (SRC.sys_id=TGT.row_id and SRC.sourceinstance=TGT.source_id)
LEFT JOIN wow_mdwdb.d_request req 
on req.row_id = COALESCE(SRC.request,'UNSPECIFIED')
WHERE COALESCE(req.row_key,CASE WHEN SRC.request IS NULL THEN 0 else -1 end)<>(TGT.request_c_key))temp;