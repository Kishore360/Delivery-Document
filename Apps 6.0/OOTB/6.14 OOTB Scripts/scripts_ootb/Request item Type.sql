select dm1.row_id,  item_category  , item_type_code as "Class" , ''as metric,
trim(to_char(sum(fri.price * fri.quantity),'999,999,999,990D00'))
from
#DWH_TABLE_SCHEMA.f_request_item fri
left join #DWH_TABLE_SCHEMA.d_master_item dm1
on dm1.row_key = fri.catalog_item_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd
on fri.opened_on_key = dcd.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date dcd1
on fri.closed_on_key = dcd1.row_key
left outer join	#DWH_TABLE_SCHEMA.d_request_item	dri
	  on 	(fri.request_item_key = dri.row_key)
where dcd.lagging_count_of_month between 0 and 12
or dcd1.lagging_count_of_month between 0 and 12 
group by dm1.row_id ,item_category  , item_type_code  --fri.price * fri.quantity 
order by lower(dm1.row_id) asc
