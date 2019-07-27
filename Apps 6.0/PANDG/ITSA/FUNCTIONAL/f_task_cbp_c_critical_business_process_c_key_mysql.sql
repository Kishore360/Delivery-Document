SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task_cbp_c.critical_business_process_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from png_mdsdb.u_pg_task_cmdb_ci_business_process_final where CDCTYPE<>'D') a 
join 
png_mdwdb.d_critical_business_process_c b
on coalesce(a.u_impacted_cbp,'UNSPECIFIED') =b.row_id
JOIN png_mdwdb.f_task_cbp_c c ON a.sys_id=c.row_id AND a.sourceinstance=c.source_id
WHERE coalesce(b.row_key,case when a.u_impacted_cbp is null then 0 else -1 end )<>c.critical_business_process_c_key
) temp;