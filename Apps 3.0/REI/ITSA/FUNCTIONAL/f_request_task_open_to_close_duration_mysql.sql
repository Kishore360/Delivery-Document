/*If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM rei_mdwdb.d_request_task src
 LEFT JOIN rei_mdwdb.f_request_task TRGT 
 ON (src.row_id =TRGT.row_id  
 AND src.source_id= TRGT.source_id  )
WHERE timestampdiff(second,src.opened_on,src.changed_on) <> TRGT.open_to_close_duration 