-- Used the source 'sys_updated_on' column and hence the coversion is not required. Coversion is needed if we use the respective dimension column 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT 
Count(1) as CNT
FROM ntt_om_mdsdb.incident_final SRC 
JOIN ntt_om_mdwdb.d_incident TRGT1 ON SRC.sys_id=TRGT1.row_id AND SRC.sourceinstance=TRGT1.source_id
JOIN ntt_om_mdwdb.d_df_consumption LKP ON SRC.sourceinstance=LKP.sourceinstance
JOIN ntt_om_mdwdb.d_lov Sa ON CONCAT('STATE~INCIDENT~',SRC.state)=Sa.row_id 
Where SRC.cdctype='X'
AND 
CASE WHEN Sa.dimension_name NOT IN ('Closed','Resolved') THEN
CASE WHEN timestampdiff(DAY,SRC.sys_updated_on,LKP.freshness_date) > 7 THEN 'Y' ELSE 'N' END  END <>TRGT1.dormant_flag
AND TRGT1.dormant_flag<>'N'
) temp;


/* Validation Query 

SELECT SRC.number,timestampdiff(DAY,SRC.sys_updated_on,LKP.freshness_date) AS Days,
 CASE WHEN Sa.dimension_name NOT IN ('Closed','Resolved') THEN
CASE WHEN timestampdiff(DAY,SRC.sys_updated_on,LKP.freshness_date) > 7 THEN 'Y' ELSE 'N' END  END AS Source,TRGT1.dormant_flag,
Count(1) as CNT
FROM ntt_om_mdsdb.incident_final SRC 
JOIN ntt_om_mdwdb.d_incident TRGT1 ON SRC.sys_id=TRGT1.row_id AND SRC.sourceinstance=TRGT1.source_id
JOIN ntt_om_mdwdb.d_df_consumption LKP ON SRC.sourceinstance=LKP.sourceinstance
JOIN ntt_om_mdwdb.d_lov Sa ON CONCAT('STATE~INCIDENT~',SRC.state)=Sa.row_id 
JOIN ntt_om_mdwdb.d_calendar_date da ON date_format(CONVERT_TZ(COALESCE(SRC.opened_at,'UNSPECIFIED'),'UTC','America/New_York'),'%Y%m%d')=da.row_id
Where SRC.cdctype='X'
AND da.lagging_count_of_month  between 0 and 12
AND 
CASE WHEN Sa.dimension_name NOT IN ('Closed','Resolved') THEN
CASE WHEN timestampdiff(DAY,SRC.sys_updated_on,LKP.freshness_date) > 7 THEN 'Y' ELSE 'N' END  END <>TRGT1.dormant_flag
group by 1,2,3;
  */