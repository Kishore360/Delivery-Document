/* 
Tables Accessed:
D_GBL_PROBLEM_DIRECTOR_NAME_C
D_GBL_PROBLEM_SR_DIRECTOR_NAME_C
D_GBL_PROBLEM_SR_VICE_PRESIDENT_NAME_C
D_GBL_PROBLEM_VICE_PRESIDENT_NAME_C
D_INTERNAL_CONTACT_PROBLEM_MANAGER_C
D_INTERNAL_CONTACT_PROBLEM_SERVICE_OWNED_BY_C
D_LOV_PROBLEM_RCA_STATUS_C
D_LOV_PROBLEM_SERVICE_CATEGORY_C
D_PROBLEM
D_PROBLEM_BUSINESSUNIT_CUSTOM_C
D_PROBLEM_BUSINESS_SERVICE
D_PROBLEM_CATEGORY_C
D_PROBLEM_GBL_C
D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO
D_PROBLEM_SCAFE_CORE_REALM_C
D_PROBLEM_SUB_CATEGORY_C
F_PROBLEM_CLOSED
d_h_problem_assignment_group
d_problem_application
d_problem_application_mdm
d_problem_assigned_to_location
d_problem_assignment_group
d_problem_assignment_group_level_1
d_problem_assignment_group_level_2
d_problem_assignment_group_level_3
d_problem_assignment_group_level_4
d_problem_assignment_group_manager
d_problem_business_service_criticality
d_problem_business_service_used_for
d_problem_calendar_hour
d_problem_calendar_month
d_problem_calendar_quarter
d_problem_calendar_week
d_problem_calendar_year
d_problem_change
d_problem_configuration_item
d_problem_configuration_item_mdm
d_problem_date
d_problem_department
d_problem_employee
d_problem_employee_mdm
d_problem_impact
d_problem_location
d_problem_priority
d_problem_reported_type
d_problem_state
d_problem_time
d_problem_urgency */

select 'ldb."F_PROBLEM_CLOSED" "a11" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
 union
select 'ldb."d_problem_time" "a12" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_time" "a12" 
	on ("a11"."PROBLEM_TIME_KEY" = "a12"."row_key")  
 union
select 'ldb."d_problem_employee" "a13" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_employee" "a13" 
	on ("a11"."PROBLEM_EMPLOYEE_KEY" = "a13"."row_key")  
 union
select 'ldb."D_PROBLEM" "a14" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")  
 union
select 'ldb."d_problem_application" "a15" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_application" "a15" 
	on ("a14"."application_key" = "a15"."row_key")  
 union
select 'ldb."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")  
 union
select 'ldb."d_problem_assignment_group" "a17" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")  
 union
select 'ldb."d_h_problem_assignment_group" "a18" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")
	join "ldb"."d_h_problem_assignment_group" "a18" 
	on ("a17"."group_hierarchy_key" = "a18"."row_key")  
 union
select 'ldb."D_PROBLEM_BUSINESS_SERVICE" "a19" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_BUSINESS_SERVICE" "a19" 
	on ("a14"."business_service_key" = "a19"."row_key")  
 union
select 'ldb."d_problem_date" "a110" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_date" "a110" 
	on ("a11"."PROBLEM_DATE_KEY" = "a110"."row_key")  
 union
select 'ldb."d_problem_calendar_month" "a111" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."d_problem_date" "a110" 
	on ("a11"."PROBLEM_DATE_KEY" = "a110"."row_key") 
	join "ldb"."d_problem_calendar_month" "a111" 
	on ("a110"."month_start_date_key" = "a111"."row_key")  
 union
select 'ldb."d_problem_calendar_quarter" "a112" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."d_problem_date" "a110" 
	on ("a11"."PROBLEM_DATE_KEY" = "a110"."row_key") 
	join "ldb"."d_problem_calendar_month" "a111" 
	on ("a110"."month_start_date_key" = "a111"."row_key")
	join "ldb"."d_problem_calendar_quarter" "a112" 
	on ("a111"."quarter_start_date_key" = "a112"."row_key")  
 union
