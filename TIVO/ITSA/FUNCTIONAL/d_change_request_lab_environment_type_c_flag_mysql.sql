SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM tivo_mdsdb.change_request_final SRC
 LEFT  JOIN tivo_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
LEFT JOIN  tivo_mdsdb.cmdb_ci_environment LKP on 
SRC.cmdb_ci=LKP.sys_id
 
where  case when LKP.u_environment_type like 'Lab%' THEN 'Y' else 'N' END <>TRGT.lab_environment_type_c_flag