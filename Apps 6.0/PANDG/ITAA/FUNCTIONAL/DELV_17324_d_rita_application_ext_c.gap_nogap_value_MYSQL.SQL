SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.gap_nogap_value' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdwdb.f_rita_application_c a
LEFT JOIN png_mdwdb.d_rita_application_c b ON a.rita_application_c_key=b.row_key
LEFT JOIN png_mdwdb.d_rita_application_ext_c c ON b.rita_application_ext_c_key=c.row_key
WHERE (CASE WHEN a.total_incomplete='0.0' THEN 'No Gap Applications' ELSE 'Gap Applications' END)<>c.gap_nogap_value
AND a.soft_deleted_flag='N'
) temp;


