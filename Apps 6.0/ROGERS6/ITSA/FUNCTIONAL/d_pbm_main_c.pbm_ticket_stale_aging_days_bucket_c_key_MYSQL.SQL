SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_pbm_main_c.pbm_ticket_stale_aging_days_bucket_c_key' ELSE 'SUCCESS' END as Message 
FROM
(
Select Count(1) as CNT 
FROM rogers6_mdwdb.f_pbm_main_c a 
JOIN rogers6_mdwdb.d_pbm_main_c b ON a.pbm_main_c_key=b.row_key AND a.source_id=b.source_id 
JOIN rogers6_mdwdb.d_lov LKP ON dimension_class = 'WH_STALE_AGEBUCKET_C~PBM_MAIN' AND (floor(a.stale_ticket_age_c)/86400) 
between LKP.lower_range_value and LKP.upper_range_value
WHERE COALESCE(LKP.row_key,-1) <> b.pbm_ticket_stale_aging_days_bucket_c_key
AND a.soft_deleted_flag='N'
) temp;


 
 