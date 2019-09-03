select 'customer_key '   as Table_Name, 
COUNT(a11.customer_key ) AS TotalRows,
COUNT(DISTINCT a11.customer_key  ) AS DistinctValues, 
sum(case when a11.customer_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.customer_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.customer_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.customer_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.customer_key  )) then 'Failed'  
when ((sum(case when a11.customer_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.customer_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.customer_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_customer       a12
on (a11.customer_key = a12.row_key)
UNION 
select 'opened_by_key '   as Table_Name, 
COUNT(a11.opened_by_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_key  ) AS DistinctValues, 
sum(case when a11.opened_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
UNION 
select 'opened_time_key '   as Table_Name, 
COUNT(a11.opened_time_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_time_key  ) AS DistinctValues, 
sum(case when a11.opened_time_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_time_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_time_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_time_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_time_key  )) then 'Failed'  
when ((sum(case when a11.opened_time_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_time_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_time_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
UNION 
select 'assignment_group_key '   as Table_Name, 
COUNT(a11.assignment_group_key ) AS TotalRows,
COUNT(DISTINCT a11.assignment_group_key  ) AS DistinctValues, 
sum(case when a11.assignment_group_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assignment_group_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assignment_group_key  )) then 'Failed'  
when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assignment_group_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
UNION 
select 'queue_manager_c_key '   as Table_Name, 
COUNT(a15.queue_manager_c_key ) AS TotalRows,
COUNT(DISTINCT a15.queue_manager_c_key  ) AS DistinctValues, 
sum(case when a15.queue_manager_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a15.queue_manager_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a15.queue_manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a15.queue_manager_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a15.queue_manager_c_key  )) then 'Failed'  
when ((sum(case when a15.queue_manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a15.queue_manager_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a15.queue_manager_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
UNION 
select 'manager_c_key '   as Table_Name, 
COUNT(a16.manager_c_key ) AS TotalRows,
COUNT(DISTINCT a16.manager_c_key  ) AS DistinctValues, 
sum(case when a16.manager_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.manager_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.manager_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.manager_c_key  )) then 'Failed'  
when ((sum(case when a16.manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.manager_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.manager_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
UNION 
select 'affected_user_c_key '   as Table_Name, 
COUNT(a11.affected_user_c_key ) AS TotalRows,
COUNT(DISTINCT a11.affected_user_c_key  ) AS DistinctValues, 
sum(case when a11.affected_user_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.affected_user_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.affected_user_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.affected_user_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.affected_user_c_key  )) then 'Failed'  
when ((sum(case when a11.affected_user_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.affected_user_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.affected_user_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_affected_user_c       a18
on (a11.affected_user_c_key = a18.row_key)
UNION 
select 'country_c_key '   as Table_Name, 
COUNT(a18.country_c_key ) AS TotalRows,
COUNT(DISTINCT a18.country_c_key  ) AS DistinctValues, 
sum(case when a18.country_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a18.country_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a18.country_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.country_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a18.country_c_key  )) then 'Failed'  
when ((sum(case when a18.country_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.country_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a18.country_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_affected_user_c       a18
on (a11.affected_user_c_key = a18.row_key)
join ldb.d_affected_user_location_c       a19
on (a18.country_c_key = a19.row_key)
UNION 
select 'incident_key '   as Table_Name, 
COUNT(a11.incident_key ) AS TotalRows,
COUNT(DISTINCT a11.incident_key  ) AS DistinctValues, 
sum(case when a11.incident_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.incident_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.incident_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.incident_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.incident_key  )) then 'Failed'  
when ((sum(case when a11.incident_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.incident_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.incident_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident       a110
on (a11.incident_key = a110.row_key)
UNION 
select 'business_service_key '   as Table_Name, 
COUNT(a11.business_service_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_key  ) AS DistinctValues, 
sum(case when a11.business_service_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_key  )) then 'Failed'  
when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_business_service       a111
on (a11.business_service_key = a111.row_key)
UNION 
select 'Closed_on_key '   as Table_Name, 
COUNT(a11.Closed_on_key ) AS TotalRows,
COUNT(DISTINCT a11.Closed_on_key  ) AS DistinctValues, 
sum(case when a11.Closed_on_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.Closed_on_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.Closed_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.Closed_on_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.Closed_on_key  )) then 'Failed'  
when ((sum(case when a11.Closed_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.Closed_on_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.Closed_on_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date       a112
on (a11.Closed_on_key = a112.row_key)
UNION 
select 'configuration_item_key '   as Table_Name, 
COUNT(a11.configuration_item_key ) AS TotalRows,
COUNT(DISTINCT a11.configuration_item_key  ) AS DistinctValues, 
sum(case when a11.configuration_item_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.configuration_item_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.configuration_item_key  )) then 'Failed'  
when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.configuration_item_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_configuration_item       a113
on (a11.configuration_item_key = a113.row_key)
UNION 
select 'ci_autofill_c_key '   as Table_Name, 
COUNT(a11.ci_autofill_c_key ) AS TotalRows,
COUNT(DISTINCT a11.ci_autofill_c_key  ) AS DistinctValues, 
sum(case when a11.ci_autofill_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.ci_autofill_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.ci_autofill_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.ci_autofill_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.ci_autofill_c_key  )) then 'Failed'  
when ((sum(case when a11.ci_autofill_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.ci_autofill_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.ci_autofill_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_ci_autofill_c       a114
on (a11.ci_autofill_c_key = a114.row_key)
UNION 
select 'priority_src_key '   as Table_Name, 
COUNT(a11.priority_src_key ) AS TotalRows,
COUNT(DISTINCT a11.priority_src_key  ) AS DistinctValues, 
sum(case when a11.priority_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.priority_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.priority_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.priority_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.priority_src_key  )) then 'Failed'  
when ((sum(case when a11.priority_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.priority_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.priority_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_task_priority       a115
on (a11.priority_src_key = a115.row_key)
UNION 
select 'assigned_to_key '   as Table_Name, 
COUNT(a11.assigned_to_key ) AS TotalRows,
COUNT(DISTINCT a11.assigned_to_key  ) AS DistinctValues, 
sum(case when a11.assigned_to_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assigned_to_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assigned_to_key  )) then 'Failed'  
when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assigned_to_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_assigned_to       a116
on (a11.assigned_to_key = a116.row_key)
UNION 
select 'assignment_group_type_c_key '   as Table_Name, 
COUNT(a11.assignment_group_type_c_key ) AS TotalRows,
COUNT(DISTINCT a11.assignment_group_type_c_key  ) AS DistinctValues, 
sum(case when a11.assignment_group_type_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assignment_group_type_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assignment_group_type_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_type_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assignment_group_type_c_key  )) then 'Failed'  
when ((sum(case when a11.assignment_group_type_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_type_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assignment_group_type_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_assignment_group_type_c       a117
on (a11.assignment_group_type_c_key = a117.row_key)
UNION 
select 'business_service_criticality_src_c_key '   as Table_Name, 
COUNT(a11.business_service_criticality_src_c_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_criticality_src_c_key  ) AS DistinctValues, 
sum(case when a11.business_service_criticality_src_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_criticality_src_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_criticality_src_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_criticality_src_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_criticality_src_c_key  )) then 'Failed'  
when ((sum(case when a11.business_service_criticality_src_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_criticality_src_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_criticality_src_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_business_criticality_incident_c       a118
on (a11.business_service_criticality_src_c_key = a118.row_key)
UNION 
select 'caused_by_change_key '   as Table_Name, 
COUNT(a11.caused_by_change_key ) AS TotalRows,
COUNT(DISTINCT a11.caused_by_change_key  ) AS DistinctValues, 
sum(case when a11.caused_by_change_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.caused_by_change_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.caused_by_change_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.caused_by_change_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.caused_by_change_key  )) then 'Failed'  
when ((sum(case when a11.caused_by_change_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.caused_by_change_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.caused_by_change_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_change_request_caused_by       a119
on (a11.caused_by_change_key = a119.row_key)
UNION 
select 'change_request_key '   as Table_Name, 
COUNT(a11.change_request_key ) AS TotalRows,
COUNT(DISTINCT a11.change_request_key  ) AS DistinctValues, 
sum(case when a11.change_request_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.change_request_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.change_request_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.change_request_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.change_request_key  )) then 'Failed'  
when ((sum(case when a11.change_request_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.change_request_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.change_request_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_change_request       a120
on (a11.change_request_key = a120.row_key)
UNION 
select 'company_key '   as Table_Name, 
COUNT(a11.company_key ) AS TotalRows,
COUNT(DISTINCT a11.company_key  ) AS DistinctValues, 
sum(case when a11.company_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.company_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.company_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.company_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.company_key  )) then 'Failed'  
when ((sum(case when a11.company_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.company_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.company_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_legalentity       a121
on (a11.company_key = a121.row_key)
UNION 
select 'row_current_key '   as Table_Name, 
COUNT(a12.row_current_key ) AS TotalRows,
COUNT(DISTINCT a12.row_current_key  ) AS DistinctValues, 
sum(case when a12.row_current_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.row_current_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.row_current_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.row_current_key  =0 THEN 1 ELSE 0 END ))= COUNT( a12.row_current_key  )) then 'Failed'  
when ((sum(case when a12.row_current_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.row_current_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.row_current_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11
join ldb.d_customer       a12
on (a11.customer_key = a12.row_key)
join ldb.d_customer_mdm       a122
on (a12.row_current_key = a122.row_current_key)
UNION 
select 'opened_by_department_key '   as Table_Name, 
COUNT(a11.opened_by_department_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_department_key  ) AS DistinctValues, 
sum(case when a11.opened_by_department_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_department_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_department_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_department_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_department_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_department_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_department_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_department_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_department       a123
on (a11.opened_by_department_key = a123.row_key)
UNION 
select 'domain_key '   as Table_Name, 
COUNT(a11.domain_key ) AS TotalRows,
COUNT(DISTINCT a11.domain_key  ) AS DistinctValues, 
sum(case when a11.domain_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.domain_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.domain_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.domain_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.domain_key  )) then 'Failed'  
when ((sum(case when a11.domain_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.domain_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.domain_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_domain       a124
on (a11.domain_key = a124.row_key)
UNION 
select 'downgrade_authorized_person_c_key '   as Table_Name, 
COUNT(a11.downgrade_authorized_person_c_key ) AS TotalRows,
COUNT(DISTINCT a11.downgrade_authorized_person_c_key  ) AS DistinctValues, 
sum(case when a11.downgrade_authorized_person_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.downgrade_authorized_person_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.downgrade_authorized_person_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.downgrade_authorized_person_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.downgrade_authorized_person_c_key  )) then 'Failed'  
when ((sum(case when a11.downgrade_authorized_person_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.downgrade_authorized_person_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.downgrade_authorized_person_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_downgrade_authorized_person_c       a125
on (a11.downgrade_authorized_person_c_key = a125.row_key)
UNION 
select 'row_current_key '   as Table_Name, 
COUNT(a13.row_current_key ) AS TotalRows,
COUNT(DISTINCT a13.row_current_key  ) AS DistinctValues, 
sum(case when a13.row_current_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a13.row_current_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a13.row_current_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a13.row_current_key  =0 THEN 1 ELSE 0 END ))= COUNT( a13.row_current_key  )) then 'Failed'  
when ((sum(case when a13.row_current_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a13.row_current_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a13.row_current_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact       a13
on (a11.closed_by_key = a13.row_key)
join ldb.d_internal_contact_mdm       a126
on (a13.row_current_key = a126.row_current_key)
UNION 
select 'hour_24_format_num '   as Table_Name, 
COUNT(a14.hour_24_format_num ) AS TotalRows,
COUNT(DISTINCT a14.hour_24_format_num  ) AS DistinctValues, 
sum(case when a14.hour_24_format_num = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a14.hour_24_format_num =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a14.hour_24_format_num  = -1 THEN 1   ELSE 0 END)  + sum(case when a14.hour_24_format_num  =0 THEN 1 ELSE 0 END ))= COUNT( a14.hour_24_format_num  )) then 'Failed'  
when ((sum(case when a14.hour_24_format_num  = -1 THEN 1   ELSE 0 END)  + sum(case when a14.hour_24_format_num  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a14.hour_24_format_num  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_calendar_time       a14
on (a11.opened_time_key = a14.row_key)
join ldb.d_calendar_time_hour       a127
on (a14.hour_24_format_num = a127.hour_24_format_num)
UNION 
select 'impacted_location_c_key '   as Table_Name, 
COUNT(a11.impacted_location_c_key ) AS TotalRows,
COUNT(DISTINCT a11.impacted_location_c_key  ) AS DistinctValues, 
sum(case when a11.impacted_location_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.impacted_location_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.impacted_location_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impacted_location_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.impacted_location_c_key  )) then 'Failed'  
when ((sum(case when a11.impacted_location_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impacted_location_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.impacted_location_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_impacted_location_c       a128
on (a11.impacted_location_c_key = a128.row_key)
UNION 
select 'age_key '   as Table_Name, 
COUNT(a11.age_key ) AS TotalRows,
COUNT(DISTINCT a11.age_key  ) AS DistinctValues, 
sum(case when a11.age_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.age_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.age_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.age_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.age_key  )) then 'Failed'  
when ((sum(case when a11.age_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.age_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.age_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident_agebucket       a129
on (a11.age_key = a129.row_key)
UNION 
select 'opened_by_key '   as Table_Name, 
COUNT(a11.opened_by_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_key  ) AS DistinctValues, 
sum(case when a11.opened_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_opened_by_c       a130
on (a11.opened_by_key = a130.row_key)
UNION 
select 'region_c_key '   as Table_Name, 
COUNT(a11.region_c_key ) AS TotalRows,
COUNT(DISTINCT a11.region_c_key  ) AS DistinctValues, 
sum(case when a11.region_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.region_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.region_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.region_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.region_c_key  )) then 'Failed'  
when ((sum(case when a11.region_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.region_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.region_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_region_c       a131
on (a11.region_c_key = a131.row_key)
UNION 
select 'resolve_code_src_c_key '   as Table_Name, 
COUNT(a11.resolve_code_src_c_key ) AS TotalRows,
COUNT(DISTINCT a11.resolve_code_src_c_key  ) AS DistinctValues, 
sum(case when a11.resolve_code_src_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.resolve_code_src_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.resolve_code_src_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.resolve_code_src_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.resolve_code_src_c_key  )) then 'Failed'  
when ((sum(case when a11.resolve_code_src_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.resolve_code_src_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.resolve_code_src_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_resolve_code_c       a132
on (a11.resolve_code_src_c_key = a132.row_key)
UNION 
select 'mttr_c_key '   as Table_Name, 
COUNT(a11.mttr_c_key ) AS TotalRows,
COUNT(DISTINCT a11.mttr_c_key  ) AS DistinctValues, 
sum(case when a11.mttr_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.mttr_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.mttr_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.mttr_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.mttr_c_key  )) then 'Failed'  
when ((sum(case when a11.mttr_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.mttr_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.mttr_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident_mttrbucket_c       a133
on (a11.mttr_c_key = a133.row_key)
UNION 
select 'manager_c_key '   as Table_Name, 
COUNT(a11.manager_c_key ) AS TotalRows,
COUNT(DISTINCT a11.manager_c_key  ) AS DistinctValues, 
sum(case when a11.manager_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.manager_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.manager_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.manager_c_key  )) then 'Failed'  
when ((sum(case when a11.manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.manager_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.manager_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_contact_manager_c       a134
on (a11.manager_c_key = a134.row_key)
UNION 
select 'on_hold_type_c_key '   as Table_Name, 
COUNT(a11.on_hold_type_c_key ) AS TotalRows,
COUNT(DISTINCT a11.on_hold_type_c_key  ) AS DistinctValues, 
sum(case when a11.on_hold_type_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.on_hold_type_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.on_hold_type_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.on_hold_type_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.on_hold_type_c_key  )) then 'Failed'  
when ((sum(case when a11.on_hold_type_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.on_hold_type_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.on_hold_type_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident_on_hold_type_c       a135
on (a11.on_hold_type_c_key = a135.row_key)
UNION 
select 'business_service_c_key '   as Table_Name, 
COUNT(a11.business_service_c_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_c_key  ) AS DistinctValues, 
sum(case when a11.business_service_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_c_key  )) then 'Failed'  
when ((sum(case when a11.business_service_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_service_business_service_c       a136
on (a11.business_service_c_key = a136.row_key)
UNION 
select 'problem_key '   as Table_Name, 
COUNT(a11.problem_key ) AS TotalRows,
COUNT(DISTINCT a11.problem_key  ) AS DistinctValues, 
sum(case when a11.problem_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.problem_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.problem_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.problem_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.problem_key  )) then 'Failed'  
when ((sum(case when a11.problem_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.problem_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.problem_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_problem       a137
on (a11.problem_key = a137.row_key)
UNION 
select 'support_group_c_key '   as Table_Name, 
COUNT(a11.support_group_c_key ) AS TotalRows,
COUNT(DISTINCT a11.support_group_c_key  ) AS DistinctValues, 
sum(case when a11.support_group_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.support_group_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.support_group_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.support_group_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.support_group_c_key  )) then 'Failed'  
when ((sum(case when a11.support_group_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.support_group_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.support_group_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_support_group_c       a138
on (a11.support_group_c_key = a138.row_key)
UNION 
select 'vendor_c_key '   as Table_Name, 
COUNT(a11.vendor_c_key ) AS TotalRows,
COUNT(DISTINCT a11.vendor_c_key  ) AS DistinctValues, 
sum(case when a11.vendor_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.vendor_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.vendor_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.vendor_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.vendor_c_key  )) then 'Failed'  
when ((sum(case when a11.vendor_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.vendor_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.vendor_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_vendor_c       a139
on (a11.vendor_c_key = a139.row_key)
UNION 
select 'impact_src_key '   as Table_Name, 
COUNT(a11.impact_src_key ) AS TotalRows,
COUNT(DISTINCT a11.impact_src_key  ) AS DistinctValues, 
sum(case when a11.impact_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.impact_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.impact_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impact_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.impact_src_key  )) then 'Failed'  
when ((sum(case when a11.impact_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impact_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.impact_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_task_impact       a140
on (a11.impact_src_key = a140.row_key)
UNION 
select 'location_key '   as Table_Name, 
COUNT(a11.location_key ) AS TotalRows,
COUNT(DISTINCT a11.location_key  ) AS DistinctValues, 
sum(case when a11.location_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.location_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.location_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.location_key  )) then 'Failed'  
when ((sum(case when a11.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.location_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.location_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_location       a141
on (a11.location_key = a141.row_key)
UNION 
select 'reported_type_src_key '   as Table_Name, 
COUNT(a11.reported_type_src_key ) AS TotalRows,
COUNT(DISTINCT a11.reported_type_src_key  ) AS DistinctValues, 
sum(case when a11.reported_type_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.reported_type_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.reported_type_src_key  )) then 'Failed'  
when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.reported_type_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_task_contacttype       a142
on (a11.reported_type_src_key = a142.row_key)
UNION 
select 'urgency_src_key '   as Table_Name, 
COUNT(a11.urgency_src_key ) AS TotalRows,
COUNT(DISTINCT a11.urgency_src_key  ) AS DistinctValues, 
sum(case when a11.urgency_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.urgency_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.urgency_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.urgency_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.urgency_src_key  )) then 'Failed'  
when ((sum(case when a11.urgency_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.urgency_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.urgency_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_task_urgency       a143
on (a11.urgency_src_key = a143.row_key)
UNION 
select 'used_for_src_key '   as Table_Name, 
COUNT(a111.used_for_src_key ) AS TotalRows,
COUNT(DISTINCT a111.used_for_src_key  ) AS DistinctValues, 
sum(case when a111.used_for_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a111.used_for_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a111.used_for_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a111.used_for_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a111.used_for_src_key  )) then 'Failed'  
when ((sum(case when a111.used_for_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a111.used_for_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a111.used_for_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_business_service       a111
on (a11.business_service_key = a111.row_key)
join ldb.d_business_service_used_for       a144
on (a111.used_for_src_key = a144.row_key)
UNION 
select 'category_src_key '   as Table_Name, 
COUNT(a110.category_src_key ) AS TotalRows,
COUNT(DISTINCT a110.category_src_key  ) AS DistinctValues, 
sum(case when a110.category_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a110.category_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a110.category_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.category_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a110.category_src_key  )) then 'Failed'  
when ((sum(case when a110.category_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.category_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a110.category_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident       a110
on (a11.incident_key = a110.row_key)
join ldb.d_incident_category       a145
on (a110.category_src_key = a145.row_key)
UNION 
select 'close_code_src_key '   as Table_Name, 
COUNT(a110.close_code_src_key ) AS TotalRows,
COUNT(DISTINCT a110.close_code_src_key  ) AS DistinctValues, 
sum(case when a110.close_code_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a110.close_code_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a110.close_code_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.close_code_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a110.close_code_src_key  )) then 'Failed'  
when ((sum(case when a110.close_code_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.close_code_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a110.close_code_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident       a110
on (a11.incident_key = a110.row_key)
join ldb.d_incident_close_code       a146
on (a110.close_code_src_key = a146.row_key)
UNION 
select 'state_src_key '   as Table_Name, 
COUNT(a110.state_src_key ) AS TotalRows,
COUNT(DISTINCT a110.state_src_key  ) AS DistinctValues, 
sum(case when a110.state_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a110.state_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a110.state_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.state_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a110.state_src_key  )) then 'Failed'  
when ((sum(case when a110.state_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.state_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a110.state_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident       a110
on (a11.incident_key = a110.row_key)
join ldb.d_incident_state       a147
on (a110.state_src_key = a147.row_key)
UNION 
select 'sub_category_src_key '   as Table_Name, 
COUNT(a110.sub_category_src_key ) AS TotalRows,
COUNT(DISTINCT a110.sub_category_src_key  ) AS DistinctValues, 
sum(case when a110.sub_category_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a110.sub_category_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a110.sub_category_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.sub_category_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a110.sub_category_src_key  )) then 'Failed'  
when ((sum(case when a110.sub_category_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a110.sub_category_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a110.sub_category_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_incident       a110
on (a11.incident_key = a110.row_key)
join ldb.d_incident_subcategory       a148
on (a110.sub_category_src_key = a148.row_key)
UNION 
select 'lev_1_key '   as Table_Name, 
COUNT(a17.lev_1_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_1_key  ) AS DistinctValues, 
sum(case when a17.lev_1_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_1_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_1_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_1_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_1_key  )) then 'Failed'  
when ((sum(case when a17.lev_1_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_1_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_1_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level1_c       a150
on (a17.lev_1_key = a150.row_key)
UNION 
select 'lev_2_key '   as Table_Name, 
COUNT(a17.lev_2_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_2_key  ) AS DistinctValues, 
sum(case when a17.lev_2_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_2_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_2_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_2_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_2_key  )) then 'Failed'  
when ((sum(case when a17.lev_2_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_2_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_2_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level2_c       a151
on (a17.lev_2_key = a151.row_key)
UNION 
select 'lev_3_key '   as Table_Name, 
COUNT(a17.lev_3_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_3_key  ) AS DistinctValues, 
sum(case when a17.lev_3_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_3_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_3_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_3_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_3_key  )) then 'Failed'  
when ((sum(case when a17.lev_3_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_3_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_3_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level3_c       a152
on (a17.lev_3_key = a152.row_key)
UNION 
select 'lev_4_key '   as Table_Name, 
COUNT(a17.lev_4_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_4_key  ) AS DistinctValues, 
sum(case when a17.lev_4_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_4_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_4_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_4_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_4_key  )) then 'Failed'  
when ((sum(case when a17.lev_4_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_4_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_4_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level4_c       a153
on (a17.lev_4_key = a153.row_key)
UNION 
select 'lev_5_key '   as Table_Name, 
COUNT(a17.lev_5_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_5_key  ) AS DistinctValues, 
sum(case when a17.lev_5_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_5_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_5_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_5_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_5_key  )) then 'Failed'  
when ((sum(case when a17.lev_5_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_5_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_5_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level5_c       a154
on (a17.lev_5_key = a154.row_key)
UNION 
select 'lev_6_key '   as Table_Name, 
COUNT(a17.lev_6_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_6_key  ) AS DistinctValues, 
sum(case when a17.lev_6_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_6_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_6_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_6_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_6_key  )) then 'Failed'  
when ((sum(case when a17.lev_6_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_6_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_6_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level6_c       a155
on (a17.lev_6_key = a155.row_key)
UNION 
select 'lev_7_key '   as Table_Name, 
COUNT(a17.lev_7_key ) AS TotalRows,
COUNT(DISTINCT a17.lev_7_key  ) AS DistinctValues, 
sum(case when a17.lev_7_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.lev_7_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.lev_7_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_7_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.lev_7_key  )) then 'Failed'  
when ((sum(case when a17.lev_7_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.lev_7_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.lev_7_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.dh_queue_manager_hierarchy_c       a17
on (a16.manager_c_key = a17.lev_0_key)
join ldb.dh_queue_manager_level7_c       a156
on (a17.lev_7_key = a156.row_key)
UNION 
select 'manager_c_key '   as Table_Name, 
COUNT(a16.manager_c_key ) AS TotalRows,
COUNT(DISTINCT a16.manager_c_key  ) AS DistinctValues, 
sum(case when a16.manager_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.manager_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.manager_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.manager_c_key  )) then 'Failed'  
when ((sum(case when a16.manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.manager_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.manager_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.d_internal_contact_queue_manager_c       a16
on (a15.queue_manager_c_key = a16.row_key)
join ldb.d_internal_contact_manager_queue_c       a158
on (a16.manager_c_key = a158.row_key)
UNION 
select 'week_start_date_key '   as Table_Name, 
COUNT(a112.week_start_date_key ) AS TotalRows,
COUNT(DISTINCT a112.week_start_date_key  ) AS DistinctValues, 
sum(case when a112.week_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a112.week_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a112.week_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.week_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a112.week_start_date_key  )) then 'Failed'  
when ((sum(case when a112.week_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.week_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a112.week_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11
join ldb.d_calendar_date       a112
on (a11.Closed_on_key = a112.row_key)
join ldb.d_calendar_week       a149
on (a112.week_start_date_key = a149.row_key)
UNION 
select 'month_start_date_key '   as Table_Name, 
COUNT(a112.month_start_date_key ) AS TotalRows,
COUNT(DISTINCT a112.month_start_date_key  ) AS DistinctValues, 
sum(case when a112.month_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a112.month_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a112.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.month_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a112.month_start_date_key  )) then 'Failed'  
when ((sum(case when a112.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.month_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a112.month_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11
join ldb.d_calendar_date       a112
on (a11.Closed_on_key = a112.row_key)
join ldb.d_calendar_month       a157
on (a112.month_start_date_key = a157.row_key)
UNION 
select 'quarter_start_date_key '   as Table_Name, 
COUNT(a112.quarter_start_date_key ) AS TotalRows,
COUNT(DISTINCT a112.quarter_start_date_key  ) AS DistinctValues, 
sum(case when a112.quarter_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a112.quarter_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a112.quarter_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.quarter_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a112.quarter_start_date_key  )) then 'Failed'  
when ((sum(case when a112.quarter_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.quarter_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a112.quarter_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date       a112
on (a11.Closed_on_key = a112.row_key)
join ldb.d_calendar_quarter       a159
on (a112.quarter_start_date_key = a159.row_key)
UNION 
select 'year_start_date_key '   as Table_Name, 
COUNT(a112.year_start_date_key ) AS TotalRows,
COUNT(DISTINCT a112.year_start_date_key  ) AS DistinctValues, 
sum(case when a112.year_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a112.year_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a112.year_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.year_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a112.year_start_date_key  )) then 'Failed'  
when ((sum(case when a112.year_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a112.year_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a112.year_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident_closed       a11 
join ldb.d_calendar_date       a112
on (a11.Closed_on_key = a112.row_key)
join ldb.d_calendar_year       a160
on (a112.year_start_date_key = a160.row_key)

