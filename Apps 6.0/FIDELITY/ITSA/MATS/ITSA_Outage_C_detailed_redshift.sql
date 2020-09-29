select 'ldb."f_incident_outage" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_application_mdm" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a13
on (a12.mdm_key = a13.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_contact_assigned_to" a14
on (a11.ASSIGNED_TO_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
union
select 'ldb."d_business_service" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_business_service" a16
on (a11.BUSINESS_SERVICE_KEY = a16.ROW_KEY)
union
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY)
join "ldb"."d_calendar_quarter" a19
on (a18.quarter_start_date_key = a19.ROW_KEY)
union
select 'ldb."d_change_request_caused_by" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
union
select 'ldb."d_configuration_item" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a111
on (a11.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a111
on (a11.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a112
on (a111.mdm_key = a112.ROW_KEY)
union
select 'ldb."D_OUTAGE" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a113
on (a11.outage_key = a113.ROW_KEY)
union
select 'ldb."D_INCIDENT" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
union
select 'ldb."d_incident_contacttype" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_contacttype" a115
on (a11.incident_reported_type_src_key = a115.ROW_KEY)
union
select 'ldb."d_incident_impact" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_impact" a116
on (a11.incident_impact_src_key = a116.ROW_KEY)
union
select 'ldb."d_incident_urgency" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_urgency" a117
on (a11.incident_urgency_src_key = a117.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_internal_organization_group" a15
on (a11.ASSIGNMENT_GROUP_KEY = a15.ROW_KEY)
join "ldb"."d_assignment_group_manager" a118
on (a15.assignment_group_manager_key = a118.ROW_KEY)
union
select 'ldb."d_business_service_criticality" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_business_service" a16
on (a11.BUSINESS_SERVICE_KEY = a16.ROW_KEY)
join "ldb"."d_business_service_criticality" a119
on (a16.criticality_key = a119.ROW_KEY)
union
select 'ldb."d_business_service_used_for" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_business_service" a16
on (a11.BUSINESS_SERVICE_KEY = a16.ROW_KEY)
join "ldb"."d_business_service_used_for" a120
on (a16.used_for_src_key = a120.ROW_KEY)
union
select 'ldb."d_calendar_week" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_week" a121
on (a17.week_start_date_key = a121.ROW_KEY)
union
select 'ldb."d_internal_contact_caused_by_change" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_internal_contact_caused_by_change" a122
on (a110.ASSIGNED_TO_KEY = a122.ROW_KEY)
union
select 'ldb."d_internal_organization_caused_by_change" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_internal_organization_caused_by_change" a123
on (a110.ASSIGNMENT_GROUP_KEY = a123.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_category" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_change_request_caused_by_category" a124
on (a110.CATEGORY_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_configuration_item_caused_by_change" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_configuration_item_caused_by_change" a125
on (a110.CONFIGURATION_ITEM_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_risk" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_change_request_caused_by_risk" a126
on (a110.RISK_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_scope" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_change_request_caused_by_scope" a127
on (a110.SCOPE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_request_caused_by_type" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_change_request_caused_by" a110
on (a11.caused_by_change_key = a110.ROW_KEY)
join "ldb"."d_change_request_caused_by_type" a128
on (a110.TYPE_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."d_incident_category" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_category" a129
on (a114.CATEGORY_SRC_KEY = a129.ROW_KEY)
union
select 'ldb."d_incident_configuration_item_mdm" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_incident_configuration_item_mdm" a130
on (a11.incident_configuration_item_key = a130.ROW_KEY)
union
select 'ldb."d_incident_priority" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_priority" a131
on (a114.PRIORITY_SRC_KEY = a131.ROW_KEY)
union
select 'ldb."d_incident_subcategory" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_INCIDENT" a114
on (a11.INCIDENT_KEY = a114.ROW_KEY)
join "ldb"."d_incident_subcategory" a132
on (a114.SUB_CATEGORY_SRC_KEY = a132.ROW_KEY)
union
select 'ldb."d_lov_outage_audience_c" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a113
on (a11.outage_key = a113.ROW_KEY)
join "ldb"."d_lov_outage_audience_c" a133
on (a113.AUDIENCE_OUTAGE_C_KEY = a133.ROW_KEY)
union
select 'ldb."d_outage_parent_outage_c" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a113
on (a11.outage_key = a113.ROW_KEY)
join "ldb"."d_outage_parent_outage_c" a134
on (a113.OUTAGE_PARENT_OUTAGE_C_KEY = a134.ROW_KEY)
union
select 'ldb."d_outage_type" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."D_OUTAGE" a113
on (a11.outage_key = a113.ROW_KEY)
join "ldb"."d_outage_type" a135
on (a113.OUTAGE_TYPE_SRC_KEY = a135.ROW_KEY)
union
select 'ldb."d_application_tier" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_tier" a136
on (a12.tier_src_key = a136.ROW_KEY)
union
select 'ldb."d_application_used_for" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_used_for" a137
on (a12.used_for_src_key = a137.ROW_KEY)
union
select 'ldb."d_ci_manufacturer" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a111
on (a11.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
join "ldb"."d_ci_manufacturer" a138
on (a111.manufacturer_key = a138.ROW_KEY)
union
select 'ldb."d_ci_vendor" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_configuration_item" a111
on (a11.CONFIGURATION_ITEM_KEY = a111.ROW_KEY)
join "ldb"."d_ci_vendor" a139
on (a111.vendor_key = a139.ROW_KEY)
union
select 'ldb."d_calendar_year" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_incident_outage" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY) join "ldb"."d_calendar_quarter" a19
on (a18.quarter_start_date_key = a19.ROW_KEY)
join "ldb"."d_calendar_year" a140
on (a19.year_start_date_key = a140.ROW_KEY)