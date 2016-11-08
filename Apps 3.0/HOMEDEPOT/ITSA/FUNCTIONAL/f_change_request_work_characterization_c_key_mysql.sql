SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.u_work_characterization_c_key' ELSE 'SUCCESS' END as Message
FROM homedepot_mdsdb.change_request_final SRC
LEFT JOIN homedepot_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON CONCAT('WORK_CHARACTERIZATION','~','CHANGE_REQUEST','~','~','~',SRC.u_work_characterization)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
where COALESCE(LKP.row_key,CASE WHEN SRC.u_work_characterization IS NULL THEN 0 else -1 end) <> (TRGT.work_characterization_c_key) ;