SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_incident_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM ( SELECT * FROM  mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where  CDCTYPE<>'D') SRC  
LEFT JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN mcdonalds_mdwdb.d_incident LKP 
ON COALESCE(SRC.u_incident, 'UNSPECIFIED')=LKP.row_id 
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,case when SRC.u_incident is null then 0 else -1 end)<>TRGT.incident_key
)a;


