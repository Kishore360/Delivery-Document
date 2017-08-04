select 'ldb.f_project_task a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
union
select 'ldb.d_project a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
union
select 'ldb.d_project_top_project a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_project_top_project a13 
on (a12.top_project_key = a13.row_key) 
union
select 'ldb.d_calendar_date_fiscal a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.planned_start_on_fiscal_c_key = a14.row_key) 
union
select 'ldb.d_project_parent_project a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_project_parent_project a15 
on (a12.parent_project_key = a15.row_key) 
union
select 'ldb.d_portfolio a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) join ldb.d_project_top_project a13 
on (a12.top_project_key = a13.row_key) 
join ldb.d_portfolio a16 
on (a13.portfolio_key = a16.row_key) 
union
select 'ldb.d_lov_project_state_view a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_state_view a17 
on (a12.project_state_src_key = a17.row_key) 
union
select 'ldb.d_application a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_application a18 
on (a11.application_key = a18.row_key) 
union
select 'ldb.d_business_service a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_business_service a19 
on (a11.business_service_key = a19.row_key) 
union
select 'ldb.d_internal_organization_legalentity a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_internal_organization_legalentity a110 
on (a11.company_key = a110.row_key) 
union
select 'ldb.d_configuration_item a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_configuration_item a111 
on (a11.configuration_item_key = a111.row_key) 
union
select 'ldb.d_lov_project_cost_variance_bucket_view a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_lov_project_cost_variance_bucket_view a112 
on (a11.cost_variance_color_key = a112.row_key) 
union
select 'ldb.d_domain a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_domain a113 
on (a11.domain_key = a113.row_key) 
union
select 'ldb.d_lov_project_effort_variance_bucket_view a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_lov_project_effort_variance_bucket_view a114 
on (a11.effort_variance_color_key = a114.row_key) 
union
select 'ldb.d_location a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_location a115 
on (a11.location_key = a115.row_key) 
union
select 'ldb.d_lov_project_class_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_lov_project_class_c a116 
on (a11.project_class_c_key = a116.row_key) 
union
select 'ldb.d_internal_contact_project_executive_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_internal_contact_project_executive_c a117 
on (a11.project_executive_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact_project_funding_sponsor_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_internal_contact_project_funding_sponsor_c a118 
on (a11.project_funding_sponsor_c_key = a118.row_key) 
union
select 'ldb.d_lov_project_health_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_lov_project_health_c a119 
on (a11.project_health_color_c_key = a119.row_key) 
union
select 'ldb.d_internal_contact_project_outcome_sponsor_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_internal_contact_project_outcome_sponsor_c a121 
on (a11.project_outcome_sponsor_c_key = a121.row_key) 
union
select 'ldb.d_lov_project_weeks_to_due_date_bucket_view a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_lov_project_weeks_to_due_date_bucket_view a122 
on (a11.weeks_to_due_date_bucket_key = a122.row_key) 
union
select 'ldb.d_internal_contact_project_technical_lead_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_internal_contact_project_technical_lead_c a123 
on (a11.project_technical_lead_c_key = a123.row_key) 
union
select 'ldb.d_lov_project_schedule_variance_bucket_view a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_lov_project_schedule_variance_bucket_view a124 
on (a11.schedule_variance_color_key = a124.row_key) 
union
select 'ldb.d_calendar_fiscal_period a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.planned_start_on_fiscal_c_key = a14.row_key) 
join ldb.d_calendar_fiscal_period a125 
on (a14.period_start_date_key = a125.row_key) 
union
select 'ldb.d_lov_project_approval_view a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_approval_view a126 
on (a12.project_approval_src_key = a126.row_key) 
union
select 'ldb.d_lov_project_contact_type_view a127 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_contact_type_view a127 
on (a12.project_contact_type_src_key = a127.row_key) 
union
select 'ldb.d_lov_project_escalation_view a128 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_escalation_view a128 
on (a12.project_escalation_src_key = a128.row_key) 
union
select 'ldb.d_lov_project_impact_view a129 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_impact_view a129 
on (a12.project_impact_src_key = a129.row_key) 
union
select 'ldb.d_lov_project_phase_view a130 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_phase_view a130 
on (a12.project_phase_src_key = a130.row_key) 
union
select 'ldb.d_lov_project_phase_type_view a131 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_phase_type_view a131 
on (a12.project_phase_type_src_key = a131.row_key) 
union
select 'ldb.d_lov_project_priority_view a132 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_priority_view a132 
on (a12.project_priority_src_key = a132.row_key) 
union
select 'ldb.d_lov_project_risk_view a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_risk_view a133 
on (a12.project_risk_src_key = a133.row_key) 
union
select 'ldb.d_lov_project_urgency_view a134 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) 
join ldb.d_lov_project_urgency_view a134 
on (a12.project_urgency_src_key = a134.row_key) 
union
select 'ldb.d_accountable_division_c a135 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) join ldb.d_project_top_project a13 
on (a12.top_project_key = a13.row_key) 
join ldb.d_accountable_division_c a135 
on (a13.accountable_division_c_key = a135.row_key) 
union
select 'ldb.d_calendar_fiscal_quarter a136 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.planned_start_on_fiscal_c_key = a14.row_key) 
join ldb.d_calendar_fiscal_quarter a136 
on (a14.quarter_start_date_key = a136.row_key) 
union
select 'ldb.d_project_program_c a137 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) join ldb.d_project_top_project a13 
on (a12.top_project_key = a13.row_key) 
join ldb.d_project_program_c a137 
on (a13.project_program_c_key = a137.row_key) 
union
select 'ldb.d_calendar_fiscal_year a138 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_calendar_date_fiscal a14 
on (a11.planned_start_on_fiscal_c_key = a14.row_key) 
join ldb.d_calendar_fiscal_year a138 
on (a14.year_start_date_key = a138.row_key) 
union
select 'ldb.d_lov_portfolio_category_view a139 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_project_task a11 
join ldb.d_project a12 
on (a11.project_key = a12.row_key) join ldb.d_project_top_project a13 
on (a12.top_project_key = a13.row_key) join ldb.d_portfolio a16 
on (a13.portfolio_key = a16.row_key) 
join ldb.d_lov_portfolio_category_view a139 
on (a16.portfolio_category_src_key = a139.row_key) 
