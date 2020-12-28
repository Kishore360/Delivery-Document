select 'ldb."f_incident_outage" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_application_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a14
on (a12.mdm_key = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_business_service" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_date" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY)
union
select 'ldb."d_calendar_month" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY)
join "ldb"."d_calendar_month" a19
on (a18.month_start_date_key = a19.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY) join "ldb"."d_calendar_month" a19
on (a18.month_start_date_key = a19.ROW_KEY)
join "ldb"."d_calendar_quarter" a110
on (a19.quarter_start_date_key = a110.ROW_KEY)
union
select 'ldb."d_change_request_caused_by" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a13.mdm_key = a112.ROW_KEY)
union
select 'ldb."D_INCIDENT" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a113
on (a11.INCIDENT_KEY = a113.ROW_KEY)
union
select 'ldb."d_outage" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage" a114
on (a11.outage_key = a114.ROW_KEY)
union
select 'ldb."d_configuration_item_incident" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item_incident" a115
on (a11.incident_configuration_item_key = a115.ROW_KEY)
union
select 'ldb."d_incident_contacttype" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_contacttype" a116
on (a11.incident_reported_type_src_key = a116.ROW_KEY)
union
select 'ldb."d_incident_impact" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_impact" a117
on (a11.incident_impact_src_key = a117.ROW_KEY)
union
select 'ldb."d_incident_urgency" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_urgency" a118
on (a11.incident_urgency_src_key = a118.ROW_KEY)
union
select 'ldb."d_application_tier" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_tier" a119
on (a12.tier_src_key = a119.ROW_KEY)
union
select 'ldb."d_application_used_for" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_used_for" a120
on (a12.used_for_src_key = a120.ROW_KEY)
union
select 'ldb."d_business_service_criticality" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."d_business_service_criticality" a121
on (a17.criticality_key = a121.ROW_KEY)
union
select 'ldb."d_business_service_used_for" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_business_service" a17
on (a11.BUSINESS_SERVICE_KEY = a17.ROW_KEY)
join "ldb"."d_business_service_used_for" a122
on (a17.used_for_src_key = a122.ROW_KEY)
union
select 'ldb."d_calendar_week" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY)
join "ldb"."d_calendar_week" a123
on (a18.week_start_date_key = a123.ROW_KEY)
union
select 'ldb."d_internal_contact_caused_by_change" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_internal_contact_caused_by_change" a124
on (a111.ASSIGNED_TO_KEY = a124.ROW_KEY)
union
select 'ldb."d_internal_organization_caused_by_change" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_internal_organization_caused_by_change" a125
on (a111.ASSIGNMENT_GROUP_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_category" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_change_request_caused_by_category" a126
on (a111.CATEGORY_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_configuration_item_caused_by_change" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_configuration_item_caused_by_change" a127
on (a111.CONFIGURATION_ITEM_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_risk" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_change_request_caused_by_risk" a128
on (a111.RISK_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_scope" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_change_request_caused_by_scope" a129
on (a111.SCOPE_SRC_KEY = a129.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_type" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a111
on (a11.CAUSED_BY_CHANGE_KEY = a111.ROW_KEY)
join "ldb"."d_change_request_caused_by_type" a130
on (a111.TYPE_SRC_KEY = a130.ROW_KEY)
union
select 'ldb."d_ci_manufacturer" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_manufacturer" a131
on (a13.manufacturer_key = a131.ROW_KEY)
union
select 'ldb."d_ci_vendor" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_ci_vendor" a132
on (a13.VENDOR_KEY = a132.ROW_KEY)
union
select 'ldb."d_incident_category" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a113
on (a11.INCIDENT_KEY = a113.ROW_KEY)
join "ldb"."d_incident_category" a133
on (a113.CATEGORY_SRC_KEY = a133.ROW_KEY)
union
select 'ldb."d_incident_priority" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a113
on (a11.INCIDENT_KEY = a113.ROW_KEY)
join "ldb"."d_incident_priority" a134
on (a113.PRIORITY_SRC_KEY = a134.ROW_KEY)
union
select 'ldb."d_incident_subcategory" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a113
on (a11.INCIDENT_KEY = a113.ROW_KEY)
join "ldb"."d_incident_subcategory" a135
on (a113.SUB_CATEGORY_SRC_KEY = a135.ROW_KEY)
union
select 'ldb."d_outage_type" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_outage" a114
on (a11.outage_key = a114.ROW_KEY)
join "ldb"."d_outage_type" a136
on (a114.outage_type_src_key = a136.ROW_KEY)
union
select 'ldb."d_calendar_year" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a18
on (a11.DATE_KEY = a18.ROW_KEY) join "ldb"."d_calendar_month" a19
on (a18.month_start_date_key = a19.ROW_KEY) join "ldb"."d_calendar_quarter" a110
on (a19.quarter_start_date_key = a110.ROW_KEY)
join "ldb"."d_calendar_year" a137
on (a110.year_start_date_key = a137.ROW_KEY)