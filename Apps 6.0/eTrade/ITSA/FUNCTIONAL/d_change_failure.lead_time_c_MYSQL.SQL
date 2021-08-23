SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.lead_time_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
From etrade_mdsdb.hlx_chg_infrastructure_change_final SRC
LEFT JOIN etrade_mdwdb.d_change_failure TRGT ON SRC.Infrastructure_Change_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CASE WHEN CONVERT_TZ(SRC.Submit_Date,'GMT','US/Central')  > 
CONVERT_TZ(SRC.Scheduled_Start_Date,'GMT','US/Central') 
THEN  -2  ELSE COALESCE(TIMESTAMPDIFF(SECOND,CONVERT_TZ(SRC.Submit_Date,'GMT','US/Central'),
CONVERT_TZ(SRC.Scheduled_Start_Date,'GMT','US/Central')),-1) END   <>TRGT.lead_time_c
AND SRC.cdctype='X'
) temp; 


,


