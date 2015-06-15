

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.opened_by_department_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_request_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
LEFT JOIN  #DWH_TABLE_SCHEMA.d_internal_contact LKP1 
 ON ( CONVERT(concat('INTERNAL_CONTACT~',SRC.opened_by) using utf8)= convert(LKP1.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP1.source_id using utf8))

 LEFT JOIN   #DWH_TABLE_SCHEMA.d_internal_organization LKP
ON ( CONVERT(concat('DEPARTMENT~',LKP1.department_code) using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(LKP1.source_id using utf8)= convert(LKP.source_id using utf8))

LEFT JOIN   #DWH_TABLE_SCHEMA.d_internal_organization LKP2
ON ( CONVERT(concat('DEPARTMENT~',SRC.opened_by) using utf8)= convert(LKP2.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP2.source_id using utf8))
and LKP.row_id  is null 
 
 WHERE COALESCE(LKP.row_key,LKP2.row_key,CASE WHEN (SRC.opened_by is not null and LKP1.department_code IS NULL 
 or SRC.opened_by is  null) THEN 0 else '-1' end)<> COALESCE(CONVERT(TRGT.opened_by_department_key using utf8),'')
