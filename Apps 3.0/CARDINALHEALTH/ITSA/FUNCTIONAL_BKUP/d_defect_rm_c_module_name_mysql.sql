SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdwdb.d_defect_rm_c d
JOIN cardinalhealth_mdsdb.rm_defect_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.u_module_final c ON c.sys_id=i.u_module AND c.sourceinstance=i.sourceinstance
where d.module_name <> c.u_module_name)temp;
