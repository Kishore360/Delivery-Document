
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.is_it_shared_service_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_service_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_service TRGT 
 ON (concat('BUSINESS_SERVICE~',SRC.sys_id)  =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 'N'<> COALESCE(TRGT.is_it_shared_service_flag ,'')