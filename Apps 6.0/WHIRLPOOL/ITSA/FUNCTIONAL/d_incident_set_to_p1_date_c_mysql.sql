SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.set_to_p1_date_c' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdwdb.d_incident trgt
RIGHT JOIN whirlpool_mdsdb.incident_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE set_to_p1_date_c <>convert_tz(src.u_set_to_p1,'GMT','America/New_York')
;

