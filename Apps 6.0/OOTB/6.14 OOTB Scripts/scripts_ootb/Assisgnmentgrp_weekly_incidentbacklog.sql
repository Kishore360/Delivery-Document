select AGK.organization_name AS Assignment_Group,					
    trim(to_char(count(SM.incident_key),'9,99,99,990')) AS Incident_Backlog,
	sum(case when SM.reopened_flag ='Y' then 1 else 0 end) AS Incident_Backlog_Reopen,
	trim(to_char(max(SM.age),'9,99,99,990')) AS Max_Incident_Age,		
	trim(to_char(min(SM.age),'9,99,99,990')) AS Min_Incident_Age,		
    concat(round(sum(SM.age)*1.0/count(SM.incident_key)), ' days') AS Average_Age					
from	#DWH_TABLE_SCHEMA.f_n_incident_weekly	SM	
	join	#DWH_TABLE_SCHEMA.d_internal_contact	IC
	  on 	(SM.opened_by_key = IC.row_key)	
	join	#DWH_TABLE_SCHEMA.d_calendar_date	CD
	  on 	(SM.n_key = CD.row_key)	
	 join #DWH_TABLE_SCHEMA.d_internal_contact	AK	
	  on 	(SM.assigned_to_key = AK.row_key)	
	 join #DWH_TABLE_SCHEMA.d_internal_organization	AGK	
	  on 	(SM.assignment_group_key = AGK.row_key	)
where SM.soft_deleted_flag='N'
group by AGK.organization_name
order by lower(AGK.organization_name)