
SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'cust has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(cnt) max_count,Min(cnt) min_count from (
select 'd_configuration_item_application_c' as table_name , count(a11.row_key) as cnt 
from ldb.f_incident a11
join ldb.d_configuration_item_application_c a112
on (a11.configuration_item_application_c_key = a112.row_key)
union all
select 'd_internal_contact_manager_c' as table_name , count(a11.row_key) as cnt 
from ldb.f_incident a11	
join ldb.d_internal_organization_group a17
on (a11.assignment_group_key = a17.row_key)
join ldb.d_internal_contact_manager_c a131
on (a17.manager_c_key = a131.row_key)
union all
select 'd_internal_contact_reported_by_c' as table_name , count(a11.row_key) as cnt
from ldb.f_incident a11
join ldb.d_internal_contact_reported_by_c a125
on (a11.reported_by_c_key = a125.row_key)
union all
select 'd_portfolio_owner_c' as table_name , count(a11.row_key) as cnt from
ldb.f_incident a11
join ldb.d_configuration_item a110
on (a11.configuration_item_key = a110.row_key)
join ldb.d_portfolio_owner_c a133
on (a110.portfolio_owner_c_key = a133.row_key)
union all
select 'd_incident_outage_type_c' as table_name , count(a11.row_key) as cnt from
ldb.f_incident a11
join ldb.d_incident_outage_type_c a123
on (a11.outage_type_c_key = a123.row_key)
)a
)b