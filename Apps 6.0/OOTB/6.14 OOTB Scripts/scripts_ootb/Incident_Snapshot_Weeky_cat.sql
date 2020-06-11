select CAT.dimension_name AS Category,
    SM.reopened_flag,
    trim(to_char(count(SM.incident_key),'9,99,99,990')) AS Incident_Backlog,
	sum(case when SM.reopened_flag ='Y' then 1 else 0 end) AS Incident_Backlog_Reopen,
	trim(to_char(max(SM.age),'9,99,99,990')) AS Max_Incident_Age,		
	trim(to_char(min(SM.age),'9,99,99,990')) AS Min_Incident_Age,		
    concat(round(sum(SM.age)*1.0/count(SM.incident_key)), ' days') AS Average_Age

from   #DWH_TABLE_SCHEMA.f_n_incident_weekly    SM

       join   #DWH_TABLE_SCHEMA.d_calendar_date  CD

         on   (SM.n_key = CD.row_key)

       join   #DWH_TABLE_SCHEMA.d_internal_organization D

         on   (SM.opened_by_department_key = D.row_key)

       join   #DWH_TABLE_SCHEMA.d_internal_contact ATK

         on   (ATK.row_key = SM.assigned_to_key)

       join   #DWH_TABLE_SCHEMA.d_internal_organization IOG

         on   (SM.assignment_group_key = IOG.row_key)

       join   #DWH_TABLE_SCHEMA.d_service BS

         on   (SM.business_service_key = BS.row_key)

       join   #DWH_TABLE_SCHEMA.d_configuration_item    CIK

         on   (SM.configuration_item_key = CIK.row_key)

       join   #DWH_TABLE_SCHEMA.d_internal_organization DEPT

         on   (SM.opened_by_department_key = DEPT.row_key)

       join   #DWH_TABLE_SCHEMA.d_lov CAT

         on   (SM.category_src_key = CAT.row_key)

       join   #DWH_TABLE_SCHEMA.d_lov     PRI

         on   (SM.priority_src_key = PRI.row_key)

       join   #DWH_TABLE_SCHEMA.d_lov     ST

         on   (SM.state_src_key = ST.row_key)

where SM.soft_deleted_flag='N'
group by  CAT.dimension_name, SM.reopened_flag
order by  CAT.dimension_name, SM.reopened_flag