SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_application_schedule_c_ci_name' ELSE 'SUCCESS' END as Message 
FROM (SELECT Count(1) as CNT 
FROM truist_mdsdb.us_application_schedule_c_final SRC
JOIN truist_mdwdb.d_application_schedule_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.name,'UNSPECIFIED')<>TRGT.ci_name
and SRC.cdctype='X'
)temp; 
