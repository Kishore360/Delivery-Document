

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.opened_by_department_key' ELSE 'SUCCESS' END as Message
 
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact LKP1 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP1.row_id 
AND SRC.sourceinstance= LKP1.source_id )

 LEFT JOIN   <<tenant>>_mdwdb.d_internal_organization LKP
ON ( concat('DEPARTMENT~',LKP1.department_code)= LKP.row_id 
AND LKP1.source_id= LKP.source_id and 
DATE_FORMAT(coalesce(
convert_tz(SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),
convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)),'%Y-%m-%d %H:%i:%s') 
between LKP.effective_from and LKP.effective_to )

LEFT JOIN   <<tenant>>_mdwdb.d_internal_organization LKP2
ON ( concat('DEPARTMENT~',SRC.opened_by)= LKP2.row_id 
AND SRC.sourceinstance= LKP2.source_id and 
DATE_FORMAT(coalesce(
convert_tz(SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),
convert_tz(SRC.closed_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>)),'%Y-%m-%d %H:%i:%s') 
between LKP.effective_from and LKP.effective_to)
and LKP.row_id  is null 
 
 WHERE COALESCE(LKP.row_key,LKP2.row_key,CASE WHEN (SRC.opened_by is not null and LKP1.department_code IS NULL 
 or SRC.opened_by is  null) THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_department_key,'')

