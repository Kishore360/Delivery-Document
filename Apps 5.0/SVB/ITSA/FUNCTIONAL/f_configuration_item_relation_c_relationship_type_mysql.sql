SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from svb_mdwdb.f_configuration_item_relation_c a
JOIN svb_mdsdb.cmdb_rel_ci_final b 
ON a.row_id=b.sys_id AND a.source_id=b.sourceinstance 
LEFT JOIN svb_mdsdb.cmdb_rel_type_final e 
ON b.type= e.sys_id
where e.name<> a.relationship_type;