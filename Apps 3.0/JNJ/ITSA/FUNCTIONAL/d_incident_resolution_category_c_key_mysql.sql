SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM jnj_mdsdb.u_resolution_category_choices_final LKP 
 JOIN  jnj_mdsdb.incident_final SRC 
 ON (SRC.u_resolution_category = LKP.sys_id )
 LEFT JOIN jnj_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  )
 WHERE LKP.u_value <> TRGT.resolution_category_c;