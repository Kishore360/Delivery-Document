SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
FROM homedepot_mdsdb.cmdb_rel_ci_final SRC 
 JOIN homedepot_mdsdb.u_cmdb_ci_service_thd_products_final LKP 
 ON SRC.parent= LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance 
join homedepot_mdwdb.d_service LKP2
on concat('BUSINESS_SERVICE~',LKP.sys_id)= LKP2.row_id
and LKP.sourceinstance=LKP2.source_id
 JOIN homedepot_mdwdb.f_cmdb_relationship_c TRGT 
 ON (LKP2.row_id =concat('BUSINESS_SERVICE~',SUBSTRING_INDEX(TRGT.row_id,'~',1)) 
 AND LKP2.source_id= TRGT.source_id  )
WHERE COALESCE(LKP2.row_key,CASE WHEN SRC.parent IS NULL THEN 0 else -1 end)<>TRGT.product_c_key)temp; 