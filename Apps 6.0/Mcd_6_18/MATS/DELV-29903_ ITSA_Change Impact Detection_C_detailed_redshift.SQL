
/* Tables Accessed:
D_CALENDAR_WEEK
D_CHANGE_BUSINESS_SERVICE
D_CHANGE_CONFIGURATION_ITEM
D_INCIDENT_BUSINESS_SERVICE
D_INCIDENT_CONFIGURATION_ITEM_MDM
d_ag_manager_level_1
d_ag_manager_level_2
d_ag_manager_level_3
d_ag_manager_level_4
d_ag_manager_level_5
d_assignment_group_manager
d_calendar_date
d_calendar_month
d_change_configuration_item_mdm
d_change_incident_linkage
d_change_request
d_change_request_assignment_group
d_chg2inc_days_difference
d_chg2inc_keywords_count
d_chg2inc_pair_possibility
d_configuration_item_incident
d_h_ag_manager
d_incident
d_incident_assignment_group
d_incident_priority
d_internal_organization_group
f_change_incident_linkage */


select 'ldb."f_change_incident_linkage" "a11" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
union
select 'ldb."d_change_incident_linkage" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")  
union
select 'ldb."d_internal_organization_group" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
union 
select 'ldb."d_incident" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
UNION 
select 'ldb."d_incident_priority" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
join "ldb"."d_incident_priority" "a122" ON ("a16"."priority_src_key" = "a122"."row_key")
UNION 
select 'ldb."d_incident_assignment_group" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
join "ldb"."d_incident_assignment_group"	"a119" on 	("a16"."assignment_group_key" = "a119"."row_key")
UNION 
select 'ldb."d_assignment_group_manager" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
UNION 
select 'ldb."d_h_ag_manager" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
join	"ldb"."d_h_ag_manager"	"a110" on 	("a19"."assignment_group_manager_hierarchy_key" = "a110"."row_key")
UNION 
select 'ldb."d_ag_manager_level_1" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
join	"ldb"."d_h_ag_manager"	"a110" on 	("a19"."assignment_group_manager_hierarchy_key" = "a110"."row_key")
join	"ldb"."d_ag_manager_level_1"	"a123" on 	("a110"."assignment_group_manager_level_1_key" = "a123"."row_key")
UNION 
select 'ldb."d_ag_manager_level_2" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
join	"ldb"."d_h_ag_manager"	"a110" on 	("a19"."assignment_group_manager_hierarchy_key" = "a110"."row_key")
join	"ldb"."d_ag_manager_level_2"	"a124" on 	("a110"."assignment_group_manager_level_2_key" = "a124"."row_key")
UNION 
select 'ldb."d_ag_manager_level_3" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
join	"ldb"."d_h_ag_manager"	"a110" on 	("a19"."assignment_group_manager_hierarchy_key" = "a110"."row_key")
join	"ldb"."d_ag_manager_level_3"	"a125"  on 	("a110"."assignment_group_manager_level_3_key" = "a125"."row_key")
UNION 
select 'ldb."d_ag_manager_level_4" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
join	"ldb"."d_h_ag_manager"	"a110" on 	("a19"."assignment_group_manager_hierarchy_key" = "a110"."row_key")
join	"ldb"."d_ag_manager_level_4"	"a126" on 	("a110"."assignment_group_manager_level_4_key" = "a126"."row_key")
UNION 
select 'ldb."d_ag_manager_level_5" "a18" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_internal_organization_group" "a18" on ("a11"."assignment_group_key" = "a18"."row_key")
join	"ldb"."d_assignment_group_manager"	"a19" on 	("a18"."assignment_group_manager_key" = "a19"."row_key")
join	"ldb"."d_h_ag_manager"	"a110" on 	("a19"."assignment_group_manager_hierarchy_key" = "a110"."row_key")
join	"ldb"."d_ag_manager_level_5"	"a127" on 	("a110"."assignment_group_manager_level_5_key" = "a127"."row_key")
UNION 
select 'ldb."d_configuration_item_incident" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
join "ldb"."d_configuration_item_incident"	"a17" on 	("a16"."configuration_item_key" = "a17"."row_key")
UNION 
select 'ldb."d_change_request" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join "ldb"."d_change_request"	"a14" on 	("a12"."change_request_key" = "a14"."row_key")
UNION 
select 'ldb."d_change_request_assignment_group" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join "ldb"."d_change_request"	"a14" on 	("a12"."change_request_key" = "a14"."row_key")
join "ldb"."d_change_request_assignment_group"	"a116" on 	("a14"."assignment_group_key" = "a116"."row_key")
UNION 
select 'ldb."d_chg2inc_days_difference" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join	"ldb"."d_chg2inc_days_difference"	"a114" on 	("a12"."time_difference_bucket_key" = "a114"."row_key")

