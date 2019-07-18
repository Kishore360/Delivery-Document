
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from png_mdwdb.d_request_item a
JOIN (SELECT a.sys_id,a.sourceinstance , 
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'resolution' THEN 1 ELSE 0 END) as resolution_count,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'resolution' and b.stage <> 'Cancelled' THEN 1 ELSE 0 END) as non_cancelled_count_resolution ,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'resolution' and b.stage <> 'Cancelled' 
and b.has_breached =1 THEN 1 ELSE 0 END) as non_cancelled_breached_count_resolution ,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'resolution' and b.stage = 'Cancelled' 
THEN 1 ELSE 0 END) as cancelled_count_resolution ,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'response' THEN 1 ELSE 0 END) as response_count,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'response' and b.stage <> 'Cancelled' THEN 1 ELSE 0 END) as non_cancelled_count_response,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'response' and b.stage <> 'Cancelled' 
and b.has_breached =1 THEN 1 ELSE 0 END) as non_cancelled_breached_count_response,
sum(CASE WHEN case when sla.target = 'response' then 'response' else 'resolution' end = 'response' and b.stage = 'Cancelled' 
THEN 1 ELSE 0 END) as cancelled_count_response

FROM png_mdsdb.sc_req_item_final a 
JOIN png_mdsdb.task_sla_final b 
ON a.sys_id = b.task and a.sourceinstance = b.sourceinstance
JOIN png_mdsdb.contract_sla_final sla 
ON b.sla = sla.sys_id and b.sourceinstance = sla.sourceinstance
group by 1,2) b 
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance
where
 met_all_resolution_sla_flag_c <> 
CASE WHEN non_cancelled_breached_count_resolution > 0 THEN 'N'
WHEN non_cancelled_count_resolution > 0 and non_cancelled_breached_count_resolution = 0 THEN 'Y'
WHEN resolution_count = 0 THEN 'X'
WHEN resolution_count = cancelled_count_resolution THEN 'C'
ELSE 'X'
END
;