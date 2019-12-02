SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sms_risk_letters_trends_c.total_c' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_sms_risk_letters_trends_final  src
left join wpl_mdwdb.f_sms_risk_letters_trends_c trgt on src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and CAST(src.resolved AS DECIMAL)  <>trgt.resolved_c
) temp; 
