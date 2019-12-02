select 'ldb.f_case a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
union
select 'ldb.d_internal_contact a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_internal_contact a122 
on (a11.assigned_to_key = a122.row_key) 
union
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
union
select 'ldb.d_calendar_month a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
union
select 'ldb.d_calendar_quarter a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) 
join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
union
select 'ldb.d_calendar_week a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) 
join ldb.d_calendar_week a15 
on (a12.week_start_date_key = a15.row_key) 
union
select 'ldb.d_calendar_year a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date a12 
on (a11.opened_on_key = a12.row_key) join ldb.d_calendar_month a13 
on (a12.month_start_date_key = a13.row_key) join ldb.d_calendar_quarter a14 
on (a13.quarter_start_date_key = a14.row_key) 
join ldb.d_calendar_year a16 
on (a14.year_start_date_key = a16.row_key) 
union
select 'ldb.d_case dc ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
union
select 'ldb.d_case_overall_sla_flag a166 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_overall_sla_flag a166 
on (dc.overall_sla_outcome_flag_key = a166.row_key) 
union
select 'ldb.d_case_state a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_state a155 
on (dc.state_src_key = a155.row_key) 
union
select 'ldb.d_service_contract a144 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_service_contract a144 
on (a11.service_contract_key = a144.row_key) 
union
select 'ldb.d_service_contract_state a156 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_service_contract a144 
on (a11.service_contract_key = a144.row_key) 
join ldb.d_service_contract_state a156 
on (a144.state_src_key = a156.row_key) 
union
select 'ldb.d_calendar_date_previous_year_previous_month_c a1223 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_calendar_date_previous_year_previous_month_c a1223 
on (a11.opened_on_key = a1223.previous_month_previous_year_date_key) 
union
select 'ldb.d_business_service a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_service a123 
on (a11.business_service_key = a123.row_key) 
union
select 'ldb.d_business_service_criticality a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_service a123 
on (a11.business_service_key = a123.row_key) 
join ldb.d_business_service_criticality a139 
on (a123.criticality_key = a139.row_key) 
union
select 'ldb.d_business_service_used_for a145 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_service a123 
on (a11.business_service_key = a123.row_key) 
join ldb.d_business_service_used_for a145 
on (a123.used_for_src_key = a145.row_key) 
union
select 'ldb.d_case_approval a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_approval a135 
on (dc.approval_state_src_key = a135.row_key) 
union
select 'ldb.d_case_category a146 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_category a146 
on (dc.category_src_key = a146.row_key) 
union
select 'ldb.d_case_impact a1500 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_impact a1500 
on (dc.impact_src_key = a1500.row_key) 
union
select 'ldb.d_case_overall_sla_flag a1600 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_overall_sla_flag a1600 
on (dc.overall_sla_outcome_flag_key = a1600.row_key) 
union
select 'ldb.d_case_priority a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_priority a17 
on (dc.priority_src_key = a17.row_key) 
union
select 'ldb.d_case_sla_resolution_flag a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_sla_resolution_flag a18 
on (dc.met_resolution_sla_flag_key = a18.row_key) 
union
select 'ldb.d_case_sla_response_flag a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_sla_response_flag a19 
on (dc.met_response_sla_flag_key = a19.row_key) 
union
select 'ldb.d_case_state a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_state a110 
on (dc.state_src_key = a110.row_key) 
union
select 'ldb.d_case_subcategory a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_subcategory a111 
on (dc.sub_category_src_key = a111.row_key) 
union
select 'ldb.d_case_urgency a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_urgency a112 
on (dc.urgency_src_key = a112.row_key) 
union
select 'ldb.d_case_reported_type a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_case dc 
on (a11.case_key = dc.row_key) 
join ldb.d_case_reported_type a113 
on (dc.reported_type_src_key = a113.row_key) 
union
select 'ldb.d_customer_service_taxonomy_c a12233 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_customer_service_taxonomy_c a12233 
on (a11.customer_service_taxonomy_c_key = a12233.row_key) 
union
select 'ldb.d_business_unit_banner_c a1222 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_business_unit_banner_c a1222 
on (a11.business_unit_banner_c_key = a1222.row_key)-- Good till here 
union
select 'ldb.d_configuration_item a1225 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_configuration_item a1225 
on (a11.configuration_item_key = a1225.row_key) 
union
select 'ldb.d_consumer_case a1201 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_consumer_case a1201 
on (a11.consumer_case_key = a1201.row_key) 
union
select 'ldb.d_customer a1226 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_customer a1226 
on (a11.customer_account_key = a1226.row_key) 
union
select 'ldb.d_customer_mdm a1300 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_customer a1226 
on (a11.customer_account_key = a1226.row_key) 
join ldb.d_customer_mdm a1300 
on (a1226.customer_mdm_key = a1300.row_key) 
union
select 'ldb.d_location a1227 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_location a1227 
on (a11.location_key = a1227.row_key) 
union
select 'ldb.d_internal_organization_group a1228 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_internal_organization_group a1228 
on (a11.assignment_group_key = a1228.row_key) 
union
select 'ldb.d_asset a1229 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_case a11 
join ldb.d_asset a1229 
on (a11.asset_key = a1229.row_key) 
