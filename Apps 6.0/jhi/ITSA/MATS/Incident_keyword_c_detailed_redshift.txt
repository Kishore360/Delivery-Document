select 'ldb."f_incident_keyword" a12 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 union
select 'ldb."d_internal_contact_assigned_to" a13 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_internal_contact_assigned_to" a13 
 on (a12.ASSIGNED_TO_KEY = a13.ROW_KEY)  
 union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_internal_organization_group" a14 
 on (a12.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)  
 union
select 'ldb."d_calendar_date" a15 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_calendar_date" a15 
 on (a12.DATE_KEY = a15.ROW_KEY)  
 union
select 'ldb."d_calendar_month" a16 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."d_calendar_date" a15 
 on (a12.DATE_KEY = a15.ROW_KEY) 
join "ldb"."d_calendar_month" a16 
 on (a15.month_start_date_key = a16.ROW_KEY)  
 union
select 'ldb."d_calendar_quarter" a17 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."d_calendar_date" a15 
 on (a12.DATE_KEY = a15.ROW_KEY) join "ldb"."d_calendar_month" a16 
 on (a15.month_start_date_key = a16.ROW_KEY) 
join "ldb"."d_calendar_quarter" a17 
 on (a16.quarter_start_date_key = a17.ROW_KEY)  
 union
select 'ldb."d_configuration_item_mdm" a18 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_configuration_item_mdm" a18 
 on (a12.CONFIGURATION_ITEM_KEY = a18.ROW_KEY)  
   
 union
select 'ldb."D_INCIDENT" a110 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."D_INCIDENT" a110 
 on (a12.INCIDENT_KEY = a110.ROW_KEY)  
 union
select 'ldb."d_parent_incident" a111 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."D_INCIDENT" a110 
 on (a12.INCIDENT_KEY = a110.ROW_KEY) 
join "ldb"."d_parent_incident" a111 
 on (a110.PARENT_INCIDENT_KEY = a111.ROW_KEY)  
 union
select 'ldb."d_internal_organization_legalentity" a112 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_internal_organization_legalentity" a112 
 on (a12.COMPANY_KEY = a112.ROW_KEY)  
 union

select 'ldb."d_domain" a114 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_domain" a114 
 on (a12.DOMAIN_KEY = a114.ROW_KEY)  
  
 union
select 'ldb."d_incident_contacttype" a116 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_contacttype" a116 
 on (a12.incident_reported_type_src_key = a116.ROW_KEY)  
 union
select 'ldb."d_incident_impact" a117 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_impact" a117 
 on (a12.incident_impact_src_key = a117.ROW_KEY)  
 union
select 'ldb."d_incident_urgency" a118 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_urgency" a118 
 on (a12.incident_urgency_src_key = a118.ROW_KEY)  
 union
select 'ldb."d_location" a119 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_location" a119 
 on (a12.LOCATION_KEY = a119.ROW_KEY)  
 union
select 'ldb."d_calendar_week" a120 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."d_calendar_date" a15 
 on (a12.DATE_KEY = a15.ROW_KEY) 
join "ldb"."d_calendar_week" a120 
 on (a15.week_start_date_key = a120.ROW_KEY)  
 union
select 'ldb."d_ci_managed_by" a121 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."d_configuration_item_mdm" a18 
 on (a12.CONFIGURATION_ITEM_KEY = a18.ROW_KEY) 
join "ldb"."d_ci_managed_by" a121 
 on (a18.managed_by_key = a121.ROW_KEY)  
 union
select 'ldb."d_ci_supported_by" a122 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."d_configuration_item_mdm" a18 
 on (a12.CONFIGURATION_ITEM_KEY = a18.ROW_KEY) 
join "ldb"."d_ci_supported_by" a122 
 on (a18.supported_by_key = a122.ROW_KEY)  
 
 union
select 'ldb."d_incident_category" a124 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_category" a124 
 on (a12.incident_category_src_key = a124.ROW_KEY)  
 union
select 'ldb."d_incident_close_code" a125 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_close_code" a125 
 on (a12.CLOSE_CODE_SRC_KEY = a125.ROW_KEY)  
 union
select 'ldb."d_incident_priority" a126 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_priority" a126 
 on (a12.incident_priority_src_key = a126.ROW_KEY)  
 union
select 'ldb."d_incident_severity" a127 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_severity" a127 
 on (a12.incident_severity_src_key = a127.ROW_KEY)  
 union
select 'ldb."d_incident_state" a128 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_state" a128 
 on (a12.incident_state_src_key = a128.ROW_KEY)  
 union
select 'ldb."d_incident_subcategory" a129 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 

join "ldb"."d_incident_subcategory" a129 
 on (a12.incident_sub_category_src_key = a129.ROW_KEY)  
 union
select 'ldb."d_calendar_year" a130 ' as Table_name, count(1) Row_Count
 from ldb."f_incident_keyword" a12 
 join "ldb"."d_calendar_date" a15 
 on (a12.DATE_KEY = a15.ROW_KEY) join "ldb"."d_calendar_month" a16 
 on (a15.month_start_date_key = a16.ROW_KEY) join "ldb"."d_calendar_quarter" a17 
 on (a16.quarter_start_date_key = a17.ROW_KEY) 
join "ldb"."d_calendar_year" a130 
 on (a17.year_start_date_key = a130.ROW_KEY) 

