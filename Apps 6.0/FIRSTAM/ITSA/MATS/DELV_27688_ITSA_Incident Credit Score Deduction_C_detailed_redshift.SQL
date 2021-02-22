select 'ldb.f_incident_credit_score_detail_c a11 ' as Table_name, count(1) Row_Count
from ldb.f_incident_credit_score_detail_c a11
union
select 'ldb.d_incident a12 ' as Table_name, count(1) Row_Count
from ldb.f_incident_credit_score_detail_c a11

join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_change_request_change_owner_c a13 ' as Table_name, count(1) Row_Count
from ldb.f_incident_credit_score_detail_c a11

join ldb.d_change_request_change_owner_c a13
on (a11.change_request_change_owner_c_key = a13.row_key)
union
select 'ldb.d_change_request_cause_by_c a14 ' as Table_name, count(1) Row_Count
from ldb.f_incident_credit_score_detail_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_change_request_cause_by_c a14
on (a12.caused_by_change_c_key = a14.row_key)
union
select 'ldb.d_incident_priority a15 ' as Table_name, count(1) Row_Count
from ldb.f_incident_credit_score_detail_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_priority a15
on (a12.priority_src_key = a15.row_key)
union
select 'ldb.d_incident_state a16 ' as Table_name, count(1) Row_Count
from ldb.f_incident_credit_score_detail_c a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_incident_state a16
on (a12.state_src_key = a16.row_key)



