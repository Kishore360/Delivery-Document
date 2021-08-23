SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.etr_projectid_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
From etrade_mdsdb.hlx_chg_infrastructure_change_final SRC
LEFT JOIN etrade_mdwdb.d_change_failure TRGT ON SRC.Infrastructure_Change_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.ETR_ProjectID,'UNSPECIFIED')<>TRGT.etr_projectid_c
AND SRC.cdctype='X'
) temp; 





  