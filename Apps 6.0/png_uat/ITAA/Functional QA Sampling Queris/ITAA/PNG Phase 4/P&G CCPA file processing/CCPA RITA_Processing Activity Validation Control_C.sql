Tables Accessed:
d_calendar_date
d_calendar_month
d_calendar_quarter
d_calendar_year
d_lov_ccpa_processing_activities_data_subject_type_c
d_lov_ccpa_processing_activities_ot_life_cycle_status_c
d_png_ccpa_processing_activities_inventory_c
d_png_ot_ccpa_compliance_control_c
d_png_ot_ccpa_validation_control_c
d_processing_activities_ccpa_age_class_c
d_processing_activities_ccpa_owning_organization_c
f_png_ot_ccpa_validation_control_c


SQL Statements:

set query_group to 'MSTRReport=CCPA RITA_Processing Activity Validation Control_C;'

CREATE TEMPORARY TABLE ZZMD00 as
select	a11.ccpa_validation_control_key AS row_key,
	a13.month_start_date_key AS month_start_date_key,
	a11.png_ot_ccpa_numerita_c_key AS row_key0,
	a12.control_super_status_c AS control_super_status_c,
	a12.control_result_c AS control_result_c,
	a12.control_in_scope_c AS control_in_scope_c,
	a11.ccpa_validation_control_key AS row_key1,
	max(a11.ccpa_processing_activites_c) AS WJXBFS1,
	count(a11.ccpa_total_tests_c) AS WJXBFS2,
	(CASE WHEN max((CASE WHEN a12.control_in_scope_c = 'TRUE' THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN a12.control_in_scope_c = 'TRUE' THEN a11.ccpa_total_tests_c ELSE NULL END)) ELSE NULL END) AS WJXBFS3,
	(CASE WHEN max((CASE WHEN (a12.control_in_scope_c = 'TRUE' and a12.control_super_status_c = 'OK') THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN (a12.control_in_scope_c = 'TRUE' and a12.control_super_status_c = 'OK') THEN a11.ccpa_total_tests_c ELSE NULL END)) ELSE NULL END) AS WJXBFS4
from	ldb.f_png_ot_ccpa_validation_control_c	a11
	join	ldb.d_png_ot_ccpa_validation_control_c	a12
	  on 	(a11.png_ot_ccpa_numerita_c_key = a12.ot_ccpa_pa_inventory_c_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.date_key = a13.row_key)
group by	a11.ccpa_validation_control_key,
	a13.month_start_date_key,
	a11.png_ot_ccpa_numerita_c_key,
	a12.control_super_status_c,
	a12.control_result_c,
	a12.control_in_scope_c,
	a11.ccpa_validation_control_key 

CREATE TEMPORARY TABLE ZZMD01 as
select	a11.ccpa_validation_control_key AS row_key,
	a13.month_start_date_key AS month_start_date_key,
	a11.png_ot_ccpa_numerita_c_key AS row_key0,
	a12.control_super_status_c AS control_super_status_c,
	a12.control_result_c AS control_result_c,
	a12.control_in_scope_c AS control_in_scope_c,
	a11.ccpa_validation_control_key AS row_key1,
	max(a11.ccpa_processing_activites_c) AS WJXBFS1,
	(CASE WHEN max((CASE WHEN a12.control_in_scope_c = 'TRUE' THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN a12.control_in_scope_c = 'TRUE' THEN a11.ccpa_total_tests_c ELSE NULL END)) ELSE NULL END) AS WJXBFS2,
	(CASE WHEN max((CASE WHEN (a12.control_in_scope_c = 'TRUE' and a12.control_super_status_c in ('Not OK', 'UNSPECIFIED')) THEN 1 ELSE 0 END)) = 1 THEN count((CASE WHEN (a12.control_in_scope_c = 'TRUE' and a12.control_super_status_c in ('Not OK', 'UNSPECIFIED')) THEN a11.ccpa_total_tests_c ELSE NULL END)) ELSE NULL END) AS WJXBFS3
from	ldb.f_png_ot_ccpa_validation_control_c	a11
	join	ldb.d_png_ot_ccpa_validation_control_c	a12
	  on 	(a11.png_ot_ccpa_numerita_c_key = a12.ot_ccpa_pa_inventory_c_key)
	join	ldb.d_calendar_date	a13
	  on 	(a11.date_key = a13.row_key)
	join	ldb.d_png_ccpa_processing_activities_inventory_c	a14
	  on 	(a11.png_ot_ccpa_numerita_c_key = a14.row_key)
	join	ldb.d_processing_activities_ccpa_age_class_c	a15
	  on 	(a14.ccpa_age_class_c_key = a15.row_key)
where	a15.dimension_name = 'C'
group by	a11.ccpa_validation_control_key,
	a13.month_start_date_key,
	a11.png_ot_ccpa_numerita_c_key,
	a12.control_super_status_c,
	a12.control_result_c,
	a12.control_in_scope_c,
	a11.ccpa_validation_control_key 

