SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.business_area_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM mdw.d_change_failure a 
JOIN mdw.d_change_approver_c b ON a.business_area_c_key=b.row_key
WHERE b.business_area_c<>a.business_area_c
AND a.current_flag='Y'
AND a.soft_deleted_flag='N'

) temp; 