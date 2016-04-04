/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_task_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

left join <<tenant>>_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key and dimension_wh_code='CLOSED' 
WHERE  TIMESTAMPDIFF(second,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<>  COALESCE(TRGT.open_to_close_duration,'') and (SRC.opened_at > SRC.closed_at)

  