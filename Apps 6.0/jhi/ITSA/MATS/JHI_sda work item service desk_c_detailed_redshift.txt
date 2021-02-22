select 'ldb."F_WORK_ITEM" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
union
select 'ldb."d_internal_contact" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_internal_contact" a12
on (a11.EMPLOYEE_KEY = a12.ROW_KEY)
union
select 'ldb."d_calendar_date" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
union
select 'ldb."d_calendar_month" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_month" a14
on (a13.month_start_date_key = a14.ROW_KEY)
union
select 'ldb."d_calendar_quarter" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY) join "ldb"."d_calendar_month" a14
on (a13.month_start_date_key = a14.ROW_KEY)
join "ldb"."d_calendar_quarter" a15
on (a14.quarter_start_date_key = a15.ROW_KEY)
union
select 'ldb."D_WORK_ITEM" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_EPIC" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_EPIC" a17
on (a16.WORK_ITEM_EPIC_KEY = a17.ROW_KEY)
union
select 'ldb."d_calendar_week" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY)
join "ldb"."d_calendar_week" a18
on (a13.week_start_date_key = a18.ROW_KEY)
union
select 'ldb."d_calendar_year" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_calendar_date" a13
on (a11.DATE_KEY = a13.ROW_KEY) join "ldb"."d_calendar_month" a14
on (a13.month_start_date_key = a14.ROW_KEY) join "ldb"."d_calendar_quarter" a15
on (a14.quarter_start_date_key = a15.ROW_KEY)
join "ldb"."d_calendar_year" a19
on (a15.year_start_date_key = a19.ROW_KEY)
union
select 'ldb."d_iteration" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_iteration" a110
on (a16.ITERATION_KEY = a110.ROW_KEY)
union
select 'ldb."d_project" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_project" a111
on (a11.PROJECT_KEY = a111.ROW_KEY)
union
select 'ldb."d_work_item_earliest_fixed_version" a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_earliest_fixed_version" a112
on (a16.EARLIEST_FIXED_VERSION_KEY = a112.ROW_KEY)
union
select 'ldb."d_work_item_status" a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_status" a113
on (a16.WORK_ITEM_STATUS_SRC_KEY = a113.ROW_KEY)
union
select 'ldb."D_WORKITEM_CHANGE_REQUEST_C" a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORKITEM_CHANGE_REQUEST_C" a114
on (a16.WORKITEM_CHANGE_REQUEST_C_KEY = a114.ROW_KEY)
union
select 'ldb."D_WORKITEM_INCIDENT_C" a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORKITEM_INCIDENT_C" a115
on (a16.WORKITEM_INCIDENT_C_KEY = a115.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_internal_contact_assigned_to" a116
on (a11.WORK_ITEM_ASSIGNED_TO_KEY = a116.ROW_KEY)
union
select 'ldb."d_current_est_bucket" a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_current_est_bucket" a117
on (a11.CURRENT_EST_BUCKET_KEY = a117.ROW_KEY)
union
select 'ldb."d_internal_contact_mdm" a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_internal_contact" a12
on (a11.EMPLOYEE_KEY = a12.ROW_KEY)
join "ldb"."d_internal_contact_mdm" a118
on (a12.employee_mdm_key = a118.ROW_KEY)
union
select 'ldb."d_original_time_bucket" a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_original_time_bucket" a119
on (a11.ORIGINAL_TIME_BUCKET_KEY = a119.ROW_KEY)
union
select 'ldb."d_time_spent_bucket" a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_time_spent_bucket" a120
on (a11.TIME_SPENT_BUCKET_KEY = a120.ROW_KEY)
union
select 'ldb."D_PRODUCT_OWNER_C" a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_PRODUCT_OWNER_C" a121
on (a16.PRODUCT_OWNER_C_KEY = a121.ROW_KEY)
union
select 'ldb."D_PRODUCT_TEAM_SCRUM_MASTER_C" a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_PRODUCT_TEAM_SCRUM_MASTER_C" a122
on (a16.PRODUCT_TEAM_SCRUM_MASTER_C_KEY = a122.ROW_KEY)
union
select 'ldb."d_project_category" a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_project" a111
on (a11.PROJECT_KEY = a111.ROW_KEY)
join "ldb"."d_project_category" a123
on (a111.PROJECT_CATEGORY_SRC_KEY = a123.ROW_KEY)
union
select 'ldb."d_project_classification" a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."d_project" a111
on (a11.PROJECT_KEY = a111.ROW_KEY)
join "ldb"."d_project_classification" a124
on (a111.PROJECT_CLASSIFICATION_SRC_KEY = a124.ROW_KEY)
union
select 'ldb."D_SYSTEM_JIRA_PROJECT_C" a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_SYSTEM_JIRA_PROJECT_C" a125
on (a16.SYSTEM_JIRA_PROJECT_C_KEY = a125.ROW_KEY)
union
select 'ldb."D_WI_PRODT_TEAM_AGILE_TRAINING_STATUS_C" a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WI_PRODT_TEAM_AGILE_TRAINING_STATUS_C" a126
on (a16.WI_PRODT_TEAM_AGILE_TRAINING_STATUS_C_KEY = a126.ROW_KEY)
union
select 'ldb."d_work_item_cancelled_by" a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_cancelled_by" a127
on (a16.CANCELLED_BY_KEY = a127.ROW_KEY)
union
select 'ldb."d_work_item_closed_by" a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_closed_by" a128
on (a16.WORK_ITEM_CLOSED_BY_KEY = a128.ROW_KEY)
union
select 'ldb."d_work_item_created_by" a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_created_by" a129
on (a16.CREATED_BY_KEY = a129.ROW_KEY)
union
select 'ldb."D_WI_PRODT_TEAM_DOMAIN_C" a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WI_PRODT_TEAM_DOMAIN_C" a130
on (a16.WI_PRODT_TEAM_DOMAIN_C_KEY = a130.ROW_KEY)
union
select 'ldb."D_JIRA_TRAINING_STATUS_C" a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_JIRA_TRAINING_STATUS_C" a131
on (a16.WI_PRODT_TEAM_JIRA_TRAINING_STATUS_C_KEY = a131.ROW_KEY)
union
select 'ldb."d_work_item_link_type" a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_link_type" a132
on (a16.WORK_ITEM_LINK_TYPE_SRC_KEY = a132.ROW_KEY)
union
select 'ldb."d_primary_component" a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_primary_component" a133
on (a16.PRIMARY_COMPONENT_KEY = a133.ROW_KEY)
union
select 'ldb."d_work_item_priority" a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_priority" a134
on (a16.WORK_ITEM_PRIORITY_SRC_KEY = a134.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_PROJECT_LEAD_C" a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_PROJECT_LEAD_C" a135
on (a16.WORK_ITEM_PROJECT_LEAD_C_KEY = a135.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_PROJECT_TYPE_C" a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_PROJECT_TYPE_C" a136
on (a16.WORK_ITEM_PROJECT_TYPE_C_KEY = a136.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_SYSTEM_QA_RISK_PROFILE_C" a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_SYSTEM_QA_RISK_PROFILE_C" a137
on (a16.WORK_ITEM_SYSTEM_QA_RISK_PROFILE_C_KEY = a137.ROW_KEY)
union
select 'ldb."d_work_item_reason" a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_reason" a138
on (a16.WORK_ITEM_REASON_SRC_KEY = a138.ROW_KEY)
union
select 'ldb."d_work_item_reported_by" a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_reported_by" a139
on (a16.WORK_ITEM_REPORTED_BY_KEY = a139.ROW_KEY)
union
select 'ldb."d_work_item_resolution" a140 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_resolution" a140
on (a16.WORK_ITEM_RESOLUTION_SRC_KEY = a140.ROW_KEY)
union
select 'ldb."d_work_item_resolved_by" a141 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_resolved_by" a141
on (a16.WORK_ITEM_RESOLVED_BY_KEY = a141.ROW_KEY)
union
select 'ldb."d_work_item_risk" a142 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_risk" a142
on (a16.WORK_ITEM_RISK_SRC_KEY = a142.ROW_KEY)
union
select 'ldb."D_WI_PRODT_TEAM_SDLC_METHODOLOGY_C" a143 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WI_PRODT_TEAM_SDLC_METHODOLOGY_C" a143
on (a16.WI_PRODT_TEAM_SDLC_METHODOLOGY_C_KEY = a143.ROW_KEY)
union
select 'ldb."d_work_item_severity" a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_severity" a144
on (a16.WORK_ITEM_SEVERITY_SRC_KEY = a144.ROW_KEY)
union
select 'ldb."d_work_item_status_category" a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_status_category" a145
on (a16.WORK_ITEM_STATUS_CATEGORY_SRC_KEY = a145.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_STORY_ACCEPTED_BY_C" a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_STORY_ACCEPTED_BY_C" a146
on (a16.WORK_ITEM_STORY_ACCEPTED_BY_C_KEY = a146.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_STORY_ISSUE_TYPE_C" a147 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_STORY_ISSUE_TYPE_C" a147
on (a16.WORK_ITEM_STORY_ISSUE_TYPE_C_KEY = a147.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_STORY_REQUESTER_C" a148 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_STORY_REQUESTER_C" a148
on (a16.WORK_ITEM_STORY_REQUESTER_C_KEY = a148.ROW_KEY)
union
select 'ldb."D_WI_PRODT_TEAM_SUB_DOMAIN_C" a149 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WI_PRODT_TEAM_SUB_DOMAIN_C" a149
on (a16.WI_PRODT_TEAM_SUB_DOMAIN_C_KEY = a149.ROW_KEY)
union
select 'ldb."D_WORK_ITEM_SYSTEM_TYPE_C" a150 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WORK_ITEM_SYSTEM_TYPE_C" a150
on (a16.WORK_ITEM_SYSTEM_TYPE_C_KEY = a150.ROW_KEY)
union
select 'ldb."d_work_item_type" a151 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_type" a151
on (a16.WORK_ITEM_TYPE_SRC_KEY = a151.ROW_KEY)
union
select 'ldb."d_work_item_updated_by" a152 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."d_work_item_updated_by" a152
on (a16.WORK_ITEM_UPDATED_BY_KEY = a152.ROW_KEY)
union
select 'ldb."D_WI_PRODT_TEAM_SDLC_CONF_PHASE_C" a153 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_WORK_ITEM" a11
join "ldb"."D_WORK_ITEM" a16
on (a11.WORK_ITEM_KEY = a16.ROW_KEY)
join "ldb"."D_WI_PRODT_TEAM_SDLC_CONF_PHASE_C" a153
on (a16.WI_PRODT_TEAM_SDLC_CONF_PHASE_C_KEY = a153.ROW_KEY)