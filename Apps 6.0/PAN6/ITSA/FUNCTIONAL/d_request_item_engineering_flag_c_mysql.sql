SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message  from (
select count(1) cnt
 from pan_mdsdb.sc_req_item_final SRC left join
pan_mdwdb.d_request_item TGT
ON
(SRC.sys_id=TGT.row_id and SRC.sourceinstance=TGT.source_id)
WHERE 
CASE WHEN SRC.u_engineering = 1 THEN 'Y' else 'N' END <>TGT.engineering_flag_c)x