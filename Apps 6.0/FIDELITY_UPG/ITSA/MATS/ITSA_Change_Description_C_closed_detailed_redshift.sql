select 'ldb."F_CHANGE_REQUEST_CLOSED" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
union
select 'ldb."D_CHANGE_REQUEST" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
union
select 'ldb."d_application" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
union
select 'ldb."d_application_mdm" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_application" a13
on (a11.APPLICATION_KEY = a13.ROW_KEY)
join "ldb"."d_application_mdm" a14
on (a13.mdm_key = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_internal_contact_assigned_to" a15
on (a11.ASSIGNED_TO_KEY = a15.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
union
select 'ldb."d_calendar_date" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_month" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY)
join "ldb"."d_calendar_quarter" a19
on (a18.quarter_start_date_key = a19.ROW_KEY)
union
select 'ldb."d_change_application_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_application_c" a110
on (a12.APPLICATION_C_KEY = a110.ROW_KEY)
union
select 'ldb."d_change_configuration_item_c" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_configuration_item_c" a111
on (a12.CONFIGURATION_ITEM_C_KEY = a111.ROW_KEY)
union
select 'ldb."d_change_assignment_group_c" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_assignment_group_c" a112
on (a12.ASSIGNMENT_GROUP_KEY = a112.ROW_KEY)
union
select 'ldb."d_change_request_risk" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_risk" a113
on (a11.RISK_SRC_KEY = a113.ROW_KEY)
union
select 'ldb."d_configuration_item" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_configuration_item" a114
on (a11.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_configuration_item" a114
on (a11.CONFIGURATION_ITEM_KEY = a114.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a115
on (a114.mdm_key = a115.ROW_KEY)
union
select 'ldb."d_internal_contact" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_internal_contact" a116
on (a11.EMPLOYEE_KEY = a116.ROW_KEY)
union
select 'ldb."d_calendar_week" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY)
join "ldb"."d_calendar_week" a117
on (a17.week_start_date_key = a117.ROW_KEY)
union
select 'ldb."d_calendar_year" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_calendar_date" a17
on (a11.DATE_KEY = a17.ROW_KEY) join "ldb"."d_calendar_month" a18
on (a17.month_start_date_key = a18.ROW_KEY) join "ldb"."d_calendar_quarter" a19
on (a18.quarter_start_date_key = a19.ROW_KEY)
join "ldb"."d_calendar_year" a118
on (a19.year_start_date_key = a118.ROW_KEY)
union
select 'ldb."d_internal_contact_programmer_c" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_internal_contact_programmer_c" a119
on (a12.PROGRAMMER_C_KEY = a119.ROW_KEY)
union
select 'ldb."d_change_request_approval" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_approval" a120
on (a11.APPROVAL_STATE_SRC_KEY = a120.ROW_KEY)
union
select 'ldb."d_change_request_impact" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_impact" a121
on (a11.IMPACT_SRC_KEY = a121.ROW_KEY)
union
select 'ldb."d_change_request_priority" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_priority" a122
on (a11.PRIORITY_SRC_KEY = a122.ROW_KEY)
union
select 'ldb."d_change_request_reason" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_reason" a123
on (a11.REASON_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."d_change_request_review_status" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_review_status" a124
on (a11.REVIEW_STATUS_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."d_change_request_scope" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_scope" a125
on (a11.SCOPE_SRC_KEY = a125.ROW_KEY)
union
select 'ldb."d_change_request_state" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_state" a126
on (a11.STATE_SRC_KEY = a126.ROW_KEY)
union
select 'ldb."d_change_request_type" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_type" a127
on (a11.TYPE_SRC_KEY = a127.ROW_KEY)
union
select 'ldb."d_change_request_urgency" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_urgency" a128
on (a11.URGENCY_SRC_KEY = a128.ROW_KEY)
union
select 'ldb."d_domain" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_domain" a129
on (a11.DOMAIN_KEY = a129.ROW_KEY)
union
select 'ldb."D_INCIDENT" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_INCIDENT" a130
on (a11.INCIDENT_KEY = a130.ROW_KEY)
union
select 'ldb."d_location" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_location" a131
on (a11.LOCATION_KEY = a131.ROW_KEY)
union
select 'ldb."D_PROBLEM" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_PROBLEM" a132
on (a11.PROBLEM_KEY = a132.ROW_KEY)
union
select 'ldb."d_internal_contact_alt_programmer_c" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_internal_contact_alt_programmer_c" a133
on (a12.ALT_PROGRAMMER_C_KEY = a133.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_internal_organization_group" a16
on (a11.ASSIGNMENT_GROUP_KEY = a16.ROW_KEY)
join "ldb"."d_assignment_group_manager" a134
on (a16.assignment_group_manager_key = a134.ROW_KEY)
union
select 'ldb."d_internal_organization_bu_oversight_group_c" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_internal_organization_bu_oversight_group_c" a135
on (a12.BU_OVERSIGHT_GROUP_C_KEY = a135.ROW_KEY)
union
select 'ldb."d_u_activity_type_c" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_u_activity_type_c" a136
on (a12.U_ACTIVITY_TYPE_C_KEY = a136.ROW_KEY)
union
select 'ldb."d_change_request_category" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_change_request_category" a137
on (a11.CATEGORY_SRC_KEY = a137.ROW_KEY)
union
select 'ldb."d_change_request_close_code" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_request_close_code" a138
on (a12.CLOSE_CODE_SRC_KEY = a138.ROW_KEY)
union
select 'ldb."d_change_request_ppmc_request_c" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_request_ppmc_request_c" a139
on (a12.PPMC_REQUEST_C_KEY = a139.ROW_KEY)
union
select 'ldb."d_lov_change_request_impact_capacity_plan_c" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_impact_capacity_plan_c" a140
on (a12.CHANGE_REQUEST_IMPACT_CAPACITY_PLAN_C_KEY = a140.ROW_KEY)
union
select 'ldb."d_change_request_template_c" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_request_template_c" a141
on (a12.TEMPLATE_C_KEY = a141.ROW_KEY)
union
select 'ldb."d_lov_change_request_template_type_c" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_template_type_c" a142
on (a12.CHANGE_REQUEST_TEMPLATE_TYPE_C_KEY = a142.ROW_KEY)
union
select 'ldb."d_lov_change_request_tier_4_restricted_access_c" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_tier_4_restricted_access_c" a143
on (a12.CHANGE_REQUEST_TIER_4_RESTRICTED_ACCESS_C_KEY = a143.ROW_KEY)
union
select 'ldb."d_change_requested_by_c" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_change_requested_by_c" a144
on (a12.REQUESTED_BY_C_KEY = a144.ROW_KEY)
union
select 'ldb."d_lov_change_trigger_c" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_trigger_c" a145
on (a12.CHANGE_TRIGGER_SRC_C_KEY = a145.ROW_KEY)
union
select 'ldb."d_lov_change_request_conflict_status_c" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_conflict_status_c" a146
on (a12.CONFLICT_STATUS_SRC_C_KEY = a146.ROW_KEY)
union
select 'ldb."d_internal_organization_creating_group_c" a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_internal_organization_creating_group_c" a147
on (a12.CREATING_GROUP_C_KEY = a147.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."d_internal_contact" a116
on (a11.EMPLOYEE_KEY = a116.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a148
on (a116.employee_mdm_key = a148.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a149
on (a12.CHANGE_ENVIRONMENT_SRC_C_KEY = a149.ROW_KEY)
union
select 'ldb."d_lov_change_environment_details_c" a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_environment_details_c" a150
on (a12.ENVIRONMENT_DETAILS_SRC_C_KEY = a150.ROW_KEY)
union
select 'ldb."d_lov_change_request_fsc_service_required_c" a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_fsc_service_required_c" a151
on (a12.FSC_SERVICES_REQUIRED_SRC_C_KEY = a151.ROW_KEY)
union
select 'ldb."d_lov_change_impact_continuity_plan_c" a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_impact_continuity_plan_c" a152
on (a12.IMPACT_CONTINUITY_PLAN_SRC_C_KEY = a152.ROW_KEY)
union
select 'ldb."d_lov_change_request_impact_security_controls_c" a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_impact_security_controls_c" a153
on (a12.CHANGE_REQUEST_IMPACT_SECURITY_CONTROLS_C_KEY = a153.ROW_KEY)
union
select 'ldb."d_lov_change_impact_availability_plan_c" a154 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_impact_availability_plan_c" a154
on (a12.IMPACT_AVAILABILITY_PLAN_SRC_C_KEY = a154.ROW_KEY)
union
select 'ldb."d_lov_change_is_application_outage_required_c" a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_is_application_outage_required_c" a155
on (a12.IS_APPLICATION_OUTAGE_REQUIRED_SRC_C_KEY = a155.ROW_KEY)
union
select 'ldb."d_lov_change_server_outage_c" a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_server_outage_c" a156
on (a12.SERVER_OUTAGE_SRC_C_KEY = a156.ROW_KEY)
union
select 'ldb."d_lov_change_mf_online_inst_newcopy_met_c" a157 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_mf_online_inst_newcopy_met_c" a157
on (a12.MF_ONLINE_INST_NEWCOPY_MET_SRC_C_KEY = a157.ROW_KEY)
union
select 'ldb."d_lov_change_outage_type_c" a158 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_outage_type_c" a158
on (a12.OUTAGE_TYPE_SRC_C_KEY = a158.ROW_KEY)
union
select 'ldb."d_lov_change_reason_for_application_outage_c" a159 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_reason_for_application_outage_c" a159
on (a12.REASON_FOR_APPLICATION_OUTAGE_SRC_C_KEY = a159.ROW_KEY)
union
select 'ldb."d_internal_organization_requesting_group_c" a160 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_internal_organization_requesting_group_c" a160
on (a12.REQUESTING_GROUP_C_KEY = a160.ROW_KEY)
union
select 'ldb."d_lov_change_sub_category_c" a161 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_sub_category_c" a161
on (a12.SUB_CATEGORY_SRC_C_KEY = a161.ROW_KEY)
union
select 'ldb."d_lov_change_request_sysplex_c" a162 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_REQUEST_CLOSED" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_request_sysplex_c" a162
on (a12.SYSPLEX_SRC_C_KEY = a162.ROW_KEY)