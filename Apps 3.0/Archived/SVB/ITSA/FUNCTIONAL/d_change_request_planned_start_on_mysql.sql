

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.changed_by' ELSE 'SUCCESS' END as Message from(

 SELECT  count(1) cnt 
 FROM  svb_mdsdb.change_request_final SRC 
 LEFT JOIN  svb_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE convert_tz(SRC.start_date,'GMT','America/Los_Angeles')<>TRGT.planned_start_on)x