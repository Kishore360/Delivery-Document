/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM rei_mdsdb.incident_final SRC
 LEFT JOIN rei_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  LEFT JOIN rei_mdwdb.d_lov_map br 
 ON TRGT.state_src_key = br.src_key
WHERE   br.dimension_wh_code IN ('CLOSED') 
AND  TIMESTAMPDIFF(second, SRC.u_last_resolution_date,COALESCE(closed_at,sys_updated_on))<> TRGT.resolve_to_close_duration;