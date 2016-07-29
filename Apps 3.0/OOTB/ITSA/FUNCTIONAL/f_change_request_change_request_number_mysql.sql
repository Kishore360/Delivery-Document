

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.change_request_number' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
<<<<<<< HEAD
 inner JOIN <<tenant>>_mdwdb.f_change_request TRGT 
=======
 INNER JOIN <<tenant>>_mdwdb.f_change_request TRGT 
>>>>>>> origin/master
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE coalesce( SRC.number,'')<> coalesce(TRGT.change_request_number,'')
