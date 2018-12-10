select 'ldb.f_team_sprints_analysis_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_team_sprints_analysis_c  a11 
union
select'ldb.d_work_item' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_team_sprints_analysis_c  a11 
join ldb.d_work_item  a12
on (a11.work_item_key=a12.row_key)
union
select'ldb.d_work_item_iteration_m2m' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_team_sprints_analysis_c  a11 
join ldb.d_work_item_iteration_m2m  a13
on (a11.work_item_iteration_m2m_key=a13.row_key)
union
select'ldb.d_project' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_team_sprints_analysis_c  a11 
join ldb.d_project  a14
on (a11.project_key=a14.row_key)
union
select'ldb.d_work_item_assigned_to' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_team_sprints_analysis_c  a11 
 join ldb.d_work_item  a12
on (a11.work_item_key=a12.row_key)
join ldb.d_work_item_assigned_to  a15
on (a12.work_item_assigned_to_key=a15.row_key);