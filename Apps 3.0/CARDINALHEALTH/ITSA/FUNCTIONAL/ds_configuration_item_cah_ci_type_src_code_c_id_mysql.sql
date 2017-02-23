
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
FROM
cardinalhealth_mdsdb.cmdb_ci_final a
left join cardinalhealth_workdb.ds_configuration_item b
on a.sys_id=b.row_id and b.source_id=a.sourceinstance
where b.cah_ci_type_src_code_c_id
<>CASE WHEN a.u_ci_type IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('U_CI_TYPE~CMDB_CI','~','','~','','~',
COALESCE(a.u_ci_type,''))) END)temp;

