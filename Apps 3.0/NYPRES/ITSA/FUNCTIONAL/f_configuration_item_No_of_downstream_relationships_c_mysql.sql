SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select count(a.child_c_key) as downstream_relationships, a.parent_c_key
		from nypres_mdwdb.d_configuration_item_relation_c a
		where a.child_c_key > 0
		group by a.parent_c_key) as src
 join nypres_mdwdb.f_configuration_item_c as trgt on src.parent_c_key = trgt.configuration_item_key 
where src.downstream_relationships <> trgt.no_of_downstream_relationships_c;