select 'ldb."d_problem_configuration_item" "a113" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_configuration_item" "a113" 
	on ("a14"."configuration_item_key" = "a113"."row_key")  
 union
select 'ldb."d_problem_configuration_item_mdm" "a114" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_configuration_item" "a113" 
	on ("a14"."configuration_item_key" = "a113"."row_key")
	join "ldb"."d_problem_configuration_item_mdm" "a114" 
	on ("a113"."MDM_KEY" = "a114"."row_key")  
 union
select 'ldb."D_PROBLEM_GBL_C" "a115" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")
	join "ldb"."D_PROBLEM_GBL_C" "a115" 
	on ("a16"."PROBLEM_GBL_C_KEY" = "a115"."row_key")  
 union
select 'ldb."d_problem_state" "a116" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_state" "a116" 
	on ("a14"."state_src_key" = "a116"."row_key")  
 union
select 'ldb."d_problem_calendar_hour" "a117" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
	join "ldb"."d_problem_time" "a12" 
	on ("a11"."PROBLEM_TIME_KEY" = "a12"."row_key")
	join "ldb"."d_problem_calendar_hour" "a117" 
	on ("a12"."hour_key" = "a117"."row_key")  
 union
select 'ldb."d_problem_reported_type" "a118" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_reported_type" "a118" 
	on ("a11"."reported_type_src_key" = "a118"."row_key")  
 union
select 'ldb."d_problem_department" "a119" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_employee" "a13" 
	on ("a11"."PROBLEM_EMPLOYEE_KEY" = "a13"."row_key")
	join "ldb"."d_problem_department" "a119" 
	on ("a13"."department_key" = "a119"."row_key")  
 union
select 'ldb."d_problem_employee_mdm" "a120" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_employee" "a13" 
	on ("a11"."PROBLEM_EMPLOYEE_KEY" = "a13"."row_key")
	join "ldb"."d_problem_employee_mdm" "a120" 
	on ("a13"."employee_mdm_key" = "a120"."row_key")  
 union
select 'ldb."d_problem_impact" "a121" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_impact" "a121" 
	on ("a11"."impact_src_key" = "a121"."row_key")  
 union
select 'ldb."d_problem_priority" "a122" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_priority" "a122" 
	on ("a11"."priority_src_key" = "a122"."row_key")  
 union
select 'ldb."d_problem_urgency" "a123" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 

	join "ldb"."d_problem_urgency" "a123" 
	on ("a11"."urgency_src_key" = "a123"."row_key")  
 union
select 'ldb."D_PROBLEM_CATEGORY_C" "a124" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_CATEGORY_C" "a124" 
	on ("a14"."PROBLEM_CATEGORY_C_KEY" = "a124"."row_key")  
 union
select 'ldb."d_problem_application_mdm" "a125" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_application" "a15" 
	on ("a14"."application_key" = "a15"."row_key") 
	join "ldb"."d_problem_application_mdm" "a125" 
	on ("a15"."MDM_KEY" = "a125"."row_key")  
 union
select 'ldb."D_PROBLEM_BUSINESSUNIT_CUSTOM_C" "a126" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_BUSINESSUNIT_CUSTOM_C" "a126" 
	on ("a14"."PROBLEM_BUSINESSUNIT_CUSTOM_C_KEY" = "a126"."row_key")  
 union
select 'ldb."d_problem_calendar_week" "a127" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."d_problem_date" "a110" 
	on ("a11"."PROBLEM_DATE_KEY" = "a110"."row_key") 
	join "ldb"."d_problem_calendar_week" "a127" 
	on ("a110"."week_start_date_key" = "a127"."row_key")  
 union
select 'ldb."d_problem_change" "a128" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_change" "a128" 
	on ("a14"."CHANGE_KEY" = "a128"."row_key")  
 union
