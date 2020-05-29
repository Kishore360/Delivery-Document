/* No of calls made under each manager*/

select
dintcon1.full_name as mang
,count(1) as num_of_calls

from 	#DWH_TABLE_SCHEMA.f_call	f
join	#DWH_TABLE_SCHEMA.d_call 	d
on f.row_key=d.row_key
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon
on dintcon.row_key=f.opened_by_key

join	 #DWH_TABLE_SCHEMA.d_h_all_hierarchies	d_all
on dintcon.row_id=d_all.lev_0_id
and d_all.hierarchy_class='EMPLOYEE'
join	 #DWH_TABLE_SCHEMA.d_internal_contact	dintcon1
on dintcon1.row_id=d_all.lev_1_id
group by dintcon1.full_name
order by dintcon1.full_name;

