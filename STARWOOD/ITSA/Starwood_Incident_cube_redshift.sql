SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (

select 'f_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11

union

select  'd_internal_organization_legalentity' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_internal_organization_legalentity                a12
   on         (a11.company_key = a12.row_key)

union


select  'd_customer' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_customer                 a13
   on         (a11.customer_key = a13.row_key)

union


select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_internal_contact                  a14
   on         (a11.opened_by_key = a14.row_key)

union


select  'd_calendar_time' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_calendar_time                  a15
   on         (a11.opened_time_key  = a15.row_key)

union


select  'd_location' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_location                   a12
   on         (a11.location_key  = a12.row_key)

union


select  'd_incident' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident                a12
   on         (a11.incident_key = a12.row_key)

union


select  'd_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_internal_organization_group                 a12
   on         (a11.assignment_group_key  = a12.row_key)

union


select  'd_configuration_item' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_configuration_item                 a12
   on         (a11.configuration_item_key  = a12.row_key)


union


select  'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_calendar_date                   a12
   on         (a11.opened_on_key  = a12.row_key)

union


select  'd_incident_variable_data_impacted_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident_variable_data_impacted_c              a12
   on         (a11.incident_key = a12.row_key)

union


select  'd_incident_variable_spg_hot_escapes_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident_variable_spg_hot_escapes_c                a12
   on         (a11.incident_key  = a12.row_key)

union


select  'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_internal_contact                a12
   on         (a11.assigned_to_key = a12.row_key)

union

select  'd_business_service_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_business_service_c              a12
   on         (a11.business_service_c_key = a12.row_key)

union


select  'd_customer_mdm ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
join ldb.d_customer                a13
                  on         (a11.customer_key = a13.row_key)
   join        ldb.d_customer_mdm                  a12
   on         (a13.row_current_key  = a12.row_current_key)

union


select  'd_internal_organization_department' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_internal_organization_department                a12
   on         (a11.opened_by_department_key  = a12.row_key)


union


select  'd_domain' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_domain                   a12
   on         (a11.domain_key  = a12.row_key)

union


select  'd_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
join ldb.d_internal_contact  a14
                  on         (a11.opened_by_key = a14.row_key)
   join        ldb.d_internal_contact_mdm              a12
   on         (a14.row_current_key = a12.row_current_key)

union


select  'd_hold_reason_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_hold_reason_c                 a12
   on         (a11.hold_reason_c_key = a12.row_key)

union

select  'd_calendar_time_hour  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
join ldb.d_calendar_time  a15
                  on         (a11.opened_time_key = a15.row_key)
   join        ldb.d_calendar_time_hour              a12
   on         (a15.hour_24_format_num = a12.hour_24_format_num)

Union

select  'd_incident_category' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join        ldb.d_incident_category                a12
   on         (a11.category_src_key = a12.row_key)
   
union

select  'd_incident_close_code ' as Table_Name,count(a11.row_key) Row_Count
from    ldb.f_incident    a11
   join             ldb.d_incident_close_code                 a12
   on         (a11.close_code_src_key = a12.row_key)
   
   union

select  'd_incident_severity  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join               ldb.d_incident_severity                  a12
   on         (a11.severity_src_key = a12.row_key)
   union

select  'd_incident_state ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join               ldb.d_incident_state                 a12
   on         (a11.state_src_key = a12.row_key)
   
   union

select  'd_incident_subcategory ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_incident_subcategory                 a12
   on         (a11.sub_category_src_key = a12.row_key)
   
   union

select  'd_knowledge_created_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_knowledge_created_c                 a12
   on         (a11.knowledge_created_c_key = a12.row_key)
   
   union

select  'd_incident_met_sla_c  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_incident_met_sla_c                  a12
   on         (a11.incident_met_sla_c_key = a12.row_key)
   
   union

select  'd_variable_lov_open_closed_c  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_variable_lov_open_closed_c                  a12
   on         (a11.open_closed_c_key = a12.row_key)
   
   union

select  'd_property_restricted_gp_c  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_property_restricted_gp_c                  a12
   on         (a11.property_restricted_gp_c_key = a12.row_key)
   
   union

select  'd_type_c  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_type_c                  a12
   on         (a11.type_c_key = a12.row_key)
   
   union

select  'd_variable_lov_status_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_variable_lov_status_c                 a12
   on         (a11.status_c_key = a12.row_key)
   
   union

select  'd_symptom_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_symptom_c                 a12
   on         (a11.symptom_c_key = a12.row_key)
   
   union

select  'd_task_impact ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_task_impact                 a12
   on         (a11.impact_src_key = a12.row_key)
   
   union

select  'd_task_priority ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_task_priority                 a12
   on         (a11.priority_src_key = a12.row_key)
   
   union

select  'd_task_contacttype  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_task_contacttype                  a12
   on         (a11.reported_type_src_key = a12.row_key)
   
   union

select  'd_service_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_service_c                 a12
   on         (a11.service_c_key = a12.row_key)
   
   union

select  'd_task_urgency ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_task_urgency                 a12
   on         (a11.urgency_src_key = a12.row_key)
   
    union

select  'd_transferred_reason_c' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_transferred_reason_c                 a12
   on         (a11.transferred_reason_c_key = a12.row_key)
   
    union

select  'transferred_reason_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_transferred_reason_c                a12
   on         (a11.type_of_impact_c_key = a12.row_key)
   
    union

select  'd_whos_impacted_c ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11
   join                ldb.d_whos_impacted_c                 a12
   on         (a11.whos_impacted_c_key = a12.row_key)
   
   
   union

select  'd_brand_c  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11 join 
ldb.d_location   a15
                  on         (a11.location_key  = a15.row_key)
   join        ldb.d_brand_c              a12
   on         (a15.brand_c_key = a12.row_key)
   
   union

select  'd_calendar_month  ' as Table_Name,count(a11.row_key) Row_Count
from ldb.f_incident    a11 join
ldb.d_calendar_date  a15
                  on         (a11.opened_on_key = a15.row_key)
   join        ldb.d_calendar_month              a12
   on         (a15.month_start_date_key = a12.row_key)
   
)a
)b























