
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.time_worked' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CASE WHEN SRC.time_worked is null  THEN NULL   WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.time_worked) < 0 THEN NULL    ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SRC.time_worked) end ,'')<> COALESCE(TRGT.time_worked ,'')
