/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.first_call_resolution_flag' ELSE 'SUCCESS' END as Message
 FROM   <<tenant>>_mdsdb.incident_final SRC
JOIN <<tenant>>_mdwdb.d_incident TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
    JOIN  <<tenant>>_mdwdb.f_incident TRGTF 
 ON (TRGTF.incident_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id  and TIMESTAMPDIFF(MINUTE,SRC.opened_at,SRC.resolved_at)<30)
 
 JOIN <<tenant>>_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key AND LM.dimension_class = 'STATE~INCIDENT'
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED')
WHERE  CASE WHEN  TIMESTAMPDIFF(MINUTE,SRC.opened_at,SRC.resolved_at)<30
AND  LM.dimension_wh_code IN('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END <> (TRGT.first_call_resolution_flag )