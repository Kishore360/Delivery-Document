SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_request_item.met_sla_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM png_mdwdb.d_request_item TRGT 
JOIN 
(
SELECT screqitem.sys_id,screqitem.sourceinstance,CASE WHEN SUM(tsla.has_breached) > 0 THEN 'N' ELSE 'Y'END as MET_SLA_Flag
FROM png_mdsdb.sc_req_item_final screqitem
inner join png_mdsdb.task_sla_final tsla ON (screqitem.sys_id=tsla.task AND screqitem.sourceinstance=tsla.sourceinstance)
Where tsla.stage<>'cancelled'
Group by 1,2
) SRC 
ON (TRGT.row_id=SRC.sys_id AND TRGT.source_id=SRC.sourceinstance)
WHERE SRC.MET_SLA_Flag<>TRGT.met_sla_flag
 ) temp;
 
 
 

 