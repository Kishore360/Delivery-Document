select 'ldb."f_incident_keyword" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
union
select 'ldb."d_incident_keyword_group_bridge_c" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."d_incident_keyword_group_bridge_c" a12
on (a11.table_row_key = a12.keyword_incident_key)
union
select 'ldb."D_INCIDENT" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."D_INCIDENT" a13
on (a11.table_row_key = a13.ROW_KEY)
union
select 'ldb."d_keyword_group_c" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_keyword" a11
join "ldb"."d_incident_keyword_group_bridge_c" a12
on (a11.table_row_key = a12.keyword_incident_key)
join "ldb"."d_keyword_group_c" a14
on (a12.keyword_group_c_key = a14.ROW_KEY)