SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from molinahealth_mdsdb.incident_final s 
left join molinahealth_mdwdb.d_incident d
ON  s.sys_id=d.row_id
AND d.source_id=s.sourceinstance
where u_health_plan_entity_affected<>health_plan_entity_affected_c