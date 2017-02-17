SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT from cardinalhealth_mdsdb.cmdb_ci_final a
join cardinalhealth_mdwdb.d_configuration_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdsdb.sys_user_final suo 
ON a.owned_by=suo.sys_id and a.sourceinstance=suo.sourceinstance  
LEFT JOIN cardinalhealth_mdsdb.sys_user_final svp 
ON suo.u_vp=svp.sys_id and svp.sourceinstance=suo.sourceinstance 
where b.vp_c <> CONCAT_WS(' ',svp.first_name, svp.last_name))temp;
