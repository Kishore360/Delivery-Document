select 'ldb.f_srt_members_c	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
union
select 'ldb.d_srt_members_c	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
join	ldb.d_srt_members_c	a12 
on (a11.srt_members_c_key = a12.row_key) 
union
select 'ldb.d_incident	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
join	ldb.d_incident	a13 
on (a11.incident_key = a13.row_key) 
union
select 'ldb.d_lov_status_srt_members_c	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
join	ldb.d_lov_status_srt_members_c	a14 
on (a11.status_c_key = a14.row_key) 
union
select 'ldb.d_internal_contact_team_member_c	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
join	ldb.d_internal_contact_team_member_c	a15 
on (a11.team_member_c_key = a15.row_key) 
union
select 'ldb.d_internal_organization_team_c	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
join	ldb.d_internal_organization_team_c	a16 
on (a11.team_c_key = a16.row_key) 
union
select 'ldb.d_srt_members_lov_health_check_c	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_srt_members_c	a11 
join	ldb.d_srt_members_lov_health_check_c	a16 
on (a11.health_check_src_c_key = a16.row_key)