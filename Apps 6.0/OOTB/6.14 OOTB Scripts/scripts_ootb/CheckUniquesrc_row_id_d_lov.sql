select case when count(1) <> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <> 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (select source_id, row_id, dimension_code from #DWH_TABLE_SCHEMA.d_lov 
where row_key not in ( -1,0)
group by source_id, row_id, dimension_code
having count(*) > 1) A