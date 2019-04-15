
SELECT 
CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
FROM (  
SELECT Count(1) as CNT 
FROM nypres_mdsdb.incident_final SRC
JOIN nypres_mdwdb.f_incident TRGT ON (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
JOIN nypres_mdwdb.d_calendar_date LKP 
ON COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.closed_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_at is NULL THEN 0 ELSE -1 END)<>TRGT.closed_on_key
and TRGT.soft_deleted_flag='N'
 )a;
 
 