
SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_created_on' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdsdb.us_application_schedule_c_final SRC
JOIN bbandt_mdwdb.d_application_schedule_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONVERT_TZ (SRC.created_on,'GMT','America/New_York')<>TRGT.created_on