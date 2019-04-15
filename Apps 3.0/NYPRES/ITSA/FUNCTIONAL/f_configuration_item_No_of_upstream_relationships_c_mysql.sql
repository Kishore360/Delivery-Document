SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select count(a.parent_c_key) as upstream_relationships, a.child_c_key
		from nypres_mdwdb.d_configuration_item_relation_c a
		where a.parent_c_key > 0
		group by a.child_c_key) as src
 join nypres_mdwdb.f_configuration_item_c as trgt on src.child_c_key = trgt.configuration_item_key 
where src.upstream_relationships <> trgt.no_of_upstream_relationships_c;



