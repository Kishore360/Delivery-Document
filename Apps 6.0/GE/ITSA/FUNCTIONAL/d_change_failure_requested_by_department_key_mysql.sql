SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.requested_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM ge_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN (select * from ge_mdwdb.d_change_failure where current_flag='Y' and soft_deleted_flag='N') TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  ge_mdwdb.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',SRC.requested_by) = LKP1.row_id 
 AND SRC.sourceinstance = LKP1.source_id ) 
 LEFT JOIN   ge_mdwdb.d_internal_organization LKP
 ON ( concat('DEPARTMENT~',LKP1.department_code) = LKP.row_id 
 AND LKP1.source_id = LKP.source_id )
 where coalesce(LKP.row_key,case when LKP1.department_code is null then 0 else -1 end)<> TRGT.requested_by_department_key  ;