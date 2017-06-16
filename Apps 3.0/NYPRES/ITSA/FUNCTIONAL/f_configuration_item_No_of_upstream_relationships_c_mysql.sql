SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(
select rel.child,count(rel.parent) as src_count, min(No_of_upstream_relationships_c) as trgt_count from nypres_mdsdb.cmdb_rel_ci_final as rel
inner join nypres_mdwdb.f_configuration_item_c as fci on rel.child = fci.row_id
where rel.parent is not null
group by rel.child) as results
where results.src_count <> results.trgt_count;




