/* Tables Accessed:
D_CHANGE_BUSINESS_SERVICE
D_CHANGE_CONFIGURATION_ITEM
D_CHANGE_GBL_C
D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO
D_CHANGE_REQUEST_CMDB_LOCATION_C
D_CHANGE_REQUEST_DATA_CENTER_C
D_CHANGE_REQUEST_STANDARD_CHANGE_C
D_CHANGE_REQUEST_THIRD_PARTY_C
D_CHANGE_SCAFE_CORE_REALM_C
D_GBL_CHANGE_DIRECTOR_NAME_C
D_GBL_CHANGE_SR_DIRECTOR_NAME_C
D_GBL_CHANGE_SR_VICE_PRESIDENT_NAME_C
D_GBL_CHANGE_VICE_PRESIDENT_NAME_C
D_INTERNAL_CONTACT_CHANGE_APPROVER_C
D_INTERNAL_CONTACT_CHANGE_SERVICE_OWNED_BY_C
D_INTERNAL_ORGANIZATION_CHANGE_VENDOR_C
D_LOV_CHANGE_REQUEST_AFFECTED_ENVIRONMENT_C
D_LOV_CHANGE_REQUEST_CLOSURE_CODE_C
D_LOV_CHANGE_REQUEST_DATABASE_TYPE_C
F_CHANGE_REQUEST
d_calendar_date
d_change_application
d_change_application_mdm
d_change_assignment_group_level_1
d_change_assignment_group_level_2
d_change_assignment_group_manager
d_change_business_service_criticality
d_change_business_service_used_for
d_change_calendar_month
d_change_calendar_quarter
d_change_calendar_week
d_change_calendar_year
d_change_configuration_item_mdm
d_change_date
d_change_department
d_change_domain
d_change_employee
d_change_employee_mdm
d_change_location
d_change_request
d_change_request_approval
d_change_request_assignment_group
d_change_request_category
d_change_request_impact
d_change_request_priority
d_change_request_reason
d_change_request_reported_type
d_change_request_review_status
d_change_request_risk
d_change_request_scope
d_change_request_state
d_change_request_type
d_change_request_urgency
d_h_change_assignment_group
o_data_freshness
 */
 
 select 'ldb."F_CHANGE_REQUEST" "a11" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
 union
select 'ldb."d_change_employee" "a12" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_employee" "a12" 
	on ("a11"."CHANGE_EMPLOYEE_KEY" = "a12"."row_key")  
 union
select 'ldb."d_change_request" "a13" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")  
 union
select 'ldb."d_change_application" "a14" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key") 
	join "ldb"."d_change_application" "a14" 
	on ("a13"."application_key" = "a14"."row_key")  
 union
select 'ldb."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" 
	on ("a13"."assigned_to_key" = "a15"."row_key")  
 union
select 'ldb."d_change_request_assignment_group" "a16" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_request_assignment_group" "a16" 
	on ("a13"."assignment_group_key" = "a16"."row_key")  
 union
select 'ldb."d_h_change_assignment_group" "a17" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_request_assignment_group" "a16" 
	on ("a13"."assignment_group_key" = "a16"."row_key")
	join "ldb"."d_h_change_assignment_group" "a17" 
	on ("a16"."group_hierarchy_key" = "a17"."row_key")  
 union
select 'ldb."D_CHANGE_BUSINESS_SERVICE" "a18" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_BUSINESS_SERVICE" "a18" 
	on ("a13"."business_service_key" = "a18"."row_key")  
 union
select 'ldb."d_change_date" "a19" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_date" "a19" 
	on ("a11"."change_date_key" = "a19"."row_key")  
 union
select 'ldb."d_change_calendar_month" "a110" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_date" "a19" 
	on ("a11"."change_date_key" = "a19"."row_key") 
	join "ldb"."d_change_calendar_month" "a110" 
	on ("a19"."month_start_date_key" = "a110"."row_key")  
 union
select 'ldb."d_change_calendar_quarter" "a111" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_date" "a19" 
	on ("a11"."change_date_key" = "a19"."row_key") 
	join "ldb"."d_change_calendar_month" "a110" 
	on ("a19"."month_start_date_key" = "a110"."row_key")
	join "ldb"."d_change_calendar_quarter" "a111" 
	on ("a110"."quarter_start_date_key" = "a111"."row_key")  
 union
