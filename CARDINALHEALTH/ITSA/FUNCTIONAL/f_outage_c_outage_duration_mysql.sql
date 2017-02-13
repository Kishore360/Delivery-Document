 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_outage_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join cardinalhealth_mdwdb.d_incident lkp
on lkp.row_id=COALESCE(SRC.task_number,'UNSPECIFIED')
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.duration) <> TRGT.outage_duration