UNION 
select 'ldb."d_chg2inc_keywords_count" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join "ldb"."d_chg2inc_keywords_count"	"a111" on 	("a12"."common_keywords_bucket_key" = "a111"."row_key")
UNION 
select 'ldb."d_chg2inc_pair_possibility" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join	"ldb"."d_chg2inc_pair_possibility"	"a112" on 	("a12"."pair_possibility_bucket_key" = "a112"."row_key")
UNION 
select 'ldb."D_CHANGE_CONFIGURATION_ITEM" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join "ldb"."d_change_request"	"a14" on 	("a12"."change_request_key" = "a14"."row_key")
join	"ldb"."D_CHANGE_CONFIGURATION_ITEM"	"a15" on 	("a14"."configuration_item_key" = "a15"."row_key")
UNION 
select 'ldb."d_change_configuration_item_mdm" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join "ldb"."d_change_request"	"a14" on 	("a12"."change_request_key" = "a14"."row_key")
join	"ldb"."D_CHANGE_CONFIGURATION_ITEM"	"a15" on 	("a14"."configuration_item_key" = "a15"."row_key")
join	"ldb"."d_change_configuration_item_mdm"	"a118" on 	("a15"."MDM_KEY" = "a118"."row_key")
union
select 'ldb."d_calendar_date" "a13" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_calendar_date" "a13" on ("a11"."date_key" = "a13"."row_key")  
UNION 
select 'ldb."d_calendar_month" "a13" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_calendar_date" "a13" on ("a11"."date_key" = "a13"."row_key") 
join "ldb"."d_calendar_month" "a115" on ("a13"."month_start_date_key" = "a115"."row_key")
UNION 
select 'ldb."d_configuration_item_incident" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
join "ldb"."d_configuration_item_incident"	"a17" on 	("a16"."configuration_item_key" = "a17"."row_key")
UNION 
select 'ldb."D_INCIDENT_CONFIGURATION_ITEM_MDM" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
join "ldb"."d_configuration_item_incident"	"a17" on 	("a16"."configuration_item_key" = "a17"."row_key")
join	"ldb"."D_INCIDENT_CONFIGURATION_ITEM_MDM"	"a121" on 	("a17"."MDM_KEY" = "a121"."row_key")
UNION 
select 'ldb."D_CALENDAR_WEEK" "a13" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_calendar_date" "a13" on ("a11"."date_key" = "a13"."row_key")
join	"ldb"."D_CALENDAR_WEEK"	"a113" on 	("a13"."week_start_date_key" = "a113"."row_key")
UNION 
select 'ldb."D_CHANGE_BUSINESS_SERVICE" "a12" ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key")
join "ldb"."d_change_request"	"a14" on 	("a12"."change_request_key" = "a14"."row_key")
join	"ldb"."D_CHANGE_BUSINESS_SERVICE"	"a117" on 	("a14"."business_service_key" = "a117"."row_key")
UNION 
select 'ldb."D_INCIDENT_BUSINESS_SERVICE" "a12" ' as Table_name, count(a11.row_key) Row_Count
from "ldb"."f_change_incident_linkage" "a11" 
join "ldb"."d_change_incident_linkage" "a12" on ("a11"."chg2inc_key" = "a12"."row_key") 
join "ldb"."d_incident" "a16" on ("a12"."incident_key" = "a16"."row_key")
join "ldb"."D_INCIDENT_BUSINESS_SERVICE"	"a120" on 	("a16"."business_service_key" = "a120"."row_key")