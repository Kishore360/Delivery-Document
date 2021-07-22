select 'ldb.f_incident_credit_score_detail a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11
union
select 'ldb.d_incident a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
union
select 'ldb.d_configuration_item_incident a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key)
join ldb.d_configuration_item_incident a13
on (a12.configuration_item_key = a13.row_key)
union
select 'ldb.d_incident_configuration_item_mdm a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_incident_credit_score_detail a11
join ldb.d_incident a12
on (a11.incident_key = a12.row_key) join ldb.d_configuration_item_incident a13
on (a12.configuration_item_key = a13.row_key)
join ldb.d_incident_configuration_item_mdm a14
on (a13.mdm_key = a14.row_key)