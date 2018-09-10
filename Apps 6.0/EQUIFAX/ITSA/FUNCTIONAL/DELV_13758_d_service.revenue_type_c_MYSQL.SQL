

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_service.revenue_type_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM equifax_mdsdb.cmdb_ci_service_final src
left join equifax_mdwdb.d_service t on RIGHT(t.row_id,32)=src.sys_id and src.sourceinstance=t.source_id
WHERE COALESCE(src.u_revenue_type,'UNSPECIFIED')<>t.revenue_type_c
) temp;