select 'ldb."d_problem_location" "a129" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_location" "a129" 
	on ("a14"."location_key" = "a129"."row_key")  
 union
select 'ldb."D_INTERNAL_CONTACT_PROBLEM_MANAGER_C" "a130" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_INTERNAL_CONTACT_PROBLEM_MANAGER_C" "a130" 
	on ("a14"."PROBLEM_MANAGER_C_KEY" = "a130"."row_key")  
 union
select 'ldb."D_LOV_PROBLEM_RCA_STATUS_C" "a131" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_LOV_PROBLEM_RCA_STATUS_C" "a131" 
	on ("a14"."PROBLEM_RCA_STATUS_SRC_C_KEY" = "a131"."row_key")  
 union
select 'ldb."D_PROBLEM_SCAFE_CORE_REALM_C" "a132" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_SCAFE_CORE_REALM_C" "a132" 
	on ("a14"."PROBLEM_SCAFE_CORE_REALM_C_KEY" = "a132"."row_key")  
 union
select 'ldb."D_LOV_PROBLEM_SERVICE_CATEGORY_C" "a133" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_LOV_PROBLEM_SERVICE_CATEGORY_C" "a133" 
	on ("a14"."PROBLEM_SERVICE_CATEGORY_SRC_C_KEY" = "a133"."row_key")  
 union
select 'ldb."D_PROBLEM_SUB_CATEGORY_C" "a134" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_SUB_CATEGORY_C" "a134" 
	on ("a14"."PROBLEM_SUBCATEGORY_SRC_C_KEY" = "a134"."row_key")  
 union
select 'ldb."d_problem_assigned_to_location" "a135" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")
	join "ldb"."d_problem_assigned_to_location" "a135" 
	on ("a16"."location_key" = "a135"."row_key")  
 union
select 'ldb."d_problem_assignment_group_level_1" "a136" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")
	join "ldb"."d_h_problem_assignment_group" "a18" 
	on ("a17"."group_hierarchy_key" = "a18"."row_key")
	join "ldb"."d_problem_assignment_group_level_1" "a136" 
	on ("a18"."group_level_1_key" = "a136"."row_key")  
 union
select 'ldb."d_problem_assignment_group_level_2" "a137" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")
	join "ldb"."d_h_problem_assignment_group" "a18" 
	on ("a17"."group_hierarchy_key" = "a18"."row_key")
	join "ldb"."d_problem_assignment_group_level_2" "a137" 
	on ("a18"."group_level_2_key" = "a137"."row_key")  
 union
select 'ldb."d_problem_assignment_group_level_3" "a138" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")
	join "ldb"."d_h_problem_assignment_group" "a18" 
	on ("a17"."group_hierarchy_key" = "a18"."row_key")
	join "ldb"."d_problem_assignment_group_level_3" "a138" 
	on ("a18"."group_level_3_key" = "a138"."row_key")  
 union
select 'ldb."d_problem_assignment_group_level_4" "a139" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")
	join "ldb"."d_h_problem_assignment_group" "a18" 
	on ("a17"."group_hierarchy_key" = "a18"."row_key")
	join "ldb"."d_problem_assignment_group_level_4" "a139" 
	on ("a18"."group_level_4_key" = "a139"."row_key")  
 union
select 'ldb."d_problem_assignment_group_manager" "a140" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."d_problem_assignment_group" "a17" 
	on ("a14"."assignment_group_key" = "a17"."row_key")
	join "ldb"."d_problem_assignment_group_manager" "a140" 
	on ("a17"."manager_key" = "a140"."row_key")  
 union
select 'ldb."d_problem_business_service_criticality" "a141" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_BUSINESS_SERVICE" "a19" 
	on ("a14"."business_service_key" = "a19"."row_key")
	join "ldb"."d_problem_business_service_criticality" "a141" 
	on ("a19"."CRITICALITY_KEY" = "a141"."row_key")  
 union
