

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.soft_deleted_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE IF SRC.CDCTYPE = 'D','Y','N'  THEN 'Y' ELSE 'N'<> TRGT.soft_deleted_flag 
