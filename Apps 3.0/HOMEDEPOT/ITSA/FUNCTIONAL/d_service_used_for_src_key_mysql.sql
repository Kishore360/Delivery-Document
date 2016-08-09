SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_service_final a
left JOIN homedepot_mdwdb.d_service b
on concat('BUSINESS_SERVICE~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON ( concat('USED_FOR~BUSINESS_SERVICE~~~',used_for)= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN a.used_for IS NULL THEN 0 else -1 end)<>b.used_for_src_key)temp;