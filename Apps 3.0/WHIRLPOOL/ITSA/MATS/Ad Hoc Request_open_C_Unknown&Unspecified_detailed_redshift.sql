select 'opened_on_key '   as Table_Name, 
COUNT(a11.opened_on_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_on_key  ) AS DistinctValues, 
sum(case when a11.opened_on_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_on_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_on_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_on_key  )) then 'Failed'  
when ((sum(case when a11.opened_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_on_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_on_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
UNION 
select 'ad_hoc_request_c_key '   as Table_Name, 
COUNT(a11.ad_hoc_request_c_key ) AS TotalRows,
COUNT(DISTINCT a11.ad_hoc_request_c_key  ) AS DistinctValues, 
sum(case when a11.ad_hoc_request_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.ad_hoc_request_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.ad_hoc_request_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.ad_hoc_request_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.ad_hoc_request_c_key  )) then 'Failed'  
when ((sum(case when a11.ad_hoc_request_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.ad_hoc_request_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.ad_hoc_request_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_c       a13
on (a11.ad_hoc_request_c_key = a13.row_key)
UNION 
select 'ci_autofill_key '   as Table_Name, 
COUNT(a11.ci_autofill_key ) AS TotalRows,
COUNT(DISTINCT a11.ci_autofill_key  ) AS DistinctValues, 
sum(case when a11.ci_autofill_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.ci_autofill_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.ci_autofill_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.ci_autofill_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.ci_autofill_key  )) then 'Failed'  
when ((sum(case when a11.ci_autofill_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.ci_autofill_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.ci_autofill_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ci_autofill_c       a14
on (a11.ci_autofill_key = a14.row_key)
UNION 
select 'configuration_item_key '   as Table_Name, 
COUNT(a11.configuration_item_key ) AS TotalRows,
COUNT(DISTINCT a11.configuration_item_key  ) AS DistinctValues, 
sum(case when a11.configuration_item_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.configuration_item_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.configuration_item_key  )) then 'Failed'  
when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.configuration_item_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_configuration_item       a15
on (a11.configuration_item_key = a15.row_key)
UNION 
select 'assignment_group_key '   as Table_Name, 
COUNT(a11.assignment_group_key ) AS TotalRows,
COUNT(DISTINCT a11.assignment_group_key  ) AS DistinctValues, 
sum(case when a11.assignment_group_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assignment_group_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assignment_group_key  )) then 'Failed'  
when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assignment_group_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
UNION 
select 'age_key '   as Table_Name, 
COUNT(a11.age_key ) AS TotalRows,
COUNT(DISTINCT a11.age_key  ) AS DistinctValues, 
sum(case when a11.age_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.age_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.age_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.age_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.age_key  )) then 'Failed'  
when ((sum(case when a11.age_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.age_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.age_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_agebucket_c       a17
on (a11.age_key = a17.row_key)
UNION 
select 'assigned_to_key '   as Table_Name, 
COUNT(a11.assigned_to_key ) AS TotalRows,
COUNT(DISTINCT a11.assigned_to_key  ) AS DistinctValues, 
sum(case when a11.assigned_to_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assigned_to_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assigned_to_key  )) then 'Failed'  
when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assigned_to_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_assigned_to       a18
on (a11.assigned_to_key = a18.row_key)
UNION 
select 'business_service_key '   as Table_Name, 
COUNT(a11.business_service_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_key  ) AS DistinctValues, 
sum(case when a11.business_service_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_key  )) then 'Failed'  
when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_business_service       a19
on (a11.business_service_key = a19.row_key)
UNION 
select 'caller_key '   as Table_Name, 
COUNT(a11.caller_key ) AS TotalRows,
COUNT(DISTINCT a11.caller_key  ) AS DistinctValues, 
sum(case when a11.caller_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.caller_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.caller_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.caller_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.caller_key  )) then 'Failed'  
when ((sum(case when a11.caller_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.caller_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.caller_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_caller       a110
on (a11.caller_key = a110.row_key)
UNION 
select 'change_request_key '   as Table_Name, 
COUNT(a11.change_request_key ) AS TotalRows,
COUNT(DISTINCT a11.change_request_key  ) AS DistinctValues, 
sum(case when a11.change_request_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.change_request_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.change_request_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.change_request_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.change_request_key  )) then 'Failed'  
when ((sum(case when a11.change_request_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.change_request_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.change_request_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_change_request       a111
on (a11.change_request_key = a111.row_key)
UNION 
select 'cost_center_key '   as Table_Name, 
COUNT(a11.cost_center_key ) AS TotalRows,
COUNT(DISTINCT a11.cost_center_key  ) AS DistinctValues, 
sum(case when a11.cost_center_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.cost_center_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.cost_center_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.cost_center_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.cost_center_key  )) then 'Failed'  
when ((sum(case when a11.cost_center_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.cost_center_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.cost_center_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_cost_center       a112
on (a11.cost_center_key = a112.row_key)
UNION 
select 'adhoc_requested_for_location_key '   as Table_Name, 
COUNT(a11.adhoc_requested_for_location_key ) AS TotalRows,
COUNT(DISTINCT a11.adhoc_requested_for_location_key  ) AS DistinctValues, 
sum(case when a11.adhoc_requested_for_location_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.adhoc_requested_for_location_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.adhoc_requested_for_location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.adhoc_requested_for_location_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.adhoc_requested_for_location_key  )) then 'Failed'  
when ((sum(case when a11.adhoc_requested_for_location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.adhoc_requested_for_location_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.adhoc_requested_for_location_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_adhoc_requested_for_location_c       a113
on (a11.adhoc_requested_for_location_key = a113.row_key)
UNION 
select 'opened_by_key '   as Table_Name, 
COUNT(a11.opened_by_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_key  ) AS DistinctValues, 
sum(case when a11.opened_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_opened_by_c       a114
on (a11.opened_by_key = a114.row_key)
UNION 
select 'region_key '   as Table_Name, 
COUNT(a11.region_key ) AS TotalRows,
COUNT(DISTINCT a11.region_key  ) AS DistinctValues, 
sum(case when a11.region_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.region_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.region_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.region_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.region_key  )) then 'Failed'  
when ((sum(case when a11.region_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.region_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.region_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_region_c       a115
on (a11.region_key = a115.row_key)
UNION 
select 'month_start_date_key '   as Table_Name, 
COUNT(a12.month_start_date_key ) AS TotalRows,
COUNT(DISTINCT a12.month_start_date_key  ) AS DistinctValues, 
sum(case when a12.month_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.month_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.month_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a12.month_start_date_key  )) then 'Failed'  
when ((sum(case when a12.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.month_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.month_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_month       a116
on (a12.month_start_date_key = a116.row_key)
UNION 
select 'on_hold_type_key '   as Table_Name, 
COUNT(a11.on_hold_type_key ) AS TotalRows,
COUNT(DISTINCT a11.on_hold_type_key  ) AS DistinctValues, 
sum(case when a11.on_hold_type_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.on_hold_type_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.on_hold_type_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.on_hold_type_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.on_hold_type_key  )) then 'Failed'  
when ((sum(case when a11.on_hold_type_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.on_hold_type_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.on_hold_type_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_on_hold_type_c       a117
on (a11.on_hold_type_key = a117.row_key)
UNION 
select 'business_service_key '   as Table_Name, 
COUNT(a11.business_service_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_key  ) AS DistinctValues, 
sum(case when a11.business_service_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_key  )) then 'Failed'  
when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_service_business_service_c       a118
on (a11.business_service_key = a118.row_key)
UNION 
select 'requested_for_key '   as Table_Name, 
COUNT(a11.requested_for_key ) AS TotalRows,
COUNT(DISTINCT a11.requested_for_key  ) AS DistinctValues, 
sum(case when a11.requested_for_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.requested_for_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.requested_for_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.requested_for_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.requested_for_key  )) then 'Failed'  
when ((sum(case when a11.requested_for_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.requested_for_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.requested_for_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_requested_for       a119
on (a11.requested_for_key = a119.row_key)
UNION 
select 'last_resolved_by_key '   as Table_Name, 
COUNT(a11.last_resolved_by_key ) AS TotalRows,
COUNT(DISTINCT a11.last_resolved_by_key  ) AS DistinctValues, 
sum(case when a11.last_resolved_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.last_resolved_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.last_resolved_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.last_resolved_by_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.last_resolved_by_key  )) then 'Failed'  
when ((sum(case when a11.last_resolved_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.last_resolved_by_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.last_resolved_by_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_contact_resolved_by_c       a120
on (a11.last_resolved_by_key = a120.row_key)
UNION 
select 'priority_src_key '   as Table_Name, 
COUNT(a11.priority_src_key ) AS TotalRows,
COUNT(DISTINCT a11.priority_src_key  ) AS DistinctValues, 
sum(case when a11.priority_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.priority_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.priority_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.priority_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.priority_src_key  )) then 'Failed'  
when ((sum(case when a11.priority_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.priority_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.priority_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_priority_c       a121
on (a11.priority_src_key = a121.row_key)
UNION 
select 'reported_type_src_key '   as Table_Name, 
COUNT(a11.reported_type_src_key ) AS TotalRows,
COUNT(DISTINCT a11.reported_type_src_key  ) AS DistinctValues, 
sum(case when a11.reported_type_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.reported_type_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.reported_type_src_key  )) then 'Failed'  
when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.reported_type_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_reported_type_c       a122
on (a11.reported_type_src_key = a122.row_key)
UNION 
select 'state_src_key '   as Table_Name, 
COUNT(a11.state_src_key ) AS TotalRows,
COUNT(DISTINCT a11.state_src_key  ) AS DistinctValues, 
sum(case when a11.state_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.state_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.state_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.state_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.state_src_key  )) then 'Failed'  
when ((sum(case when a11.state_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.state_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.state_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_ad_hoc_request_state_c       a123
on (a11.state_src_key = a123.row_key)
UNION 
select 'support_group_key '   as Table_Name, 
COUNT(a11.support_group_key ) AS TotalRows,
COUNT(DISTINCT a11.support_group_key  ) AS DistinctValues, 
sum(case when a11.support_group_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.support_group_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.support_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.support_group_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.support_group_key  )) then 'Failed'  
when ((sum(case when a11.support_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.support_group_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.support_group_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_support_group_c       a124
on (a11.support_group_key = a124.row_key)
UNION 
select 'vendor_key '   as Table_Name, 
COUNT(a11.vendor_key ) AS TotalRows,
COUNT(DISTINCT a11.vendor_key  ) AS DistinctValues, 
sum(case when a11.vendor_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.vendor_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.vendor_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.vendor_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.vendor_key  )) then 'Failed'  
when ((sum(case when a11.vendor_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.vendor_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.vendor_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_vendor_c       a125
on (a11.vendor_key = a125.row_key)
UNION 
select 'year_start_date_key '   as Table_Name, 
COUNT(a12.year_start_date_key ) AS TotalRows,
COUNT(DISTINCT a12.year_start_date_key  ) AS DistinctValues, 
sum(case when a12.year_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.year_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.year_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.year_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a12.year_start_date_key  )) then 'Failed'  
when ((sum(case when a12.year_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.year_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.year_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_calendar_date       a12
on (a11.opened_on_key = a12.row_key)
join ldb.d_calendar_year       a127
on (a12.year_start_date_key = a127.row_key)
UNION 
select 'queue_manager_c_key '   as Table_Name, 
COUNT(a16.queue_manager_c_key ) AS TotalRows,
COUNT(DISTINCT a16.queue_manager_c_key  ) AS DistinctValues, 
sum(case when a16.queue_manager_c_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.queue_manager_c_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.queue_manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.queue_manager_c_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.queue_manager_c_key  )) then 'Failed'  
when ((sum(case when a16.queue_manager_c_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.queue_manager_c_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.queue_manager_c_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_ad_hoc_request_c       a11 
join ldb.d_internal_organization_group       a16
on (a11.assignment_group_key = a16.row_key)
join ldb.d_internal_contact_queue_manager_c       a126
on (a16.queue_manager_c_key = a126.row_key)

