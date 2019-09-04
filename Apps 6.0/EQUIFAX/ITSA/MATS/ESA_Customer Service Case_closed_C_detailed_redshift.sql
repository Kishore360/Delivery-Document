select 'ldb.f_case_closed	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
union
select 'ldb.d_internal_contact	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_internal_contact	a12 
on (a11.assigned_to_key = a12.row_key) 
union
select 'ldb.d_business_service	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_business_service	a13 
on (a11.business_service_key = a13.row_key) 
union
select 'ldb.d_calendar_date	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_date	a14 
on (a11.opened_on_key = a14.row_key) 
union
select 'ldb.d_calendar_month	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_date	a14 
on (a11.opened_on_key = a14.row_key) 
join	ldb.d_calendar_month	a15 
on (a14.month_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_quarter	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_date	a14 
on (a11.opened_on_key = a14.row_key) join	ldb.d_calendar_month	a15 
on (a14.month_start_date_key = a15.row_key) 
join	ldb.d_calendar_quarter	a16 
on (a15.quarter_start_date_key = a16.row_key) 
union
select 'ldb.d_case	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
union
select 'ldb.d_consumer_case	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_consumer_case	a18 
on (a11.consumer_case_key = a18.row_key) 
union
select 'ldb.d_configuration_item	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_configuration_item	a19 
on (a11.configuration_item_key = a19.row_key) 
union
select 'ldb.d_customer	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_customer	a110 
on (a11.customer_account_key = a110.row_key) 
union
select 'ldb.d_calendar_time	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_time	a111 
on (a11.opened_time_key = a111.row_key) 
union
select 'ldb.d_asset	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_asset	a112 
on (a11.asset_key = a112.row_key) 
union
select 'ldb.d_internal_organization_group	a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_internal_organization_group	a113 
on (a11.assignment_group_key = a113.row_key) 
union
select 'ldb.d_case_partner	a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case_partner	a114 
on (a11.partner_key = a114.row_key) 
union
select 'ldb.d_internal_organization_legalentity	a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_internal_organization_legalentity	a115 
on (a11.company_key = a115.row_key) 
union
select 'ldb.d_contact	a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_contact	a116 
on (a11.contact_key = a116.row_key) 
union
select 'ldb.d_service_contract	a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_service_contract	a117 
on (a11.service_contract_key = a117.row_key) 
union
select 'ldb.d_internal_contact_mdm	a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_internal_contact	a12 
on (a11.assigned_to_key = a12.row_key) 
join	ldb.d_internal_contact_mdm	a118 
on (a12.employee_mdm_key = a118.row_key) 
union
select 'ldb.d_service_entitlement	a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_service_entitlement	a119 
on (a11.service_entitlement_key = a119.row_key) 
union
select 'ldb.d_location	a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_location	a120 
on (a11.location_key = a120.row_key) 
union
select 'ldb.d_product_model	a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_product_model	a121 
on (a11.product_model_key = a121.row_key) 
union
select 'ldb.d_business_service_criticality	a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_business_service	a13 
on (a11.business_service_key = a13.row_key) 
join	ldb.d_business_service_criticality	a122 
on (a13.criticality_key = a122.row_key) 
union
select 'ldb.d_business_service_used_for	a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_business_service	a13 
on (a11.business_service_key = a13.row_key) 
join	ldb.d_business_service_used_for	a123 
on (a13.used_for_src_key = a123.row_key) 
union
select 'ldb.d_calendar_week	a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_date	a14 
on (a11.opened_on_key = a14.row_key) 
join	ldb.d_calendar_week	a124 
on (a14.week_start_date_key = a124.row_key) 
union
select 'ldb.d_case_approval	a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_approval	a125 
on (a17.approval_state_src_key = a125.row_key) 
union
select 'ldb.d_case_category	a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_category	a126 
on (a17.category_src_key = a126.row_key) 
union
select 'ldb.d_case_impact	a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_impact	a127 
on (a17.impact_src_key = a127.row_key) 
union
select 'ldb.d_case_overall_sla_flag	a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_overall_sla_flag	a128 
on (a17.overall_sla_outcome_flag_key = a128.row_key) 
union
select 'ldb.d_case_priority	a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_priority	a129 
on (a17.priority_src_key = a129.row_key) 
union
select 'ldb.d_case_sla_resolution_flag	a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_sla_resolution_flag	a130 
on (a17.met_resolution_sla_flag_key = a130.row_key) 
union
select 'ldb.d_case_sla_response_flag	a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_sla_response_flag	a131 
on (a17.met_response_sla_flag_key = a131.row_key) 
union
select 'ldb.d_case_state	a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_state	a132 
on (a17.state_src_key = a132.row_key) 
union
select 'ldb.d_case_subcategory	a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_subcategory	a133 
on (a17.sub_category_src_key = a133.row_key) 
union
select 'ldb.d_case_urgency	a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_urgency	a134 
on (a17.urgency_src_key = a134.row_key) 
union
select 'ldb.d_case_reported_type	a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_case	a17 
on (a11.case_key = a17.row_key) 
join	ldb.d_case_reported_type	a135 
on (a17.reported_type_src_key = a135.row_key) 
union
select 'ldb.d_customer_mdm	a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_customer	a110 
on (a11.customer_account_key = a110.row_key) 
join	ldb.d_customer_mdm	a136 
on (a110.customer_mdm_key = a136.row_key) 
union
select 'ldb.d_calendar_time_hour	a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_time	a111 
on (a11.opened_time_key = a111.row_key) 
join	ldb.d_calendar_time_hour	a137 
on (a111.hour_key = a137.row_key) 
union
select 'ldb.d_calendar_year	a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case_closed	a11 
join	ldb.d_calendar_date	a14 
on (a11.opened_on_key = a14.row_key) join	ldb.d_calendar_month	a15 
on (a14.month_start_date_key = a15.row_key) join	ldb.d_calendar_quarter	a16 
on (a15.quarter_start_date_key = a16.row_key) 
join	ldb.d_calendar_year	a138 
on (a16.year_start_date_key = a138.row_key) 