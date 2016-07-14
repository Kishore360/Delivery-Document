

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.due_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.problem_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_problem TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.due_date,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.due_on_key,'') 
