SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.u_detection_source_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from watson_mdsdb.incident_final src
 left join watson_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where  src.u_detection_source<>trgt.u_detection_source_c )ma