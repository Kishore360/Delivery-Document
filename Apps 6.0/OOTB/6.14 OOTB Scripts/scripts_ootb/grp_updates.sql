-- CURRENT GRP AND UPDATES

 
 select 
coalesce(CG.organization_name, case when F.assignment_group_key is NULL then 'UNSPECIFIED' else 'UNKNOWN' end)  as Current_group,sum(F.update_count) as Updates
 from #DWH_TABLE_SCHEMA.f_incident as F
left join #DWH_TABLE_SCHEMA.d_internal_organization CG
    on (CG.row_key=F.assignment_group_key)	
	 join #DWH_TABLE_SCHEMA.d_calendar_date as cal on cal.row_key = F.opened_on_key
 and cal.lagging_count_of_month between 0 and 12 
 where F.update_count > 0
 group by coalesce(CG.organization_name, case when F.assignment_group_key is NULL then 'UNSPECIFIED' else 'UNKNOWN' end)
	