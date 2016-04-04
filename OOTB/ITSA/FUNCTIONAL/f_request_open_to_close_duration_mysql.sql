/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN <<tenant>>_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED')
and  TIMESTAMPDIFF(second,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<>  (TRGT.open_to_close_duration) 
