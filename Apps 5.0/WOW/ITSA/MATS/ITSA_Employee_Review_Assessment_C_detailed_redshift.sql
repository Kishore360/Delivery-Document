select 'ldb.f_employee_review_assessment_c a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
union
select 'ldb.d_internal_contact a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) 
union
select 'ldb.d_employee_review_assessments_c a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_employee_review_assessments_c a13 
on (a11.employee_review_assessments_c_key = a13.row_key) 
union
select 'ldb.d_calendar_date a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_calendar_date a14 
on (a11.employee_review_created_on_c_key = a14.row_key) 
union
select 'ldb.d_employee_review_c a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_employee_review_c a15 
on (a11.employee_review_c_key = a15.row_key) 
union
select 'ldb.dh_employee_hierarchy a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) 
join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
union
select 'ldb.d_internal_contact_level_1_manager_c a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) 
join ldb.d_internal_contact_level_1_manager_c a17 
on (a12.employee_manager_c_key = a17.row_key) 
union
select 'ldb.d_internal_contact_mdm a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) 
join ldb.d_internal_contact_mdm a18 
on (a12.row_current_key = a18.row_current_key) 
union
select 'ldb.d_employee_location_c a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.d_internal_contact_mdm a18 
on (a12.row_current_key = a18.row_current_key) 
join ldb.d_employee_location_c a19 
on (a18.location_key = a19.row_key) 
union
select 'ldb.dh_employee_level1 a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level1 a110 
on (a16.lev_1_key = a110.row_key) 
union
select 'ldb.dh_employee_level2 a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level2 a111 
on (a16.lev_2_key = a111.row_key) 
union
select 'ldb.dh_employee_level3 a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level3 a112 
on (a16.lev_3_key = a112.row_key) 
union
select 'ldb.dh_employee_level4 a113 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level4 a113 
on (a16.lev_4_key = a113.row_key) 
union
select 'ldb.dh_employee_level5 a114 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level5 a114 
on (a16.lev_5_key = a114.row_key) 
union
select 'ldb.dh_employee_level6_c a115 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level6_c a115 
on (a16.lev_6_key = a115.row_key) 
union
select 'ldb.dh_employee_level7_c a116 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.dh_employee_hierarchy a16 
on (a12.row_current_key = a16.lev_0_key) 
join ldb.dh_employee_level7_c a116 
on (a16.lev_7_key = a116.row_key) 
union
select 'ldb.d_assessment_metrics_c a117 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_assessment_metrics_c a117 
on (a11.assessment_metrics_c_key = a117.row_key) 
union
select 'ldb.d_internal_contact_appraiser_c a118 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact_appraiser_c a118 
on (a11.appraiser_c_key = a118.row_key) 
union
select 'ldb.d_lov_employee_review_asmt_state_c a119 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_employee_review_assessments_c a13 
on (a11.employee_review_assessments_c_key = a13.row_key) 
join ldb.d_lov_employee_review_asmt_state_c a119 
on (a13.employee_review_amst_state_src_c_key = a119.row_key) 
union
select 'ldb.d_calendar_month a120 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_calendar_date a14 
on (a11.employee_review_created_on_c_key = a14.row_key) 
join ldb.d_calendar_month a120 
on (a14.month_start_date_key = a120.row_key) 
union
select 'ldb.d_internal_organization_department_c a121 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) 
join ldb.d_internal_organization_department_c a121 
on (a12.department_key = a121.row_key) 
union
select 'ldb.d_lov_employee_review_state_c a122 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_employee_review_c a15 
on (a11.employee_review_c_key = a15.row_key) 
join ldb.d_lov_employee_review_state_c a122 
on (a15.employee_review_state_src_c_key = a122.row_key) 
union
select 'ldb.d_lov_location_area_c a123 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.d_internal_contact_mdm a18 
on (a12.row_current_key = a18.row_current_key) join ldb.d_employee_location_c a19 
on (a18.location_key = a19.row_key) 
join ldb.d_lov_location_area_c a123 
on (a19.location_area_c_key = a123.row_key) 
union
select 'ldb.d_lov_metric_scale_c a124 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_assessment_metrics_c a117 
on (a11.assessment_metrics_c_key = a117.row_key) 
join ldb.d_lov_metric_scale_c a124 
on (a117.metric_scale_src_c_key = a124.row_key) 
union
select 'ldb.d_calendar_year a125 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_calendar_date a14 
on (a11.employee_review_created_on_c_key = a14.row_key) 
join ldb.d_calendar_year a125 
on (a14.year_start_date_key = a125.row_key) 
union
select 'ldb.d_internal_contact_level_2_manager_c a126 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_employee_review_assessment_c a11 
join ldb.d_internal_contact a12 
on (a11.appraisee_c_key = a12.row_key) join ldb.d_internal_contact_level_1_manager_c a17 
on (a12.employee_manager_c_key = a17.row_key) 
join ldb.d_internal_contact_level_2_manager_c a126 
on (a17.employee_manager_c_key = a126.row_key) 
