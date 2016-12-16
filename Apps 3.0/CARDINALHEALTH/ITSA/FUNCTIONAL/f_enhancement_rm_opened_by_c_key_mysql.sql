SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.rm_enhancement_delta SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_internal_organization LKP
 on LKP.row_id = COALESCE(concat('INTERNAL_CONTACT~',SRC.opened_by),'UNSPECIFIED') and LKP.source_id  = SRC.sourceinstance
 LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE LKP.row_key <> TRGT.opened_by_c_key ;
 