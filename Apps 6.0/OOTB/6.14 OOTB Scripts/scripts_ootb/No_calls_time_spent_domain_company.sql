/* Percentage  of calls by contact type by each domain*/
select

case when f.domain_key='0' then 'UNSPECIFIED'
when f.domain_key='-1' then 'UNKNOWN' else
dom.domain_name end as domain_name,
case when f.master_item_key='0' then 'UNSPECIFIED'
when f.master_item_key='-1' then 'UNKNOWN' else
mast_item.item_name end as item_name
,dintorg.organization_name
,count(1)
,to_char(sum(f.time_spent/86400.00),'FM999,999,990.0') time_spent
from #DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
and f.soft_deleted_flag<>'Y'
join	#DWH_TABLE_SCHEMA.d_calendar_date 	dt
on f.opened_on_key=dt.row_key
and dt.lagging_count_of_month between 0 and 11
join	 #DWH_TABLE_SCHEMA.d_domain	dom
on dom.row_key=f.domain_key
join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
on dintorg.row_key=f.company_key
join	  #DWH_TABLE_SCHEMA.d_master_item	mast_item
on mast_item.row_key=f.master_item_key
group by
dom.domain_name 
,f.domain_key
,dintorg.organization_name
, f.master_item_key
,mast_item.item_name
order by  dom.domain_name  
,mast_item.item_name
,dintorg.organization_name
;
