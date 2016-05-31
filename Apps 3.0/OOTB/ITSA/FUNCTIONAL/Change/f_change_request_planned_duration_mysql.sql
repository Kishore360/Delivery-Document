/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.planned_duration' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE   COALESCE(TRGT.planned_duration ,'')<> 
 COALESCE(CASE WHEN SRC.END_DATE  < SRC.START_DATE  THEN  NULL WHEN TIMESTAMPDIFF(SECOND,SRC.START_DATE, SRC.END_DATE) > 214748364 THEN NULL ELSE TIMESTAMPDIFF(SECOND,SRC.START_DATE, SRC.END_DATE) end,'')	