SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_walk_up_call_c.opened_time_key' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.u_walk_up_call_final SRC 
 LEFT JOIN qualcomm_mdwdb.f_walk_up_call_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN qualcomm_mdwdb.d_calendar_time LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','GMT'),'%H%i') and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN 0 else '-1' end)  <> COALESCE(TRGT.opened_time_key,'') ;