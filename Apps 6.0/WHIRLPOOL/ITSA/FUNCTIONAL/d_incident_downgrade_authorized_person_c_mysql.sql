SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.downgrade_authorized_person_c' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdwdb.d_incident trgt
RIGHT JOIN whirlpool_mdsdb.incident_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE trgt.downgrade_authorized_person_c <>u_downgrade_authorized_person
and src.cdctype='X'
;

