select case when count(1)>0 then 'FAILURE' else 'SUCCESS' end as result
, case when count(1)>0 then 'ITEM CATEGORY,DOMAIN hierarchy class are present in d_h_all_hierarchies' else 'SUCCESS' end as message
from #DWH_TABLE_SCHEMA.d_h_all_hierarchies
where hierarchy_class in ('ITEM CATEGORY','DOMAIN')