select 'ldb."D_CHANGE_CONFIGURATION_ITEM" "a112" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_CONFIGURATION_ITEM" "a112" 
	on ("a13"."configuration_item_key" = "a112"."row_key")  
 union
select 'ldb."d_change_configuration_item_mdm" "a113" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_CONFIGURATION_ITEM" "a112" 
	on ("a13"."configuration_item_key" = "a112"."row_key") 
	join "ldb"."d_change_configuration_item_mdm" "a113" 
	on ("a112"."MDM_KEY" = "a113"."row_key")  
 union
select 'ldb."D_CHANGE_GBL_C" "a114" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" 
	on ("a13"."assigned_to_key" = "a15"."row_key")
	join "ldb"."D_CHANGE_GBL_C" "a114" 
	on ("a15"."CHANGE_GBL_C_KEY" = "a114"."row_key")  
 union
select 'ldb."d_change_request_risk" "a115" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_risk" "a115" 
	on ("a11"."risk_src_key" = "a115"."row_key")  
 union
select 'ldb."d_change_request_state" "a116" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_state" "a116" 
	on ("a11"."state_src_key" = "a116"."row_key")  
 union
select 'ldb."d_calendar_date" "a117" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_calendar_date" "a117" 
	on ("a11"."date_key" = "a117"."row_key")  
 union
select 'ldb."d_change_request_category" "a118" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_category" "a118" 
	on ("a11"."category_src_key" = "a118"."row_key")  
 union
select 'ldb."d_change_request_reported_type" "a119" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_reported_type" "a119" 
	on ("a11"."reported_type_src_key" = "a119"."row_key")  
 union
select 'ldb."d_change_employee_mdm" "a120" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_employee" "a12" 
	on ("a11"."CHANGE_EMPLOYEE_KEY" = "a12"."row_key")
	join "ldb"."d_change_employee_mdm" "a120" 
	on ("a12"."employee_mdm_key" = "a120"."row_key")  
 union
select 'ldb."d_change_request_impact" "a121" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_impact" "a121" 
	on ("a11"."impact_src_key" = "a121"."row_key")  
 union
select 'ldb."d_change_request_priority" "a122" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_priority" "a122" 
	on ("a11"."priority_src_key" = "a122"."row_key")  
 union
select 'ldb."d_change_request_reason" "a123" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_reason" "a123" 
	on ("a11"."reason_src_key" = "a123"."row_key")  
 union
select 'ldb."d_change_request_review_status" "a124" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_review_status" "a124" 
	on ("a11"."review_status_src_key" = "a124"."row_key")  
 union
select 'ldb."d_change_request_scope" "a125" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_scope" "a125" 
	on ("a11"."scope_src_key" = "a125"."row_key")  
 union
select 'ldb."d_change_request_urgency" "a126" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_urgency" "a126" 
	on ("a11"."urgency_src_key" = "a126"."row_key")  
 union
select 'ldb."o_data_freshness" "a127" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."o_data_freshness" "a127" 
	on ("a11"."source_id" = "a127"."source_id")  
 union
select 'ldb."D_LOV_CHANGE_REQUEST_AFFECTED_ENVIRONMENT_C" "a128" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_LOV_CHANGE_REQUEST_AFFECTED_ENVIRONMENT_C" "a128" 
	on ("a13"."CHANGE_AFFECTED_ENVIRONMENT_SRC_C_KEY" = "a128"."row_key")  
 union
select 'ldb."d_change_application_mdm" "a129" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key") 
	join "ldb"."d_change_application" "a14" 
	on ("a13"."application_key" = "a14"."row_key")
	join "ldb"."d_change_application_mdm" "a129" 
	on ("a14"."MDM_KEY" = "a129"."row_key")  
 union
select 'ldb."d_change_request_approval" "a130" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_approval" "a130" 
	on ("a11"."approval_state_src_key" = "a130"."row_key")  
 union
select 'ldb."D_INTERNAL_CONTACT_CHANGE_APPROVER_C" "a131" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_INTERNAL_CONTACT_CHANGE_APPROVER_C" "a131" 
	on ("a13"."CHANGE_APPROVER_C_KEY" = "a131"."row_key")  
 union
select 'ldb."d_change_calendar_week" "a132" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_date" "a19" 
	on ("a11"."change_date_key" = "a19"."row_key") 
	join "ldb"."d_change_calendar_week" "a132" 
	on ("a19"."week_start_date_key" = "a132"."row_key")  
 union
