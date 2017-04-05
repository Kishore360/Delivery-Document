select 'f_problem' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
union
select  'd_incident_category1_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_incident_category1_c   b
on  (a.prob_category_1_src_c_key = b.row_key)
UNION
select  'd_incident_category2_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_incident_category2_c  b
on  (a.prob_category_2_src_c_key = b.row_key)
UNION
select  'd_incident_category_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_incident_category_c   b
on  (a.prob_category_src_c_key = b.row_key)
UNION
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_internal_contact  b
on  (a.prob_requester_c_key = b.row_key)
UNION 
select  'd_problem_urgency' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_problem_urgency  b
on  (a.urgency_src_key = b.row_key)
UNION 
select  'd_problem_state' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_problem_state  b
on  (a.state_src_key = b.row_key)
UNION 
select  'd_problem_reported_type' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_problem_reported_type  b
on  (a.reported_type_src_key = b.row_key)
UNION 
select  'd_problem_priority' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_problem_priority  b
on  (a.priority_src_key = b.row_key)
UNION 
select  'd_problem_impact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_problem_impact  b
on  (a.impact_src_key = b.row_key)
UNION 
select  'd_problem' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_problem  b
on  (a.problem_key = b.row_key)
UNION 
select  'd_location_assigned_to' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_internal_contact  b
on  (a.prob_requester_c_key = b.row_key)
JOIN ldb.d_location_assigned_to c ON (b.location_key =c.row_key)
UNION 
select  'd_location' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_location  b
on  (a.location_key = b.row_key)
UNION 
select  'd_internal_organization_department' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_internal_contact  b on  (a.prob_requester_c_key = b.row_key)
join  ldb.d_internal_organization_department  c on  (b.department_key = c.row_key)
UNION 
select  'd_internal_organization_group' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_internal_organization_group  b
on  (a.assignment_group_key = b.row_key)
UNION 
select  'd_internal_contact_requester_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_internal_contact_requester_c  b
on  (a.prob_requester_c_key = b.row_key)
UNION 
select  'd_internal_contact_task_closed_by' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_internal_contact_task_closed_by  b
on  (a.closed_by_key = b.row_key)
UNION 
select  'd_business_service' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  ldb.d_business_service  b
on  (a.business_service_key = b.row_key)


















