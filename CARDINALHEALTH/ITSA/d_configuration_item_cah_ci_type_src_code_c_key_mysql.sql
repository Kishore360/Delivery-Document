SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_mdsdb.cmdb_ci_final b 
on a.row_id = b.sys_id AND a.source_id = b.sourceinstance 
LEFT OUTER JOIN cardinalhealth_mdwdb.d_lov c 
ON c.row_id = CASE WHEN b.u_ci_type IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('U_CI_TYPE~CMDB_CI','~','','~','','~',COALESCE(b.u_ci_type,''))) END 
AND c.source_id = CASE WHEN b.u_ci_type IS NULL THEN 0 ELSE b.sourceinstance END 
<<<<<<< HEAD
where a.cah_ci_type_src_code_c_key <> (c.row_key); 
=======
where a.cah_ci_type_src_code_c_key <> COALESCE(c.row_key,''); 
>>>>>>> b24a4dfda5506de5959fa3ef85cf0d2c8e75a5ef
