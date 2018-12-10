SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for changerequest_d_location.region_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM pandg_mdsdb.change_request_final a 
LEFT JOIN pandg_mdsdb.cmn_location_final b ON a.location=b.sys_id AND a.sourceinstance=b.sourceinstance
LEFT JOIN pandg_mdwdb.d_location trgt ON b.sys_id=trgt.row_id AND a.sourceinstance=trgt.source_id
Where b.u_pg_region<>trgt.region_name_c
) temp;




