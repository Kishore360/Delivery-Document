select case when count(1) <> 2 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <> 2 then 'hierarchy_class is not populated for 0 and -1 row_key' else 'SUCCESS' end as Message
from #DWH_TABLE_SCHEMA.d_h_all_hierarchies
where row_key in(0,-1)
order by row_key
