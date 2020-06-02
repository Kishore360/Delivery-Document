select to_char(CD.week_start_date, 'fmMM/fmDD/YYYY') Weekname,SK.dimension_name As State,PK.dimension_name As Priority,					
     trim(to_char(count(SM.incident_key),'9,99,99,990')) AS Incident_Backlog,
	trim(to_char(max(SM.age),'9,99,99,990')) AS Max_Incident_Age,		
	trim(to_char(min(SM.age),'9,99,99,990')) AS Min_Incident_Age,		
    concat(round(sum(SM.age)*1.0/count(SM.incident_key)), ' days') AS Average_Age			
from	#DWH_TABLE_SCHEMA.f_n_incident_weekly	SM	
	join	#DWH_TABLE_SCHEMA.d_internal_contact	IC
	  on 	(SM.opened_by_key = IC.row_key)	
	join	#DWH_TABLE_SCHEMA.d_calendar_date	CD
	  on 	(SM.n_key = CD.row_key)	
	join	#DWH_TABLE_SCHEMA.d_lov	PK
	  on 	(SM.priority_src_key = PK.row_key)	
	left join #DWH_TABLE_SCHEMA.d_lov	SK	
	  on 	(SM.state_src_key = SK.row_key)	
where SM.soft_deleted_flag='N'		
group by CD.week_start_date,CD.week_id,SK.dimension_name,SK.row_key,PK.dimension_name,PK.row_key
order by CD.week_id desc , SK.dimension_name,PK.dimension_name