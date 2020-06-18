select 'ldb."F_APPLICATION_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
union
select 'ldb."D_APPLICATION_C" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
union
select 'ldb."D_APPLICATION_BUSINESS_CRITICALITY_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_BUSINESS_CRITICALITY_C" a13
on (a12.APPLICATION_BUSINESS_CRITICALITY_C_KEY = a13.ROW_KEY)
union
select 'ldb."D_APPLICATION_BUSINESS_OWNER_C" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_BUSINESS_OWNER_C" a14
on (a12.APPLICATION_BUSINESS_OWNER_C_KEY = a14.ROW_KEY)
union
select 'ldb."D_APPLICATION_CATEGORY_C" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_CATEGORY_C" a15
on (a12.APPLICATION_CATEGORY_C_KEY = a15.ROW_KEY)
union
select 'ldb."D_APPLICATION_CHANGE_CONTROL_C" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_CHANGE_CONTROL_C" a16
on (a12.APPLICATION_CHANGE_CONTROL_C_KEY = a16.ROW_KEY)
union
select 'ldb."D_APPLICATION_SYS_CLASS_NAME_C" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_SYS_CLASS_NAME_C" a17
on (a12.APPLICATION_SYS_CLASS_NAME_C_KEY = a17.ROW_KEY)
union
select 'ldb."D_APPLICATION_COMPANY_C" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_COMPANY_C" a18
on (a12.APPLICATION_COMPANY_C_KEY = a18.ROW_KEY)
union
select 'ldb."D_APPLICATION_OPERATIONAL_STATUS_C" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_OPERATIONAL_STATUS_C" a19
on (a12.APPLICATION_OPERATIONAL_STATUS_C_KEY = a19.ROW_KEY)
union
select 'ldb."D_APPLICATION_PRIMARY_DATA_CENTER_C" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_PRIMARY_DATA_CENTER_C" a110
on (a12.APPLICATION_PRIMARY_DATA_CENTER_C_KEY = a110.ROW_KEY)
union
select 'ldb."D_APPLICATION_OWNED_BY_C" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_OWNED_BY_C" a111
on (a12.APPLICATION_OWNED_BY_C_KEY = a111.ROW_KEY)
union
select 'ldb."D_APPLICATION_REPLICATION_METHOD_C" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_REPLICATION_METHOD_C" a112
on (a12.APPLICATION_REPLICATION_METHOD_C_KEY = a112.ROW_KEY)
union
select 'ldb."D_APPLICATION_RISK_RATING_C" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_RISK_RATING_C" a113
on (a12.APPLICATION_RISK_RATING_C_KEY = a113.ROW_KEY)
union
select 'ldb."D_APPLICATION_SDLC_JIRA_C" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_SDLC_JIRA_C" a114
on (a12.APPLICATION_SDLC_JIRA_ID_C_KEY = a114.ROW_KEY)
union
select 'ldb."D_APPLICATION_SECONDARY_DATA_CENTER_C" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_SECONDARY_DATA_CENTER_C" a115
on (a12.APPLICATION_SECONDARY_DATA_CENTER_C_KEY = a115.ROW_KEY)
union
select 'ldb."D_APPLICATION_SOFTWARE_STATUS_C" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_SOFTWARE_STATUS_C" a116
on (a12.APPLICATION_SOFTWARE_STATUS_C_KEY = a116.ROW_KEY)
union
select 'ldb."D_APPLICATION_SUBCATEGORY_C" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_SUBCATEGORY_C" a117
on (a12.APPLICATION_SUBCATEGORY_C_KEY = a117.ROW_KEY)
union
select 'ldb."D_APPLICATION_SUPPORT_GROUP_C" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_SUPPORT_GROUP_C" a118
on (a12.APPLICATION_SUPPORT_GROUP_C_KEY = a118.ROW_KEY)
union
select 'ldb."D_APPLICATION_VENDOR_C" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_APPLICATION_C" a11
join "ldb"."D_APPLICATION_C" a12
on (a11.APPLICATION_C_KEY = a12.ROW_KEY)
join "ldb"."D_APPLICATION_VENDOR_C" a119
on (a12.APPLICATION_VENDOR_C_KEY = a119.ROW_KEY)




