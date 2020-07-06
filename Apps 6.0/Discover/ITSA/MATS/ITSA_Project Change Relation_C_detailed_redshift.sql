select 'ldb.f_m2m_project_info_change_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
union
select 'ldb.d_m2m_project_info_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_info_c a12
on (a11.m2m_project_info_c_key = a12.row_key)
union
select 'ldb.d_m2m_project_signoff_approval_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_signoff_approval_c a13
on (a11.m2m_project_signoff_approval_c_key = a13.row_key)
union
select 'ldb.d_m2m_project_info_change_go_live_c a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_info_change_go_live_c a14
on (a11.m2m_project_info_change_go_live_c_key = a14.row_key)
union
select 'ldb.d_m2m_project_info_change_request_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_info_change_request_c a15
on (a11.m2m_project_info_change_request_c_key = a15.row_key)
union
select 'ldb.d_jira_team_id_c a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_info_c a12
on (a11.m2m_project_info_c_key = a12.row_key)
join ldb.d_jira_team_id_c a16
on (a12.jira_teamid_c_key = a16.row_key)
union
select 'ldb.d_project_signoff_approval_status_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_signoff_approval_c a13
on (a11.m2m_project_signoff_approval_c_key = a13.row_key)
join ldb.d_project_signoff_approval_status_c a17
on (a13.project_signoff_approval_status_c_key = a17.row_key)
union
select 'ldb.d_project_info_status_c a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_m2m_project_info_change_c a11
join ldb.d_m2m_project_info_c a12
on (a11.m2m_project_info_c_key = a12.row_key)
join ldb.d_project_info_status_c a18
on (a12.project_info_status_c_key = a18.row_key)