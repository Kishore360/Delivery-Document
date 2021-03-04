SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS RESULT,
CASE WHEN CNT > 0 THEN 'MDS to DWD Data Validation Failed for d_incident.closed_by_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ntt_amgen_mdsdb.incident_final SRC 
LEFT JOIN ntt_amgen_mdwdb.d_incident TRGT ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN ntt_amgen_mdwdb.d_internal_contact LKP ON CASE WHEN SRC.closed_by IS NULL THEN 'UNSPECIFIED' ELSE CONCAT('INTERNAL_CONTACT~',SRC.closed_by) END  
=LKP.row_id 
JOIN ntt_amgen_mdwdb.d_calendar_date da ON date_format(CONVERT_TZ(COALESCE(SRC.closed_at,SRC.resolved_at),'UTC','America/New_York'),'%Y%m%d')
=da.row_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.closed_by IS NULL THEN 0 ELSE -1 END)<>TRGT.closed_by_key
AND SRC.state = 7 and SRC.state <> 5
AND SRC.cdctype='X'
AND da.lagging_count_of_month between 0 and 12
) temp;
