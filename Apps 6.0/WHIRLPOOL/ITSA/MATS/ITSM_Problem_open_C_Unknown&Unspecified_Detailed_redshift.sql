select 'opened_by_key '   as Table_Name, 
COUNT(a11.opened_by_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_key  ) AS DistinctValues, 
sum(case when a11.opened_by_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
UNION 
select 'opened_time_key '   as Table_Name, 
COUNT(a11.opened_time_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_time_key  ) AS DistinctValues, 
sum(case when a11.opened_time_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_time_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_time_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_time_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_time_key  )) then 'Failed'  
when ((sum(case when a11.opened_time_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_time_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_time_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
UNION 
select 'assigned_to_key '   as Table_Name, 
COUNT(a11.assigned_to_key ) AS TotalRows,
COUNT(DISTINCT a11.assigned_to_key  ) AS DistinctValues, 
sum(case when a11.assigned_to_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assigned_to_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assigned_to_key  )) then 'Failed'  
when ((sum(case when a11.assigned_to_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assigned_to_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assigned_to_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key = a14.row_key)
UNION 
select 'assignment_group_key '   as Table_Name, 
COUNT(a11.assignment_group_key ) AS TotalRows,
COUNT(DISTINCT a11.assignment_group_key  ) AS DistinctValues, 
sum(case when a11.assignment_group_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.assignment_group_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.assignment_group_key  )) then 'Failed'  
when ((sum(case when a11.assignment_group_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.assignment_group_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.assignment_group_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
UNION 
select 'row_dn_key '   as Table_Name, 
COUNT(a15.row_dn_key ) AS TotalRows,
COUNT(DISTINCT a15.row_dn_key  ) AS DistinctValues, 
sum(case when a15.row_dn_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a15.row_dn_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a15.row_dn_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a15.row_dn_key  =0 THEN 1 ELSE 0 END ))= COUNT( a15.row_dn_key  )) then 'Failed'  
when ((sum(case when a15.row_dn_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a15.row_dn_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a15.row_dn_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key = a16.lev_0_key)
UNION 
select 'business_service_key '   as Table_Name, 
COUNT(a11.business_service_key ) AS TotalRows,
COUNT(DISTINCT a11.business_service_key  ) AS DistinctValues, 
sum(case when a11.business_service_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.business_service_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.business_service_key  )) then 'Failed'  
when ((sum(case when a11.business_service_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.business_service_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.business_service_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
UNION 
select 'opened_on_key '   as Table_Name, 
COUNT(a11.opened_on_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_on_key  ) AS DistinctValues, 
sum(case when a11.opened_on_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_on_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_on_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_on_key  )) then 'Failed'  
when ((sum(case when a11.opened_on_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_on_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_on_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
UNION 
select 'configuration_item_key '   as Table_Name, 
COUNT(a11.configuration_item_key ) AS TotalRows,
COUNT(DISTINCT a11.configuration_item_key  ) AS DistinctValues, 
sum(case when a11.configuration_item_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.configuration_item_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.configuration_item_key  )) then 'Failed'  
when ((sum(case when a11.configuration_item_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.configuration_item_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.configuration_item_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_configuration_item       a19
on (a11.configuration_item_key = a19.row_key)
UNION 
select 'problem_key '   as Table_Name, 
COUNT(a11.problem_key ) AS TotalRows,
COUNT(DISTINCT a11.problem_key  ) AS DistinctValues, 
sum(case when a11.problem_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.problem_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.problem_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.problem_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.problem_key  )) then 'Failed'  
when ((sum(case when a11.problem_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.problem_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.problem_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_problem       a110
on (a11.problem_key = a110.row_key)
UNION 
select 'change_request_key '   as Table_Name, 
COUNT(a11.change_request_key ) AS TotalRows,
COUNT(DISTINCT a11.change_request_key  ) AS DistinctValues, 
sum(case when a11.change_request_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.change_request_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.change_request_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.change_request_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.change_request_key  )) then 'Failed'  
when ((sum(case when a11.change_request_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.change_request_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.change_request_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_change_request       a111
on (a11.change_request_key = a111.row_key)
UNION 
select 'opened_by_department_key '   as Table_Name, 
COUNT(a11.opened_by_department_key ) AS TotalRows,
COUNT(DISTINCT a11.opened_by_department_key  ) AS DistinctValues, 
sum(case when a11.opened_by_department_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.opened_by_department_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.opened_by_department_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_department_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.opened_by_department_key  )) then 'Failed'  
when ((sum(case when a11.opened_by_department_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.opened_by_department_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.opened_by_department_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_department       a112
on (a11.opened_by_department_key = a112.row_key)
UNION 
select 'row_current_key '   as Table_Name, 
COUNT(a12.row_current_key ) AS TotalRows,
COUNT(DISTINCT a12.row_current_key  ) AS DistinctValues, 
sum(case when a12.row_current_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a12.row_current_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a12.row_current_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.row_current_key  =0 THEN 1 ELSE 0 END ))= COUNT( a12.row_current_key  )) then 'Failed'  
when ((sum(case when a12.row_current_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a12.row_current_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a12.row_current_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_contact       a12
on (a11.opened_by_key = a12.row_key)
join ldb.d_internal_contact_mdm       a113
on (a12.row_current_key = a113.row_current_key)
UNION 
select 'hour_24_format_num '   as Table_Name, 
COUNT(a13.hour_24_format_num ) AS TotalRows,
COUNT(DISTINCT a13.hour_24_format_num  ) AS DistinctValues, 
sum(case when a13.hour_24_format_num = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a13.hour_24_format_num =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a13.hour_24_format_num  = -1 THEN 1   ELSE 0 END)  + sum(case when a13.hour_24_format_num  =0 THEN 1 ELSE 0 END ))= COUNT( a13.hour_24_format_num  )) then 'Failed'  
when ((sum(case when a13.hour_24_format_num  = -1 THEN 1   ELSE 0 END)  + sum(case when a13.hour_24_format_num  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a13.hour_24_format_num  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_time       a13
on (a11.opened_time_key = a13.row_key)
join ldb.d_calendar_time_hour       a114
on (a13.hour_24_format_num = a114.hour_24_format_num)
UNION 
select 'impact_src_key '   as Table_Name, 
COUNT(a11.impact_src_key ) AS TotalRows,
COUNT(DISTINCT a11.impact_src_key  ) AS DistinctValues, 
sum(case when a11.impact_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.impact_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.impact_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impact_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.impact_src_key  )) then 'Failed'  
when ((sum(case when a11.impact_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.impact_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.impact_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_problem_impact       a115
on (a11.impact_src_key = a115.row_key)
UNION 
select 'priority_src_key '   as Table_Name, 
COUNT(a11.priority_src_key ) AS TotalRows,
COUNT(DISTINCT a11.priority_src_key  ) AS DistinctValues, 
sum(case when a11.priority_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.priority_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.priority_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.priority_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.priority_src_key  )) then 'Failed'  
when ((sum(case when a11.priority_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.priority_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.priority_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_problem_priority       a116
on (a11.priority_src_key = a116.row_key)
UNION 
select 'reported_type_src_key '   as Table_Name, 
COUNT(a11.reported_type_src_key ) AS TotalRows,
COUNT(DISTINCT a11.reported_type_src_key  ) AS DistinctValues, 
sum(case when a11.reported_type_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.reported_type_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.reported_type_src_key  )) then 'Failed'  
when ((sum(case when a11.reported_type_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.reported_type_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.reported_type_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_problem_reported_type       a117
on (a11.reported_type_src_key = a117.row_key)
UNION 
select 'state_src_key '   as Table_Name, 
COUNT(a11.state_src_key ) AS TotalRows,
COUNT(DISTINCT a11.state_src_key  ) AS DistinctValues, 
sum(case when a11.state_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.state_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.state_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.state_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.state_src_key  )) then 'Failed'  
when ((sum(case when a11.state_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.state_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.state_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_problem_state       a118
on (a11.state_src_key = a118.row_key)
UNION 
select 'urgency_src_key '   as Table_Name, 
COUNT(a11.urgency_src_key ) AS TotalRows,
COUNT(DISTINCT a11.urgency_src_key  ) AS DistinctValues, 
sum(case when a11.urgency_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.urgency_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.urgency_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.urgency_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.urgency_src_key  )) then 'Failed'  
when ((sum(case when a11.urgency_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.urgency_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.urgency_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_problem_urgency       a119
on (a11.urgency_src_key = a119.row_key)
UNION 
select 'location_key '   as Table_Name, 
COUNT(a11.location_key ) AS TotalRows,
COUNT(DISTINCT a11.location_key  ) AS DistinctValues, 
sum(case when a11.location_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a11.location_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a11.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.location_key  =0 THEN 1 ELSE 0 END ))= COUNT( a11.location_key  )) then 'Failed'  
when ((sum(case when a11.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a11.location_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a11.location_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_location       a120
on (a11.location_key = a120.row_key)
UNION 
select 'location_key '   as Table_Name, 
COUNT(a14.location_key ) AS TotalRows,
COUNT(DISTINCT a14.location_key  ) AS DistinctValues, 
sum(case when a14.location_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a14.location_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a14.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a14.location_key  =0 THEN 1 ELSE 0 END ))= COUNT( a14.location_key  )) then 'Failed'  
when ((sum(case when a14.location_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a14.location_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a14.location_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_contact_assigned_to       a14
on (a11.assigned_to_key = a14.row_key)
join ldb.d_location_assigned_to       a121
on (a14.location_key = a121.row_key)
UNION 
select 'lev_1_key '   as Table_Name, 
COUNT(a16.lev_1_key ) AS TotalRows,
COUNT(DISTINCT a16.lev_1_key  ) AS DistinctValues, 
sum(case when a16.lev_1_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.lev_1_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.lev_1_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_1_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.lev_1_key  )) then 'Failed'  
when ((sum(case when a16.lev_1_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_1_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.lev_1_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level1       a122
on (a16.lev_1_key = a122.row_key)
UNION 
select 'lev_2_key '   as Table_Name, 
COUNT(a16.lev_2_key ) AS TotalRows,
COUNT(DISTINCT a16.lev_2_key  ) AS DistinctValues, 
sum(case when a16.lev_2_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.lev_2_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.lev_2_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_2_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.lev_2_key  )) then 'Failed'  
when ((sum(case when a16.lev_2_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_2_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.lev_2_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level2       a126
on (a16.lev_2_key = a126.row_key)
UNION 
select 'lev_3_key '   as Table_Name, 
COUNT(a16.lev_3_key ) AS TotalRows,
COUNT(DISTINCT a16.lev_3_key  ) AS DistinctValues, 
sum(case when a16.lev_3_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.lev_3_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.lev_3_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_3_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.lev_3_key  )) then 'Failed'  
when ((sum(case when a16.lev_3_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_3_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.lev_3_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level3       a128
on (a16.lev_3_key = a128.row_key)
UNION 
select 'lev_4_key '   as Table_Name, 
COUNT(a16.lev_4_key ) AS TotalRows,
COUNT(DISTINCT a16.lev_4_key  ) AS DistinctValues, 
sum(case when a16.lev_4_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a16.lev_4_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a16.lev_4_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_4_key  =0 THEN 1 ELSE 0 END ))= COUNT( a16.lev_4_key  )) then 'Failed'  
when ((sum(case when a16.lev_4_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a16.lev_4_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a16.lev_4_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_internal_organization_group       a15
on (a11.assignment_group_key = a15.row_key)
join ldb.dh_user_group_hierarchy       a16
on (a15.row_dn_key = a16.lev_0_key)
join ldb.dh_user_group_level4       a130
on (a16.lev_4_key = a130.row_key)
UNION 
select 'criticality_key '   as Table_Name, 
COUNT(a17.criticality_key ) AS TotalRows,
COUNT(DISTINCT a17.criticality_key  ) AS DistinctValues, 
sum(case when a17.criticality_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.criticality_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.criticality_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.criticality_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.criticality_key  )) then 'Failed'  
when ((sum(case when a17.criticality_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.criticality_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.criticality_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_criticality       a123
on (a17.criticality_key = a123.row_key)
UNION 
select 'used_for_src_key '   as Table_Name, 
COUNT(a17.used_for_src_key ) AS TotalRows,
COUNT(DISTINCT a17.used_for_src_key  ) AS DistinctValues, 
sum(case when a17.used_for_src_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a17.used_for_src_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a17.used_for_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.used_for_src_key  =0 THEN 1 ELSE 0 END ))= COUNT( a17.used_for_src_key  )) then 'Failed'  
when ((sum(case when a17.used_for_src_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a17.used_for_src_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a17.used_for_src_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11
join ldb.d_business_service       a17
on (a11.business_service_key = a17.row_key)
join ldb.d_business_service_used_for       a124
on (a17.used_for_src_key = a124.row_key)
UNION 
select 'month_start_date_key '   as Table_Name, 
COUNT(a18.month_start_date_key ) AS TotalRows,
COUNT(DISTINCT a18.month_start_date_key  ) AS DistinctValues, 
sum(case when a18.month_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a18.month_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a18.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.month_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a18.month_start_date_key  )) then 'Failed'  
when ((sum(case when a18.month_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.month_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a18.month_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_month       a127
on (a18.month_start_date_key = a127.row_key)
UNION 
select 'quarter_start_date_key '   as Table_Name, 
COUNT(a18.quarter_start_date_key ) AS TotalRows,
COUNT(DISTINCT a18.quarter_start_date_key  ) AS DistinctValues, 
sum(case when a18.quarter_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a18.quarter_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a18.quarter_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.quarter_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a18.quarter_start_date_key  )) then 'Failed'  
when ((sum(case when a18.quarter_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.quarter_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a18.quarter_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_quarter       a129
on (a18.quarter_start_date_key = a129.row_key)
UNION 
select 'year_start_date_key '   as Table_Name, 
COUNT(a18.year_start_date_key ) AS TotalRows,
COUNT(DISTINCT a18.year_start_date_key  ) AS DistinctValues, 
sum(case when a18.year_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a18.year_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a18.year_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.year_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a18.year_start_date_key  )) then 'Failed'  
when ((sum(case when a18.year_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.year_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a18.year_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_year       a131
on (a18.year_start_date_key = a131.row_key)
UNION 
select 'week_start_date_key '   as Table_Name, 
COUNT(a18.week_start_date_key ) AS TotalRows,
COUNT(DISTINCT a18.week_start_date_key  ) AS DistinctValues, 
sum(case when a18.week_start_date_key = -1 THEN 1   ELSE 0 END) as UnknownRecords, 
sum(case when a18.week_start_date_key =0 THEN 1 ELSE 0 END ) as UnspecifiedRecords,
case when ((sum(case when a18.week_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.week_start_date_key  =0 THEN 1 ELSE 0 END ))= COUNT( a18.week_start_date_key  )) then 'Failed'  
when ((sum(case when a18.week_start_date_key  = -1 THEN 1   ELSE 0 END)  + sum(case when a18.week_start_date_key  =0 THEN 1 ELSE 0 END ))> 0.8*COUNT( a18.week_start_date_key  )) then 'Failed' else 'Success' end as compare
from  ldb.f_problem       a11 
join ldb.d_calendar_date       a18
on (a11.opened_on_key = a18.row_key)
join ldb.d_calendar_week       a125
on (a18.week_start_date_key = a125.row_key)

