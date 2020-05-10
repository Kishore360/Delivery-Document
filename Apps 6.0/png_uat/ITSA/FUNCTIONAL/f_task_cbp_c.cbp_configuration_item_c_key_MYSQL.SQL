


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_cbp_c.cbp_configuration_item_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT
FROM png_mdsdb.u_pg_task_cmdb_ci_business_process_final a 
JOIN png_mdwdb.f_task_cbp_c b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
JOIN png_mdwdb.d_configuration_item LKP ON a.u_pg_ci=LKP.row_id AND a.sourceinstance=LKP.source_id
WHERE coalesce(LKP.row_key,CASE WHEN a.u_pg_ci IS NULL THEN 0 ELSE -1 END)<>b.cbp_configuration_item_c_key
) temp;




 
  