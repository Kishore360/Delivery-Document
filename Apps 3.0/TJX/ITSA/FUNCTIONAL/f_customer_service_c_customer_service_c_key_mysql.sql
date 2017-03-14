
SELECT
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0  THEN 'MDS to DWH data validation failed for f_customer_service_c.customer_service_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) cnt from tjx_mdsdb.u_customer_service_final AS cs 
 join tjx_mdwdb.d_customer_service_c d on cs.sys_id=d.row_id and cs.sourceinstance=d.source_id
join tjx_mdwdb.f_customer_service_c fcs on cs.sys_id=fcs.row_id and cs.sourceinstance=fcs.source_id
WHERE coalesce(d.row_key,case when cs.sys_id is null then 0 else -1 end)<>fcs.customer_service_c_key)a;


