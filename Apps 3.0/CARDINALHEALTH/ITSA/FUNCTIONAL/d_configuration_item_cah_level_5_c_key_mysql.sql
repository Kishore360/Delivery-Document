SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_configuration_item a 
INNER JOIN cardinalhealth_mdsdb.cmdb_ci_application_final b 
on a.row_id = b.sys_id AND a.source_id = b.sourceinstance
LEFT OUTER JOIN cardinalhealth_mdwdb.d_internal_contact c 
ON c.row_id = COALESCE(concat('INTERNAL_CONTACT~',ccaf.u_cah_level_5_primary_contact),'UNSPECIFIED') AND c.source_id = b.sourceinstance
where a.cah_level_5_c_key <> (c.row_key);

