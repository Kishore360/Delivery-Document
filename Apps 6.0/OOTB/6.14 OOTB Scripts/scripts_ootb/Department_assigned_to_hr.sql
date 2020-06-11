select 
D.organization_name as department
,int_con.full_name as assigned_to
, count( distinct FTC.row_key) hr_changes


from 
#DWH_TABLE_SCHEMA.f_hr_change FTC
inner JOIN  #DWH_TABLE_SCHEMA.d_internal_organization D
 ON FTC.DEPARTMENT_key=D.ROW_KEY
 and FTC.soft_deleted_flag<>'Y'
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact int_con
 ON FTC.assigned_to_key=int_con.ROW_KEY
 group by 
 D.organization_name
,int_con.full_name 
order  by 
 D.organization_name
,int_con.full_name 