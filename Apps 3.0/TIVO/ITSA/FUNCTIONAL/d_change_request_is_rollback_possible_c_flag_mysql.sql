SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
 FROM tivo_mdsdb.change_request_final SRC
 LEFT JOIN tivo_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id )
WHERE case when SRC.u_is_rollback_possible_='Yes' then 'Y'
 when SRC.u_is_rollback_possible_='No' then   'N' 
else 'N/A'end <>TRGT.is_rollback_possible_c_flag