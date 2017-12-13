

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.changed_by' ELSE 'SUCCESS' END as Message from(


SELECT count(1) cnt
 FROM  svb_mdsdb.change_request_final SRC 
 LEFT JOIN  svb_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
left  JOIN  svb_mdwdb.d_lov LKP  
 ON ( concat('TYPE~CHANGE_REQUEST~~~',upper(type))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN type is null  THEN 0 else -1 end)<>(TRGT.type_src_key))x