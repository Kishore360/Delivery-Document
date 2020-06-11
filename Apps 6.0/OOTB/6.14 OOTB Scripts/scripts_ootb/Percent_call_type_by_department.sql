
/* Percentage  of calls by call type by each department*/
select
dintorg.organization_name
,f.call_type_src_code
-- ,sum(time_spent) time_spent
,count(1)/(select count(1) from #DWH_TABLE_SCHEMA.f_call) *100 as per_cnt
-- ,count(f.reported_type_src_code) as repo_type

from #DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	#DWH_TABLE_SCHEMA.d_internal_organization	dintorg
on dintorg.row_key=f.department_key

inner join #DWH_TABLE_SCHEMA.d_lov	d_lov
on d_lov.row_key=f.call_type_src_key
group by dintorg.organization_name
,f.call_type_src_code
order by dintorg.organization_name
,f.call_type_src_code
;