select 'ldb."D_LOV_CHANGE_REQUEST_CLOSURE_CODE_C" "a133" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_LOV_CHANGE_REQUEST_CLOSURE_CODE_C" "a133" 
	on ("a13"."CHANGE_CLOSURE_CODE_SRC_C_KEY" = "a133"."row_key")  
 union
select 'ldb."D_CHANGE_REQUEST_DATA_CENTER_C" "a134" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_REQUEST_DATA_CENTER_C" "a134" 
	on ("a13"."CHANGE_DATA_CENTER_C_KEY" = "a134"."row_key")  
 union
select 'ldb."D_LOV_CHANGE_REQUEST_DATABASE_TYPE_C" "a135" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_LOV_CHANGE_REQUEST_DATABASE_TYPE_C" "a135" 
	on ("a13"."CHANGE_DATABASE_TYPE_SRC_C_KEY" = "a135"."row_key")  
 union
select 'ldb."d_change_department" "a136" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_department" "a136" 
	on ("a11"."CHANGE_DEPARTMENT_KEY" = "a136"."row_key")  
 union
select 'ldb."d_change_domain" "a137" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_domain" "a137" 
	on ("a13"."domain_key" = "a137"."row_key")  
 union
select 'ldb."d_change_location" "a138" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_location" "a138" 
	on ("a13"."location_key" = "a138"."row_key")  
 union
select 'ldb."D_CHANGE_SCAFE_CORE_REALM_C" "a139" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_SCAFE_CORE_REALM_C" "a139" 
	on ("a13"."CHANGE_SCAFE_CORE_REALM_C_KEY" = "a139"."row_key")  
 union
select 'ldb."d_change_request_type" "a140" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 

	join "ldb"."d_change_request_type" "a140" 
	on ("a11"."type_src_key" = "a140"."row_key")  
 union
select 'ldb."D_CHANGE_REQUEST_THIRD_PARTY_C" "a141" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_REQUEST_THIRD_PARTY_C" "a141" 
	on ("a13"."CHANGE_THIRD_PARTY_C_KEY" = "a141"."row_key")  
 union
select 'ldb."D_CHANGE_REQUEST_CMDB_LOCATION_C" "a142" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_CONFIGURATION_ITEM" "a112" 
	on ("a13"."configuration_item_key" = "a112"."row_key") 
	join "ldb"."D_CHANGE_REQUEST_CMDB_LOCATION_C" "a142" 
	on ("a112"."CHANGE_CMDB_LOCATION_C_KEY" = "a142"."row_key")  
 union
select 'ldb."D_CHANGE_REQUEST_STANDARD_CHANGE_C" "a143" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_REQUEST_STANDARD_CHANGE_C" "a143" 
	on ("a13"."STANDARD_CHANGE_C_KEY" = "a143"."row_key")  
 union
select 'ldb."d_change_assignment_group_level_1" "a144" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_request_assignment_group" "a16" 
	on ("a13"."assignment_group_key" = "a16"."row_key")
	join "ldb"."d_h_change_assignment_group" "a17" 
	on ("a16"."group_hierarchy_key" = "a17"."row_key")
	join "ldb"."d_change_assignment_group_level_1" "a144" 
	on ("a17"."group_level_1_key" = "a144"."row_key")  
 union
select 'ldb."d_change_assignment_group_level_2" "a145" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_request_assignment_group" "a16" 
	on ("a13"."assignment_group_key" = "a16"."row_key")
	join "ldb"."d_h_change_assignment_group" "a17" 
	on ("a16"."group_hierarchy_key" = "a17"."row_key")
	join "ldb"."d_change_assignment_group_level_2" "a145" 
	on ("a17"."group_level_2_key" = "a145"."row_key")  
 union
select 'ldb."d_change_assignment_group_manager" "a146" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_request_assignment_group" "a16" 
	on ("a13"."assignment_group_key" = "a16"."row_key")
	join "ldb"."d_change_assignment_group_manager" "a146" 
	on ("a16"."manager_key" = "a146"."row_key")  
 union
select 'ldb."D_INTERNAL_ORGANIZATION_CHANGE_VENDOR_C" "a147" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."d_change_request_assignment_group" "a16" 
	on ("a13"."assignment_group_key" = "a16"."row_key")
	join "ldb"."D_INTERNAL_ORGANIZATION_CHANGE_VENDOR_C" "a147" 
	on ("a16"."CHANGE_VENDOR_C_KEY" = "a147"."row_key")  
 union
