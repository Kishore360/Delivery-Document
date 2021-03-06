/* Time spent  on calls by item name and call type*/
select
case when f.master_item_key='0' then 'UNSPECIFIED'
when f.master_item_key='-1' then 'UNKNOWN' else
dintorg.item_name end as item_name
,f.call_type_src_code
,sum(time_spent) time_spent

-- ,count(f.reported_type_src_code) as repo_type

from #DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	  #DWH_TABLE_SCHEMA.d_master_item	dintorg
on dintorg.row_key=f.master_item_key

inner join #DWH_TABLE_SCHEMA.d_lov	d_lov
on d_lov.row_key=f.call_type_src_key
group by case when f.master_item_key='0' then 'UNSPECIFIED'
when f.master_item_key='-1' then 'UNKNOWN' else
dintorg.item_name end 
,f.call_type_src_code
order by case when f.master_item_key='0' then 'UNSPECIFIED'
when f.master_item_key='-1' then 'UNKNOWN' else
dintorg.item_name end 
,f.call_type_src_code
;