select 'ldb."D_INTERNAL_CONTACT_PROBLEM_SERVICE_OWNED_BY_C" "a142" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_BUSINESS_SERVICE" "a19" 
	on ("a14"."business_service_key" = "a19"."row_key")
	join "ldb"."D_INTERNAL_CONTACT_PROBLEM_SERVICE_OWNED_BY_C" "a142" 
	on ("a19"."PROBLEM_SERVICE_OWNED_BY_C_KEY" = "a142"."row_key")  
 union
select 'ldb."d_problem_business_service_used_for" "a143" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key")
	join "ldb"."D_PROBLEM_BUSINESS_SERVICE" "a19" 
	on ("a14"."business_service_key" = "a19"."row_key")
	join "ldb"."d_problem_business_service_used_for" "a143" 
	on ("a19"."USED_FOR_SRC_KEY" = "a143"."row_key")  
 union
select 'ldb."d_problem_calendar_year" "a144" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
join "ldb"."d_problem_date" "a110" 
	on ("a11"."PROBLEM_DATE_KEY" = "a110"."row_key") 
	join "ldb"."d_problem_calendar_month" "a111" 
	on ("a110"."month_start_date_key" = "a111"."row_key")
	join "ldb"."d_problem_calendar_quarter" "a112" 
	on ("a111"."quarter_start_date_key" = "a112"."row_key")
	join "ldb"."d_problem_calendar_year" "a144" 
	on ("a112"."year_start_date_key" = "a144"."row_key")  
 union
select 'ldb."D_GBL_PROBLEM_DIRECTOR_NAME_C" "a145" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
 join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key") 
 join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")
join "ldb"."D_PROBLEM_GBL_C" "a115" 
	on ("a16"."PROBLEM_GBL_C_KEY" = "a115"."row_key")
	join "ldb"."D_GBL_PROBLEM_DIRECTOR_NAME_C" "a145" 
	on ("a115"."PROBLEM_DIRECTOR_NAME_C_KEY" = "a145"."row_key")  
 union
select 'ldb."D_GBL_PROBLEM_SR_VICE_PRESIDENT_NAME_C" "a146" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
 join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key") 
 join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")
join "ldb"."D_PROBLEM_GBL_C" "a115" 
	on ("a16"."PROBLEM_GBL_C_KEY" = "a115"."row_key")
	join "ldb"."D_GBL_PROBLEM_SR_VICE_PRESIDENT_NAME_C" "a146" 
	on ("a115"."PROBLEM_SR_VICE_PRESIDENT_NAME_C_KEY" = "a146"."row_key")  
 union
select 'ldb."D_GBL_PROBLEM_SR_DIRECTOR_NAME_C" "a147" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
 join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key") 
 join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")
join "ldb"."D_PROBLEM_GBL_C" "a115" 
	on ("a16"."PROBLEM_GBL_C_KEY" = "a115"."row_key")
	join "ldb"."D_GBL_PROBLEM_SR_DIRECTOR_NAME_C" "a147" 
	on ("a115"."PROBLEM_SR_DIRECTOR_NAME_C_KEY" = "a147"."row_key")  
 union
select 'ldb."D_GBL_PROBLEM_VICE_PRESIDENT_NAME_C" "a148" ' as Table_name, count(a11.row_key) Row_Count
 from ldb."F_PROBLEM_CLOSED" "a11" 
 join "ldb"."D_PROBLEM" "a14" 
	on ("a11"."problem_key" = "a14"."row_key") 
 join "ldb"."D_PROBLEM_INTERNAL_CONTACT_ASSIGNED_TO" "a16" 
	on ("a14"."assigned_to_key" = "a16"."row_key")
join "ldb"."D_PROBLEM_GBL_C" "a115" 
	on ("a16"."PROBLEM_GBL_C_KEY" = "a115"."row_key")
	join "ldb"."D_GBL_PROBLEM_VICE_PRESIDENT_NAME_C" "a148" 
	on ("a115"."PROBLEM_VICE_PRESIDENT_NAME_C_KEY" = "a148"."row_key") 

