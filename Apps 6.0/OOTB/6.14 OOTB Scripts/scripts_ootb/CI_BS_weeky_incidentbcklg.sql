select SRK.name As BS,CIK.name As CI_item,			
    trim(to_char(max(SM.age),'9,99,99,990')) AS Max_Incident_Age,		
	trim(to_char(min(SM.age),'9,99,99,990')) AS Min_Incident_Age,		
    concat(round(sum(SM.age)*1.0/count(SM.incident_key)), ' days') AS Average_Age 			
from	#DWH_TABLE_SCHEMA.f_n_incident_weekly	SM	
	left join	#DWH_TABLE_SCHEMA.d_internal_contact	IC
	  on 	(SM.opened_by_key = IC.row_key)	
	join	#DWH_TABLE_SCHEMA.d_calendar_date	CD
	  on 	(SM.n_key = CD.row_key)	
	left join #DWH_TABLE_SCHEMA.d_configuration_item	CIK	
	  on 	(SM.configuration_item_key = CIK.row_key)	
	left join #DWH_TABLE_SCHEMA.d_service SRK		
	  on 	(SM.business_service_key = SRK.row_key)	
where SM.soft_deleted_flag='N'
group by  CIK.row_key, SRK.row_key,SRK.name,CIK.name
order by SRK.row_key,lower(SRK.name), CIK.row_key,lower(CIK.name)