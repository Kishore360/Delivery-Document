SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_mdsdb.cmdb_ci_final b 
on a.row_id = b.sys_id AND a.source_id = b.sourceinstance 
LEFT OUTER JOIN cardinalhealth_mdwdb.d_lov c 
ON c.row_id = CASE WHEN b.u_ci_type IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('U_CI_TYPE~CMDB_CI','~','','~','','~',COALESCE(b.u_ci_type,''))) END 
AND c.source_id = CASE WHEN b.u_ci_type IS NULL THEN 0 ELSE b.sourceinstance END 

where a.cah_ci_type_src_code_c_key <> (c.row_key))temp;
