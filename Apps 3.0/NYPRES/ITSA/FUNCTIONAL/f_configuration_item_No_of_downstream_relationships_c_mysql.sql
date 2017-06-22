SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from (
select rel.parent,count(rel.child) as src_count, min(no_of_downstream_relationships_c) as trgt_count 
from nypres_mdsdb.cmdb_rel_ci_final as rel
inner join nypres_mdwdb.f_configuration_item_c as fci on rel.parent = fci.row_id and sourceinstance=source_id
where rel.child is not null
group by rel.parent) as results
where results.src_count <> results.trgt_count;




