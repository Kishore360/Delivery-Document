SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_incident_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC  
LEFT JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN mcdonalds_mdwdb.d_incident LKP 
ON COALESCE(SRC.u_incident, 'UNSPECIFIED')=LKP.row_id 
WHERE COALESCE(LKP.row_key,case when SRC.u_incident is null then 0 else -1 end)<>TRGT.incident_key
)a;


