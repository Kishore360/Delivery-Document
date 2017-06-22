SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message from (select count(1) cnt  
 FROM  svb_mdwdb.d_incident as trgt
JOIN svb_mdsdb.incident_final as src
on src.sys_id = trgt.row_id and src.sourceinstance=trgt.source_id
join svb_mdwdb.d_lov lkp
on COALESCE( CONCAT('STATE','~','INCIDENT','~','~','~',src.incident_state),'UNSPECIFIED')=lkp.row_id
where coalesce(lkp.row_key,case when src.incident_state is null then 0 else -1 end)<>trgt.state_src_key
)b
