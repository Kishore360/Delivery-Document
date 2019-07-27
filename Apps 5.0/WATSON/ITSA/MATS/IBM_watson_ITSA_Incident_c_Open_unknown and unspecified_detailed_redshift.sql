select 'incident_key  '   as Table_Name, 
COUNT(a11.incident_key  ) AS TotalRows,
COUNT(DISTINCT a11.incident_key   ) AS DistinctValues, 
sum(case when a11.incident_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.incident_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.incident_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a11.incident_key   =0 THEN 1 ELSE 0 END ))= COUNT( a11.incident_key   )) then 'Failed'  
when ((sum(case when a11.incident_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a11.incident_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.incident_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_incident       a12
on (a11.incident_key  = a12.row_key)
union
select 'assigned_to_key '   as Table_Name, 
COUNT(a11.assigned_to_key ) AS TotalRows,
COUNT(DISTINCT a11.assigned_to_key  ) AS DistinctValues, 
sum(case when a11.assigned_to_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assigned_to_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assigned_to_key  )) then 'Failed'  
when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assigned_to_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_internal_contact_assigned_to  a13
on (a11.assigned_to_key = a13.row_key)
union
select 'assignment_group_key '   as Table_Name, 
COUNT(a11.assignment_group_key ) AS TotalRows,
COUNT(DISTINCT a11.assignment_group_key  ) AS DistinctValues, 
sum(case when a11.assignment_group_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assignment_group_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assignment_group_key  )) then 'Failed'  
when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assignment_group_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_internal_organization_group  a14
on (a11.assignment_group_key = a14.row_key)
union
select 'business_service_key '   as Table_Name, 
COUNT(a11.business_service_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_key  ) AS DistinctValues, 
sum(case when a11.business_service_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_key  )) then 'Failed'  
when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_business_service   a15
on (a11.business_service_key = a15.row_key)
union
select 'opened_on_key '   as Table_Name, 
COUNT(a11.opened_on_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_on_key  ) AS DistinctValues, 
sum(case when a11.opened_on_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_on_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_on_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_on_key  )) then 'Failed'  
when ((sum(case when a11.opened_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_on_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_on_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_calendar_date  a16
on (a11.opened_on_key = a16.row_key)
union
select 'caused_by_change_key '   as Table_Name, 
COUNT(a11.caused_by_change_key ) AS TotalRows,
COUNT(DISTINCT a11.caused_by_change_key  ) AS DistinctValues, 
sum(case when a11.caused_by_change_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.caused_by_change_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.caused_by_change_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.caused_by_change_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.caused_by_change_key  )) then 'Failed'  
when ((sum(case when a11.caused_by_change_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.caused_by_change_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.caused_by_change_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident  a11 
join ldb.d_change_request_caused_by    a17
on (a11.caused_by_change_key = a17.row_key)
union
select 'configuration_item_key '   as Table_Name, 
COUNT(a11.configuration_item_key ) AS TotalRows,
COUNT(DISTINCT a11.configuration_item_key  ) AS DistinctValues, 
sum(case when a11.configuration_item_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.configuration_item_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.configuration_item_key  )) then 'Failed'  
when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.configuration_item_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_configuration_item   a18
on (a11.configuration_item_key = a18.row_key)
union
select 'customer_key '   as Table_Name, 
COUNT(a11.customer_key ) AS TotalRows,
COUNT(DISTINCT a11.customer_key  ) AS DistinctValues, 
sum(case when a11.customer_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.customer_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.customer_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.customer_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.customer_key  )) then 'Failed'  
when ((sum(case when a11.customer_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.customer_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.customer_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident   a11 
join ldb.d_customer   a19
on (a11.customer_key = a19.row_key)
union
select 'opened_by_key '   as Table_Name, 
COUNT(a11.opened_by_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_key  ) AS DistinctValues, 
sum(case when a11.opened_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_internal_contact    a110
on (a11.opened_by_key = a110.row_key)
union
select 'opened_time_key '   as Table_Name, 
COUNT(a11.opened_time_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_time_key  ) AS DistinctValues, 
sum(case when a11.opened_time_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_time_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_time_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_time_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_time_key  )) then 'Failed'  
when ((sum(case when a11.opened_time_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_time_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_time_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_calendar_time  a111
on (a11.opened_time_key = a111.row_key)
union
select 'problem_key '   as Table_Name, 
COUNT(a11.problem_key ) AS TotalRows,
COUNT(DISTINCT a11.problem_key  ) AS DistinctValues, 
sum(case when a11.problem_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.problem_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.problem_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.problem_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.problem_key  )) then 'Failed'  
when ((sum(case when a11.problem_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.problem_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.problem_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident   a11 
join ldb.d_problem     a114
on (a11.problem_key = a114.row_key)
union
select 'tribe_c_key  '   as Table_Name, 
COUNT(a11.tribe_c_key ) AS TotalRows,
COUNT(DISTINCT a11.tribe_c_key   ) AS DistinctValues, 
sum(case when a11.tribe_c_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.tribe_c_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.tribe_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a11.tribe_c_key   =0 THEN 1 ELSE 0 END ))= COUNT( a11.tribe_c_key   )) then 'Failed'  
when ((sum(case when a11.tribe_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a11.tribe_c_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.tribe_c_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident   a11 
join ldb.d_tribe_c  a115
on (a11.tribe_c_key  = a115.row_key)
union
select 'case_key   '   as Table_Name, 
COUNT(a11.case_key ) AS TotalRows,
COUNT(DISTINCT a11.case_key    ) AS DistinctValues, 
sum(case when a11.case_key   = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.case_key   =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.case_key    = -1 THEN 1   ELSE 0 END)  + sum(case when a11.case_key    =0 THEN 1 ELSE 0 END ))= COUNT( a11.case_key    )) then 'Failed'  
when ((sum(case when a11.case_key    = -1 THEN 1   ELSE 0 END)  + sum(case when a11.case_key    =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.case_key    )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident  a11
join ldb.d_case   a117
on (a11.case_key = a117.row_key)
union
select 'company_key '   as Table_Name, 
COUNT(a11.company_key ) AS TotalRows,
COUNT(DISTINCT a11.company_key  ) AS DistinctValues, 
sum(case when a11.company_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.company_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.company_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.company_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.company_key  )) then 'Failed'  
when ((sum(case when a11.company_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.company_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.company_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_internal_organization_legalentity  a118
on (a11.company_key = a118.row_key)
union
select 'domain_key '   as Table_Name, 
COUNT(a11.domain_key ) AS TotalRows,
COUNT(DISTINCT a11.domain_key  ) AS DistinctValues, 
sum(case when a11.domain_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.domain_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.domain_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.domain_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.domain_key  )) then 'Failed'  
when ((sum(case when a11.domain_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.domain_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.domain_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_domain       a119
on (a11.domain_key = a119.row_key)
union
select 'reported_type_src_key '   as Table_Name, 
COUNT(a11.reported_type_src_key ) AS TotalRows,
COUNT(DISTINCT a11.reported_type_src_key  ) AS DistinctValues, 
sum(case when a11.reported_type_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.reported_type_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.reported_type_src_key  )) then 'Failed'  
when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.reported_type_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_incident_contacttype a120
on (a11.reported_type_src_key = a120.row_key)
union
select 'impact_src_key '   as Table_Name, 
COUNT(a11.impact_src_key ) AS TotalRows,
COUNT(DISTINCT a11.impact_src_key  ) AS DistinctValues, 
sum(case when a11.impact_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.impact_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.impact_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impact_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.impact_src_key  )) then 'Failed'  
when ((sum(case when a11.impact_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impact_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT(impact_src_key)) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_incident_impact  a121
on (a11.impact_src_key = a121.row_key)
union
select 'urgency_src_key '   as Table_Name, 
COUNT(a11.urgency_src_key ) AS TotalRows,
COUNT(DISTINCT a11.urgency_src_key  ) AS DistinctValues, 
sum(case when a11.urgency_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.urgency_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.urgency_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.urgency_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.urgency_src_key  )) then 'Failed'  
when ((sum(case when a11.urgency_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.urgency_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT(urgency_src_key)) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_incident_urgency a122
on (a11.urgency_src_key = a122.row_key)
union
select 'location_key '   as Table_Name, 
COUNT(a11.location_key ) AS TotalRows,
COUNT(DISTINCT a11.location_key  ) AS DistinctValues, 
sum(case when a11.location_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.location_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.location_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.location_key  )) then 'Failed'  
when ((sum(case when a11.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.location_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.location_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_location    a123
on (a11.location_key = a123.row_key)
union
select 'criticality_key  '   as Table_Name, 
COUNT(a15.criticality_key  ) AS TotalRows,
COUNT(DISTINCT a15.criticality_key   ) AS DistinctValues, 
sum(case when a15.criticality_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a15.criticality_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a15.criticality_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a15.criticality_key   =0 THEN 1 ELSE 0 END ))= COUNT( a15.criticality_key   )) then 'Failed'  
when ((sum(case when a15.criticality_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a15.criticality_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a15.criticality_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_business_service   a15
on (a11.business_service_key =   a15.row_key)
join ldb.d_business_service_criticality a124
on  (a15.criticality_key = a124.row_key)
union
select 'used_for_src_key  '   as Table_Name, 
COUNT(a15.used_for_src_key  ) AS TotalRows,
COUNT(DISTINCT a15.used_for_src_key   ) AS DistinctValues, 
sum(case when a15.used_for_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a15.used_for_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a15.used_for_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a15.used_for_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a15.used_for_src_key   )) then 'Failed'  
when ((sum(case when a15.used_for_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a15.used_for_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a15.used_for_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11 
join ldb.d_business_service   a15
on (a11.business_service_key =  a15.row_key)
join ldb.d_business_service_used_for  a125
on  (a15.used_for_src_key = a125.row_key)
union
select 'month_start_date_key '   as Table_Name, 
COUNT(a16.month_start_date_key ) AS TotalRows,
COUNT(DISTINCT a16.month_start_date_key  ) AS DistinctValues, 
sum(case when a16.month_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.month_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.month_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.month_start_date_key  )) then 'Failed'  
when ((sum(case when a16.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.month_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.month_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11
join ldb.d_calendar_date   a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_month   a126
on (a16.month_start_date_key = a126.row_key)
union
select 'week_start_date_key  '   as Table_Name, 
COUNT(a16.week_start_date_key  ) AS TotalRows,
COUNT(DISTINCT a16.week_start_date_key   ) AS DistinctValues, 
sum(case when a16.week_start_date_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.week_start_date_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.week_start_date_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a16.week_start_date_key   =0 THEN 1 ELSE 0 END ))= COUNT( a16.week_start_date_key   )) then 'Failed'  
when ((sum(case when a16.week_start_date_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a16.week_start_date_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.week_start_date_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11
join ldb.d_calendar_date   a16
on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_week  a127
on (a16.week_start_date_key  = a127.row_key)
union
select 'row_current_key  '   as Table_Name, 
COUNT(a19.row_current_key  ) AS TotalRows,
COUNT(DISTINCT a19.row_current_key   ) AS DistinctValues, 
sum(case when a19.row_current_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a19.row_current_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a19.row_current_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a19.row_current_key   =0 THEN 1 ELSE 0 END ))= COUNT( a19.row_current_key   )) then 'Failed'  
when ((sum(case when a19.row_current_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a19.row_current_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a19.row_current_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11
join ldb.d_customer   a19
on (a11.customer_key = a19.row_key)
join ldb.d_customer_mdm   a128
on (a19.row_current_key = a128.row_current_key)
union
select 'department_key   '   as Table_Name, 
COUNT(a110.department_key   ) AS TotalRows,
COUNT(DISTINCT a110.department_key    ) AS DistinctValues, 
sum(case when a110.department_key   = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a110.department_key   =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a110.department_key    = -1 THEN 1   ELSE 0 END)  + sum(case when a110.department_key    =0 THEN 1 ELSE 0 END ))= COUNT( a110.department_key    )) then 'Failed'  
when ((sum(case when a110.department_key    = -1 THEN 1   ELSE 0 END)  + sum(case when a110.department_key    =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a110.department_key    )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11
join  ldb.d_internal_contact  a110
on (a11.opened_by_key = a110.row_key)
join ldb.d_internal_organization_department  a129
on (a110.department_key = a129.row_key)
union
select 'hour_24_format_num  '   as Table_Name, 
COUNT(a111.hour_24_format_num  ) AS TotalRows,
COUNT(DISTINCT a111.hour_24_format_num   ) AS DistinctValues, 
sum(case when a111.hour_24_format_num  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a111.hour_24_format_num  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a111.hour_24_format_num   = -1 THEN 1   ELSE 0 END)  + sum(case when a111.hour_24_format_num   =0 THEN 1 ELSE 0 END ))= COUNT( a111.hour_24_format_num   )) then 'Failed'  
when ((sum(case when a111.hour_24_format_num   = -1 THEN 1   ELSE 0 END)  + sum(case when a111.hour_24_format_num   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a111.hour_24_format_num   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident       a11
join  ldb.d_calendar_time      a111
on (a11.opened_time_key = a111.row_key)
join ldb.d_calendar_time_hour a130
on (a111.hour_24_format_num = a130.hour_24_format_num)
union
select 'caller_key  '   as Table_Name, 
COUNT(a12.caller_key  ) AS TotalRows,
COUNT(DISTINCT a12.caller_key   ) AS DistinctValues, 
sum(case when a12.caller_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.caller_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.caller_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.caller_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.caller_key   )) then 'Failed'  
when ((sum(case when a12.caller_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.caller_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.caller_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join ldb.d_incident_caller     a131
on (a12.caller_key = a131.row_key)
union
select 'category_src_key  '   as Table_Name, 
COUNT(a12.category_src_key  ) AS TotalRows,
COUNT(DISTINCT a12.category_src_key   ) AS DistinctValues, 
sum(case when a12.category_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.category_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.category_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.category_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.category_src_key   )) then 'Failed'  
when ((sum(case when a12.category_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.category_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.category_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join  ldb.d_incident_category  a132
on (a12.category_src_key = a132.row_key)
union
select 'close_code_src_key  '   as Table_Name, 
COUNT(a12.close_code_src_key  ) AS TotalRows,
COUNT(DISTINCT a12.close_code_src_key   ) AS DistinctValues, 
sum(case when a12.close_code_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.close_code_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.close_code_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.close_code_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.close_code_src_key   )) then 'Failed'  
when ((sum(case when a12.close_code_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.close_code_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.close_code_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join ldb.d_incident_close_code          a133
on (a12.close_code_src_key = a133.row_key)
union
select 'opened_by_key  '   as Table_Name, 
COUNT(a12.opened_by_key  ) AS TotalRows,
COUNT(DISTINCT a12.opened_by_key   ) AS DistinctValues, 
sum(case when a12.opened_by_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.opened_by_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.opened_by_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.opened_by_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.opened_by_key   )) then 'Failed'  
when ((sum(case when a12.opened_by_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.opened_by_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.opened_by_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join  ldb.d_incident_opened_by  a134
on (a12.opened_by_key = a134.row_key)
union
select 'priority_src_key  '   as Table_Name, 
COUNT(a12.priority_src_key  ) AS TotalRows,
COUNT(DISTINCT a12.priority_src_key   ) AS DistinctValues, 
sum(case when a12.priority_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.priority_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.priority_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.priority_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.priority_src_key   )) then 'Failed'  
when ((sum(case when a12.priority_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.priority_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.priority_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join ldb.d_incident_priority a135
on (a12.priority_src_key = a135.row_key)
union
select 'met_resolution_sla_flag_key  '   as Table_Name, 
COUNT(a12.met_resolution_sla_flag_key  ) AS TotalRows,
COUNT(DISTINCT a12.met_resolution_sla_flag_key   ) AS DistinctValues, 
sum(case when a12.met_resolution_sla_flag_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.met_resolution_sla_flag_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.met_resolution_sla_flag_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.met_resolution_sla_flag_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.met_resolution_sla_flag_key   )) then 'Failed'  
when ((sum(case when a12.met_resolution_sla_flag_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.met_resolution_sla_flag_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.met_resolution_sla_flag_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join  ldb.d_task_sla_resolution_flag  a136
on (a12.met_resolution_sla_flag_key = a136.row_key)
union
select 'met_response_sla_flag_key  '   as Table_Name, 
COUNT(a12.met_response_sla_flag_key  ) AS TotalRows,
COUNT(DISTINCT a12.met_response_sla_flag_key   ) AS DistinctValues, 
sum(case when a12.met_response_sla_flag_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.met_response_sla_flag_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.met_response_sla_flag_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.met_response_sla_flag_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.met_response_sla_flag_key   )) then 'Failed'  
when ((sum(case when a12.met_response_sla_flag_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.met_response_sla_flag_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.met_response_sla_flag_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join  ldb.d_task_sla_response_flag    a137
on (a12.met_response_sla_flag_key = a137.row_key)
union
select 'severity_src_key  '   as Table_Name, 
COUNT(a12.severity_src_key  ) AS TotalRows,
COUNT(DISTINCT a12.severity_src_key   ) AS DistinctValues, 
sum(case when a12.severity_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.severity_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.severity_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.severity_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.severity_src_key   )) then 'Failed'  
when ((sum(case when a12.severity_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.severity_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.severity_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join ldb.d_incident_severity a138
on (a12.severity_src_key = a138.row_key)
union
select 'state_src_key  '   as Table_Name, 
COUNT(a12.state_src_key  ) AS TotalRows,
COUNT(DISTINCT a12.state_src_key   ) AS DistinctValues, 
sum(case when a12.state_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.state_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.state_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.state_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.state_src_key   )) then 'Failed'  
when ((sum(case when a12.state_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.state_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.state_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join  ldb.d_incident_state      a139
on (a12.state_src_key = a139.row_key)
union
select 'sub_category_src_key  '   as Table_Name, 
COUNT(a12.sub_category_src_key  ) AS TotalRows,
COUNT(DISTINCT a12.sub_category_src_key   ) AS DistinctValues, 
sum(case when a12.sub_category_src_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.sub_category_src_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.sub_category_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.sub_category_src_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.sub_category_src_key   )) then 'Failed'  
when ((sum(case when a12.sub_category_src_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.sub_category_src_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.sub_category_src_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_incident  a12
on (a11.incident_key  = a12.row_key)
join  ldb.d_incident_subcategory       a140
on (a12.sub_category_src_key = a140.row_key)
union
select 'parent_problem_c_key  '   as Table_Name, 
COUNT(a114.parent_problem_c_key  ) AS TotalRows,
COUNT(DISTINCT a114.parent_problem_c_key   ) AS DistinctValues, 
sum(case when a114.parent_problem_c_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a114.parent_problem_c_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a114.parent_problem_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a114.parent_problem_c_key   =0 THEN 1 ELSE 0 END ))= COUNT( a114.parent_problem_c_key   )) then 'Failed'  
when ((sum(case when a114.parent_problem_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a114.parent_problem_c_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a114.parent_problem_c_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join  ldb.d_problem  a114
 on (a11.problem_key = a114.row_key)
join ldb.d_parent_problem_c  a141
on  (a114.parent_problem_c_key = a141.row_key)
union
select 'quarter_start_date_key  '   as Table_Name, 
COUNT(a16.quarter_start_date_key  ) AS TotalRows,
COUNT(DISTINCT a16.quarter_start_date_key   ) AS DistinctValues, 
sum(case when a16.quarter_start_date_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.quarter_start_date_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.quarter_start_date_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a16.quarter_start_date_key   =0 THEN 1 ELSE 0 END ))= COUNT( a16.quarter_start_date_key   )) then 'Failed'  
when ((sum(case when a16.quarter_start_date_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a16.quarter_start_date_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.quarter_start_date_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_calendar_date  a16
 on (a11.opened_on_key = a16.row_key)
join  ldb.d_calendar_quarter a142
on (a16.quarter_start_date_key = a142.row_key)
union
select 'incident_status_c_key  '   as Table_Name, 
COUNT(a12.incident_status_c_key  ) AS TotalRows,
COUNT(DISTINCT a12.incident_status_c_key   ) AS DistinctValues, 
sum(case when a12.incident_status_c_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.incident_status_c_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.incident_status_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.incident_status_c_key   =0 THEN 1 ELSE 0 END ))= COUNT( a12.incident_status_c_key   )) then 'Failed'  
when ((sum(case when a12.incident_status_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a12.incident_status_c_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.incident_status_c_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join  ldb.d_incident   a12
on (a11.incident_key = a12.row_key)
join  ldb.d_lov_incident_status_c       a143
on (a12.incident_status_c_key = a143.row_key)
union
select 'incident_status_c_key  '   as Table_Name, 
COUNT(a112.incident_status_c_key  ) AS TotalRows,
COUNT(DISTINCT a112.incident_status_c_key   ) AS DistinctValues, 
sum(case when a112.incident_status_c_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a112.incident_status_c_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a112.incident_status_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a112.incident_status_c_key   =0 THEN 1 ELSE 0 END ))= COUNT( a112.incident_status_c_key   )) then 'Failed'  
when ((sum(case when a112.incident_status_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a112.incident_status_c_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a112.incident_status_c_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
 join   ldb.d_incident   a12
on (a11.incident_key = a12.row_key)
join  ldb.d_parent_incident  a112
on (a12.parent_incident_key = a112.row_key)
join  ldb.d_configuration_item_parent_c        a144
on (a112.configuration_item_key = a144.row_key)
union
select 'general_manager_c_key  '   as Table_Name, 
COUNT(a116.general_manager_c_key  ) AS TotalRows,
COUNT(DISTINCT a116.general_manager_c_key   ) AS DistinctValues, 
sum(case when a116.general_manager_c_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a116.general_manager_c_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a116.general_manager_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a116.general_manager_c_key   =0 THEN 1 ELSE 0 END ))= COUNT( a116.general_manager_c_key   )) then 'Failed'  
when ((sum(case when a116.general_manager_c_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a116.general_manager_c_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a116.general_manager_c_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_tribe_c a115
on   (a11.tribe_c_key = a115.row_key)
join   ldb.d_segment_c    a116
 on (a115.segment_c_key = a116.row_key)
join  ldb.d_internal_contact_general_manager_c  a145
on   (a116.general_manager_c_key = a145.row_key)
union
select 'year_start_date_key  '   as Table_Name, 
COUNT(a16.year_start_date_key  ) AS TotalRows,
COUNT(DISTINCT a16.year_start_date_key   ) AS DistinctValues, 
sum(case when a16.year_start_date_key  = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.year_start_date_key  =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.year_start_date_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a16.year_start_date_key   =0 THEN 1 ELSE 0 END ))= COUNT( a16.year_start_date_key   )) then 'Failed'  
when ((sum(case when a16.year_start_date_key   = -1 THEN 1   ELSE 0 END)  + sum(case when a16.year_start_date_key   =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.year_start_date_key   )) then 'Failed' else 'Success' end as compare
from  ldb.f_incident a11
join ldb.d_calendar_date      a16
 on (a11.opened_on_key = a16.row_key)
join ldb.d_calendar_year  a146
on (a16.year_start_date_key = a146.row_key)


