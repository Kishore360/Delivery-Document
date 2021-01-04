
select 'ldb."F_INCIDENT_CLOSED" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
union
select 'ldb."d_calendar_date" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_customer" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_customer" a14
on (a11.CUSTOMER_KEY = a14.ROW_KEY)
union
select 'ldb."D_INCIDENT" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a17
on (a13.mdm_key = a17.ROW_KEY)
union
select 'ldb."d_incident_priority" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_incident_priority" a18
on (a15.PRIORITY_SRC_KEY = a18.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_internal_contact_assigned_to" a19
on (a11.ASSIGNED_TO_KEY = a19.ROW_KEY)
union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_month" a110
on (a12.month_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_calendar_week" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_calendar_date" a12
on (a11.DATE_KEY = a12.ROW_KEY)
join "ldb"."d_calendar_week" a111
on (a12.week_start_date_key = a111.ROW_KEY)
union
select 'ldb."d_customer_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_customer" a14
on (a11.CUSTOMER_KEY = a14.ROW_KEY)
join "ldb"."d_customer_mdm" a112
on (a14.customer_mdm_key = a112.ROW_KEY)
union
select 'ldb."d_domain" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."d_domain" a113
on (a11.DOMAIN_KEY = a113.ROW_KEY)
union
select 'ldb."d_incident_category" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_incident_category" a114
on (a15.CATEGORY_SRC_KEY = a114.ROW_KEY)
union
select 'ldb."d_incident_state" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_incident_state" a115
on (a15.STATE_SRC_KEY = a115.ROW_KEY)
union
select 'ldb."d_incident_subcategory" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_INCIDENT_CLOSED" a11
join "ldb"."D_INCIDENT" a15
on (a11.INCIDENT_KEY = a15.ROW_KEY)
join "ldb"."d_incident_subcategory" a116
on (a15.SUB_CATEGORY_SRC_KEY = a116.ROW_KEY)