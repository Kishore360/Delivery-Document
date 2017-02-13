select 'ldb.f_change_effectiveness_scorecard_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11
union all
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_internal_organization_group a12 
on a11.assignment_group_key = a12.row_key
union all
select 'ldb.ldb.d_assignment_group_level0_manager_c_relation a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_assignment_group_level0_manager_c_relation a12 
on a11.assignment_group_key = a12.level0_assigment_group_key
union all
select 'ldb.d_internal_organization_group a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_internal_organization_group a12 
on a11.assignment_group_key = a12.row_key
join ldb.d_internal_contact_emp_seniors_c a13
on a12.manager_c_key  = a13.row_key
union all
select 'ldb.d_calendar_date a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_calendar_month a12 
on a11.month_start_c_key = a12.row_key
union all
select 'ldb.d_score_card_cai_score_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_score_card_cai_score_c a12 
on a11.cai_score_c_key = a12.row_key
union all
select 'ldb.d_score_card_chg_score_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_score_card_chg_score_c a12 
on a11.chg_score_c_key = a12.row_key
union all
select 'ldb.d_score_card_overall_rating_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_score_card_overall_rating_c a12 
on a11.overall_rating_c_key = a12.row_key
union all
select 'ldb.d_score_card_cie_score_c a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_change_effectiveness_scorecard_c a11 
join ldb.d_score_card_cie_score_c a12 
on a11.cie_score_c_key = a12.row_key
;