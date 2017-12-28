SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdwdb.f_incident as trgt
JOIN svb_mdsdb.incident_final as src
on src.sys_id = trgt.row_id and src.sourceinstance=trgt.source_id
where src.u_reopen_count<>trgt.reopened_count
)b
