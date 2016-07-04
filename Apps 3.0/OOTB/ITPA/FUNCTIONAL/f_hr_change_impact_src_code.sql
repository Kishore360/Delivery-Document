

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_change.impact_src_code' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.hr_change_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_hr_change TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.impact ,'')<> COALESCE(TRGT.impact_src_code ,'')