select	a110.ccpa_age_class_c_key AS row_key,
	max(a115.dimension_name) AS dimension_name,
	a110.ot_ccpa_life_cycle_status_c_key AS row_key0,
	max(a116.source_dimension_name) AS source_dimension_name,
	coalesce(pa11.control_in_scope_c, pa12.control_in_scope_c) AS control_in_scope_c,
	coalesce(pa11.control_super_status_c, pa12.control_super_status_c) AS control_super_status_c,
	coalesce(pa11.month_start_date_key, pa12.month_start_date_key) AS month_start_date_key,
	max(a113.month_year) AS month_name,
	a114.year_start_date_key AS row_key1,
	max(a118.year_name) AS year_name,
	coalesce(pa11.row_key0, pa12.row_key0) AS row_key2,
	max(a110.title_c) AS title_c,
	coalesce(pa11.row_key, pa12.row_key) AS row_key3,
	coalesce(pa11.control_result_c, pa12.control_result_c) AS control_result_c,
	a110.data_subject_type_c_key AS row_key4,
	max(a112.source_dimension_name) AS source_dimension_name0,
	a111.order_c AS order_c,
	max(a111.compliance_control_order_c) AS compliance_control_order_c,
	a110.ccpa_owning_organization_c_key AS row_key5,
	max(a117.organization_name) AS organization_name,
	a110.owning_grouping_c AS owning_grouping_c,
	coalesce(pa11.row_key1, pa12.row_key1) AS row_key6,
	max(a111.compliance_control_c) AS compliance_control_c,
	a112.wh_dimension_code AS wh_dimension_name,
	max(pa11.WJXBFS1) AS WJXBFS1,
	max(pa12.WJXBFS1) AS WJXBFS2,
	max(pa11.WJXBFS3) AS WJXBFS4,
	max(pa12.WJXBFS2) AS WJXBFS5,
	max(pa11.WJXBFS2) AS WJXBFS6,
	max(pa11.WJXBFS4) AS WJXBFS8,
	max(pa12.WJXBFS3) AS WJXBFS9
from	ZZMD00	pa11
	full outer join	ZZMD01	pa12
	  on 	(pa11.control_in_scope_c = pa12.control_in_scope_c and 
	pa11.control_result_c = pa12.control_result_c and 
	pa11.control_super_status_c = pa12.control_super_status_c and 
	pa11.month_start_date_key = pa12.month_start_date_key and 
	pa11.row_key = pa12.row_key and 
	pa11.row_key0 = pa12.row_key0 and 
	pa11.row_key1 = pa12.row_key1)
	join	ldb.d_png_ccpa_processing_activities_inventory_c	a110
	  on 	(coalesce(pa11.row_key0, pa12.row_key0) = a110.row_key)
	join	ldb.d_png_ot_ccpa_compliance_control_c	a111
	  on 	(coalesce(pa11.row_key1, pa12.row_key1) = a111.row_key)
	join	ldb.d_lov_ccpa_processing_activities_data_subject_type_c	a112
	  on 	(a110.data_subject_type_c_key = a112.row_key)
	join	ldb.d_calendar_month	a113
	  on 	(coalesce(pa11.month_start_date_key, pa12.month_start_date_key) = a113.row_key)
	join	ldb.d_calendar_quarter	a114
	  on 	(a113.quarter_start_date_key = a114.row_key)
	join	ldb.d_processing_activities_ccpa_age_class_c	a115
	  on 	(a110.ccpa_age_class_c_key = a115.row_key)
	join	ldb.d_lov_ccpa_processing_activities_ot_life_cycle_status_c	a116
	  on 	(a110.ot_ccpa_life_cycle_status_c_key = a116.row_key)
	join	ldb.d_processing_activities_ccpa_owning_organization_c	a117
	  on 	(a110.ccpa_owning_organization_c_key = a117.row_key)
	join	ldb.d_calendar_year	a118
	  on 	(a114.year_start_date_key = a118.row_key)
group by	a110.ccpa_age_class_c_key,
	a110.ot_ccpa_life_cycle_status_c_key,
	coalesce(pa11.control_in_scope_c, pa12.control_in_scope_c),
	coalesce(pa11.control_super_status_c, pa12.control_super_status_c),
	coalesce(pa11.month_start_date_key, pa12.month_start_date_key),
	a114.year_start_date_key,
	coalesce(pa11.row_key0, pa12.row_key0),
	coalesce(pa11.row_key, pa12.row_key),
	coalesce(pa11.control_result_c, pa12.control_result_c),
	a110.data_subject_type_c_key,
	a111.order_c,
	a110.ccpa_owning_organization_c_key,
	a110.owning_grouping_c,
	coalesce(pa11.row_key1, pa12.row_key1),
	a112.wh_dimension_code
