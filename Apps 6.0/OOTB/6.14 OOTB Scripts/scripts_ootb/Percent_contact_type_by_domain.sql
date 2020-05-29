/* Percentage  of calls by contact type by each domain*/
select
case when f.domain_key='0' then 'UNSPECIFIED'
when f.domain_key='0' then 'UNKNOWN' else
dintorg.domain_name end as domain_name
,f.reported_type_src_code
-- ,sum(time_spent) time_spent
,count(1)/(select count(1) from #DWH_TABLE_SCHEMA.f_call) *100 as per_cnt
-- ,count(f.reported_type_src_code) as repo_type

from #DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_domain	dintorg
on dintorg.row_key=f.domain_key

inner join #DWH_TABLE_SCHEMA.d_lov	d_lov
on d_lov.row_key=f.reported_type_src_key
group by case when f.domain_key='0' then 'UNSPECIFIED'
when f.domain_key='0' then 'UNKNOWN' else
dintorg.domain_name end 
,f.reported_type_src_code
order by case when f.domain_key='0' then 'UNSPECIFIED'
when f.domain_key='0' then 'UNKNOWN' else
dintorg.domain_name end 
,f.reported_type_src_code
;
