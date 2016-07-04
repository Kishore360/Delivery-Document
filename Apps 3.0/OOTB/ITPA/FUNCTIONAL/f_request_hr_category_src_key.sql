

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.hr_category_src_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 LEFT JOIN <<tenant>>_mdsdb.hr_change_final HR 
 ON (SRC.parent  =HR.sys_id  
 AND SRC.sourceinstance = HR.sourceinstance  )
 
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY~HR_CHANGE~~~', upper(HR.category)) = LKP.src_rowid 
AND HR.sourceinstance = LKP.source_id )
-- WHERE COALESCE(LKP.row_key,CASE WHEN (SRC.parent is null ) THEN 0 else '-1' end)<> COALESCE(TRGT.hr_category_src_key ,'')
WHERE COALESCE(LKP.row_key,CASE WHEN (SRC.parent is null ) THEN 0 
 WHEN (SRC.parent is not null  and HR.sys_id is not null and HR.category is null) THEN 0 
 else '-1' end)<> COALESCE(TRGT.hr_category_src_key ,'')