select 'ldb."d_change_business_service_criticality" "a148" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_BUSINESS_SERVICE" "a18" 
	on ("a13"."business_service_key" = "a18"."row_key") 
	join "ldb"."d_change_business_service_criticality" "a148" 
	on ("a18"."CRITICALITY_KEY" = "a148"."row_key")  
 union
select 'ldb."D_INTERNAL_CONTACT_CHANGE_SERVICE_OWNED_BY_C" "a149" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_BUSINESS_SERVICE" "a18" 
	on ("a13"."business_service_key" = "a18"."row_key") 
	join "ldb"."D_INTERNAL_CONTACT_CHANGE_SERVICE_OWNED_BY_C" "a149" 
	on ("a18"."CHANGE_SERVICE_OWNED_BY_C_KEY" = "a149"."row_key")  
 union
select 'ldb."d_change_business_service_used_for" "a150" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join	"ldb"."d_change_request"	"a13"
	  on 	("a11"."change_request_key" = "a13"."row_key")
	join "ldb"."D_CHANGE_BUSINESS_SERVICE" "a18" 
	on ("a13"."business_service_key" = "a18"."row_key") 
	join "ldb"."d_change_business_service_used_for" "a150" 
	on ("a18"."USED_FOR_SRC_KEY" = "a150"."row_key")  
 union
select 'ldb."d_change_calendar_year" "a151" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_date" "a19" 
	on ("a11"."change_date_key" = "a19"."row_key") 
	join "ldb"."d_change_calendar_month" "a110" 
	on ("a19"."month_start_date_key" = "a110"."row_key")
	join "ldb"."d_change_calendar_quarter" "a111" 
	on ("a110"."quarter_start_date_key" = "a111"."row_key")
	join "ldb"."d_change_calendar_year" "a151" 
	on ("a111"."year_start_date_key" = "a151"."row_key")  
 union
select 'ldb."D_GBL_CHANGE_DIRECTOR_NAME_C" "a152" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key") 
	join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" 
	on ("a13"."assigned_to_key" = "a15"."row_key")
	join "ldb"."D_CHANGE_GBL_C" "a114" 
	on ("a15"."CHANGE_GBL_C_KEY" = "a114"."row_key")
	join "ldb"."D_GBL_CHANGE_DIRECTOR_NAME_C" "a152" 
	on ("a114"."CHANGE_DIRECTOR_NAME_C_KEY" = "a152"."row_key")  
 union
select 'ldb."D_GBL_CHANGE_SR_VICE_PRESIDENT_NAME_C" "a153" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key") 
	join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" 
	on ("a13"."assigned_to_key" = "a15"."row_key")
	join "ldb"."D_CHANGE_GBL_C" "a114" 
	on ("a15"."CHANGE_GBL_C_KEY" = "a114"."row_key")
	join "ldb"."D_GBL_CHANGE_SR_VICE_PRESIDENT_NAME_C" "a153" 
	on ("a114"."CHANGE_SR_VICE_PRESIDENT_NAME_C_KEY" = "a153"."row_key")  
 union
select 'ldb."D_GBL_CHANGE_SR_DIRECTOR_NAME_C" "a154" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key") 
	join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" 
	on ("a13"."assigned_to_key" = "a15"."row_key")
	join "ldb"."D_CHANGE_GBL_C" "a114" 
	on ("a15"."CHANGE_GBL_C_KEY" = "a114"."row_key")
	join "ldb"."D_GBL_CHANGE_SR_DIRECTOR_NAME_C" "a154" 
	on ("a114"."CHANGE_SR_DIRECTOR_NAME_C_KEY" = "a154"."row_key")  
 union
select 'ldb."D_GBL_CHANGE_VICE_PRESIDENT_NAME_C" "a155" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_CHANGE_REQUEST" "a11" 
join "ldb"."d_change_request" "a13" 
	on ("a11"."change_request_key" = "a13"."row_key") 
	join "ldb"."D_CHANGE_INTERNAL_CONTACT_ASSIGNED_TO" "a15" 
	on ("a13"."assigned_to_key" = "a15"."row_key")
	join "ldb"."D_CHANGE_GBL_C" "a114" 
	on ("a15"."CHANGE_GBL_C_KEY" = "a114"."row_key")
	join "ldb"."D_GBL_CHANGE_VICE_PRESIDENT_NAME_C" "a155" 
	on ("a114"."CHANGE_VICE_PRESIDENT_NAME_C_KEY" = "a155"."row_key") 

