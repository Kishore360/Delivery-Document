SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.' ELSE 'SUCCESS' END as Message 
FROM 
(Select count(1) cnt from 
(select sys_id,sourceinstance, COALESCE( convert_tz(u_resolver_group_updated , 'GMT','US/Central' ))resolver_group_updated_c from mcdonalds_mdsdb.incident_final)  SRC 
JOIN (select row_id,source_id,resolver_group_updated_c from mcdonalds_mdwdb.d_incident) TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
and  SRC.resolver_group_updated_c <> TRGT.resolver_group_updated_c )a
