select 'ldb.f_incident_credit_score_detail a11 ' as Table_name, count(a11.row_key) Row_Count
 from ldb.f_incident_credit_score_detail a11 
 UNION 
select 'ldb.d_internal_organization_group a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11 
JOIN ldb.d_internal_organization_group a12 ON (a11.assignment_group_key = a12.row_key)
UNION 
select 'ldb.d_incident a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11 
JOIN ldb.d_incident a12 ON (a11.incident_key = a12.row_key)
UNION 
select 'ldb.d_incident_priority a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11 
JOIN ldb.d_incident a12 ON (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a13 on (a12.priority_src_key = a13.row_key)
UNION 
select 'ldb.d_assignment_group_manager a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11 
JOIN ldb.d_internal_organization_group a12 ON (a11.assignment_group_key = a12.row_key)
join ldb.d_assignment_group_manager	a13 on 	(a12.assignment_group_manager_key = a13.row_key)