

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_asc_c.over_due_flag' ELSE 'SUCCESS' END as Message from (
 select ( CASE WHEN  due_date < CONVERT_TZ((SELECT MAX(lastupdated) AS lastupdated
FROM mercuryinsurance_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'America/Los_Angeles','GMT') then 'Y' else 'N' END)abc, 
(TRGT.over_due_flag )def
 FROM mercuryinsurance_mdsdb.u_asc_ticket_final SRC 
LEFT JOIN mercuryinsurance_mdwdb.d_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE due_date is not null
 )a
 WHERE abc<>def

