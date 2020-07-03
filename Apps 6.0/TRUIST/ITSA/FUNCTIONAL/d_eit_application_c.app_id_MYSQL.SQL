SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.app_id' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT 
FROM truist_mdsdb.us_technical_health_check_c_final SRC 
JOIN truist_mdwdb.d_eit_application_c TRGT ON (SRC.row_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where coalesce(SRC.appid,'UNSPECIFIED')<>TRGT.app_id
and SRC.cdctype<>'D'
)temp;