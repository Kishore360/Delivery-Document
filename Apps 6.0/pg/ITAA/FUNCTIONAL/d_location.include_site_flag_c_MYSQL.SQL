SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_location.include_site_flag_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM png_mdwdb.d_location a 
INNER JOIN png_mdwdb.d_site_mapping_c b ON a.location_name=b.cmdb_site_name_c
WHERE CASE WHEN b.soft_deleted_flag ='Y' THEN 'N' ELSE 'Y' END  <> a.include_site_flag_c
) temp;


