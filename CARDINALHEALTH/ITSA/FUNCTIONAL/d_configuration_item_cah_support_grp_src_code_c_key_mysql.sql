SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a
join cardinalhealth_mdsdb.cmdb_ci_application_final b
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
left join cardinalhealth_mdwdb.d_lov c
on c.row_id = CONCAT('U_CAH_LEVEL_2~CMDB_CI_APPLICATION','~','','~','','~',COALESCE(UPPER(b.u_cah_level_2),'')) 
AND c.source_id = CASE WHEN b.u_cah_level_2 IS NULL THEN 0 ELSE b.sourceinstance END

where a.cah_support_grp_src_code_c_key<>coalesce(c.row_key,CASE WHEN b.u_cah_level_2 IS NULL THEN 0 ELSE -1 end)