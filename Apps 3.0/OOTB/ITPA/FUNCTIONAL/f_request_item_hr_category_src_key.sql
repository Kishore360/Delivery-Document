

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.hr_category_src_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_req_item_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN <<tenant>>_mdsdb.sc_request_final REQ 
 ON (SRC.request  =REQ.sys_id  
 AND SRC.sourceinstance = REQ.sourceinstance  )
 LEFT JOIN <<tenant>>_mdsdb.hr_change_final HR 
 ON (REQ.parent  =HR.sys_id  
 AND REQ.sourceinstance = HR.sourceinstance  )
 
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('CATEGORY~HR_CHANGE~~~', upper(HR.category)) = LKP.src_rowid 
AND HR.sourceinstance = LKP.source_id )
 -- WHERE COALESCE(LKP.row_key,CASE WHEN REQ.parent  IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.hr_category_src_key ,'')
WHERE COALESCE(LKP.row_key,CASE WHEN (REQ.parent is null ) THEN 0 
 WHEN (REQ.parent is not null  and HR.sys_id is not null and HR.category is null) THEN 0 
 else '-1' end)<> COALESCE(TRGT.hr_category_src_key ,'')
