
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.survey_key' ELSE 'SUCCESS' END as Message
 FROM weillcornell_mdsdb.survey_instance_final SRC 
 LEFT JOIN weillcornell_mdwdb.d_survey_instance TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN weillcornell_mdwdb.d_survey LKP 
 ON ( SRC.survey= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.survey IS NULL THEN 0 else -1 end)<> (TRGT.survey_key)
  and    SRC.sys_id not in (select B.sys_id
from
weillcornell_mdsdb.incident_final B
join weillcornell_mdsdb.sys_user_final C
on C.sys_id = B.caller_id
join weillcornell_mdsdb.cmdb_ci_final D
on D.sys_id = B.u_business_service
where UPPER(C.user_name) = 'GUEST'
and UPPER(D.name) = 'ONLINE DIRECTORY' ) 
