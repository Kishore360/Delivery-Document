
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_risk_letter_overview.next_follow_up_date_c' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM whirlpool_mdsdb.us_rlo_history_final SRC 
LEFT JOIN whirlpool_mdwdb.d_risk_letter_overview TRGT ON SRC.row_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE nextfollowupdate<>TRGT.next_follow_up_date_c  and TRGT.soft_deleted_flag='N'
) temp; 



	