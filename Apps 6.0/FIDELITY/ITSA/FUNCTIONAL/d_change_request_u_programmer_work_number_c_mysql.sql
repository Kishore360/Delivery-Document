SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.u_programmer_work_number_c' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.change_request_final  SRC JOIN <<tenant>>_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE SRC.u_programmer_work_number <> (TRGT.u_programmer_work_number_c) 
