SELECT CASE WHEN cnt1 > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt1 >0 THEN 'MDS to DWH data validation failed for d_incident.formerly_p1_flag_c' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt1 from 
tjxco_mdsdb.change_request_final a
LEFT JOIN (select c.sys_id,c.sourceinstance,count(1) as cnt from tjxco_mdsdb.incident_final a
 join tjxco_mdsdb.change_request_final c
on a.caused_by=c.sys_id
group by 1,2
) b 
ON a.sys_id = b.sys_id and a.sourceinstance = b.sourceinstance
JOIN tjxco_mdwdb.d_change_request TRGT 
ON 
a.sys_id = TRGT.row_id and a.sourceinstance = TRGT.source_id
where CASE WHEN b.cnt >= 1 then 'Y' ELSE 'N' END<>TRGT.unplanned_outage_flag_c)temp;      