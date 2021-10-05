select 'ldb."F_INCIDENT_RESPONSE" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
UNION 
select 'ldb."d_incident" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join	"ldb"."d_incident"	"a14" on ("a11"."incident_key" = "a14"."row_key")
UNION 
select 'ldb."d_incident_priority" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_incident"	"a14" on ("a11"."incident_key" = "a14"."row_key")
join "ldb"."d_incident_priority"	"a120" on 	("a14"."priority_src_key" = "a120"."row_key")
UNION 
select 'ldb."D_INCIDENT_OPENED_BY" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_incident"	"a14" on ("a11"."incident_key" = "a14"."row_key")
join	"ldb"."D_INCIDENT_OPENED_BY"	"a119" on 	("a14"."opened_by_key" = "a119"."row_key")
UNION 
select 'ldb."d_incident" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join	"ldb"."D_LOV_CSAT_RANGE_BUCKET_C"	"a12" on 	("a11"."CSAT_RANGE_BUCKET_C_KEY" = "a12"."row_key")
UNION 
select 'ldb."d_survey" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join	"ldb"."d_survey"	"a14" on ("a11"."SURVEY_KEY" = "a14"."row_key")
UNION 
select 'ldb."d_survey_instance" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_instance"	"a18" on ("a11"."SURVEY_INSTANCE_KEY" = "a18"."row_key")
UNION 
select 'ldb."d_survey_question" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_question"	"a19"  on 	("a11"."QUESTION_KEY" = "a19"."row_key")
UNION 
select 'ldb."d_question_type" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_question"	"a19"  on 	("a11"."QUESTION_KEY" = "a19"."row_key")
join "ldb"."d_question_type"	"a122" on 	("a19"."question_type_src_key" = "a122"."row_key")

UNION 
select 'ldb."d_survey_calendar_date" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_calendar_date"	"a16" on ("a11"."SURVEY_DATE_KEY" = "a16"."row_key")
UNION 
select 'ldb."d_survey_calendar_month" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_calendar_date"	"a16" on ("a11"."SURVEY_DATE_KEY" = "a16"."row_key")
join "ldb"."d_survey_calendar_month"	"a19" on ("a16"."month_start_date_key" = "a19"."row_key")
UNION 
select 'ldb."d_survey_calendar_quarter" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_calendar_date"	"a16" on ("a11"."SURVEY_DATE_KEY" = "a16"."row_key")
join "ldb"."d_survey_calendar_month"	"a19" on ("a16"."month_start_date_key" = "a19"."row_key")
join "ldb"."d_survey_calendar_quarter"	"a17" on 	("a19"."quarter_start_date_key" = "a17"."row_key")
UNION 
select 'ldb."d_survey_calendar_week" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_calendar_date"	"a15" on ("a11"."SURVEY_DATE_KEY" = "a15"."row_key")
join "ldb"."d_survey_calendar_week"	"a121"  on 	("a15"."week_start_date_key" = "a121"."row_key")
UNION 
select 'ldb."d_survey_calendar_year" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_calendar_date"	"a16" on ("a11"."SURVEY_DATE_KEY" = "a16"."row_key")
join "ldb"."d_survey_calendar_month"	"a19" on ("a16"."month_start_date_key" = "a19"."row_key")
join "ldb"."d_survey_calendar_quarter"	"a17" on 	("a19"."quarter_start_date_key" = "a17"."row_key")
join "ldb"."d_survey_calendar_year"	"a124"  on 	("a17"."year_start_date_key" = "a124"."row_key")
UNION 
select 'ldb."d_survey_department" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_department" "a114" on ("a11"."SURVEY_DEPARTMENT_KEY" = "a114"."row_key")
UNION 
select 'ldb."d_survey_employee" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_employee"	"a13" on 	("a11"."SURVEY_EMPLOYEE_KEY" = "a13"."row_key")
UNION 
select 'ldb."d_survey_employee_mdm" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_employee"	"a13" on 	("a11"."SURVEY_EMPLOYEE_KEY" = "a13"."row_key")
join	"ldb"."d_survey_employee_mdm"	"a115" on 	("a13"."employee_mdm_key" = "a115"."row_key")
UNION 
select 'ldb."d_survey_state" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_survey_state"	"a116" on 	("a11"."state_src_key" = "a116"."row_key")
UNION 
select 'ldb."d_task" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
UNION 
select 'ldb."d_task_assigned_to" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join	"ldb"."d_task_assigned_to"	"a111" on 	("a14"."assigned_to_key" = "a111"."row_key")
UNION 
select 'ldb."d_task_internal_organization_group" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join "ldb"."d_task_internal_organization_group"	"a112" on 	("a14"."assignment_group_key" = "a112"."row_key")
UNION
select 'ldb."d_task_configuration_item" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join	"ldb"."d_task_configuration_item"	"a15" on 	("a14"."configuration_item_key" = "a15"."row_key")
UNION 
select 'ldb."d_task_business_service" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join "ldb"."d_task_business_service"	"a18" on 	("a14"."business_service_key" = "a18"."row_key")
UNION 
select 'ldb."d_task_configuration_item_mdm" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join	"ldb"."d_task_configuration_item"	"a15" on 	("a14"."configuration_item_key" = "a15"."row_key")
join	"ldb"."d_task_configuration_item_mdm"	"a117" on 	("a15"."MDM_KEY" = "a117"."row_key")
UNION 
select 'ldb."d_task_assignment_group_manager" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join "ldb"."d_task_internal_organization_group"	"a112" on 	("a14"."assignment_group_key" = "a112"."row_key")
join	"ldb"."d_task_assignment_group_manager"	"a123" on 	("a112"."manager_key" = "a123"."row_key")
UNION 
select 'ldb."d_task_location" "a11" ' as Table_name, count(1) Row_Count
from ldb."F_INCIDENT_RESPONSE" "a11" 
join "ldb"."d_task"	"a14" on 	("a11"."task_key" = "a14"."row_key")
join	"ldb"."d_task_location"	"a118" on 	("a14"."location_key" = "a118"."row_key")