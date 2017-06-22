SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdwdb.d_incident as trgt
JOIN svb_mdsdb.incident_final as src
on src.sys_id = trgt.row_id and src.sourceinstance=trgt.source_id
where CONVERT_TZ (src.u_set_to_p1,'GMT','America/Los_Angeles')<>trgt.set_to_p1_c
)b
