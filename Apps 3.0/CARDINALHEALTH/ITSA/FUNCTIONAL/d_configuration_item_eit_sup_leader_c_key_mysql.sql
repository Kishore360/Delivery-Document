SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdwdb.d_configuration_item a 
INNER JOIN cardinalhealth_mdsdb.cmdb_ci_application_final b 
on a.row_id = b.sys_id AND a.source_id = b.sourceinstance
LEFT OUTER JOIN cardinalhealth_mdwdb.d_internal_contact c 
ON c.row_id = COALESCE(concat('INTERNAL_CONTACT~',b.u_cah_level_3_ad),'UNSPECIFIED') AND c.source_id = b.sourceinstance
where a.eit_sup_leader_c_key <> (c.row_key) and  a.soft_deleted_flag='N' and c.soft_deleted_flag='N' )temp;

