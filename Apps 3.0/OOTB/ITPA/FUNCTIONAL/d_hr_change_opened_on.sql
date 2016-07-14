

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_change.opened_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.hr_change_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_hr_change TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE convert_tz(SRC.opened_at,'GMT','America/Los_Angeles') <> TRGT.opened_on 
