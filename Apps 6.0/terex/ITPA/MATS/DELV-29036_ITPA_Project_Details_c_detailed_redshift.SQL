select 'ldb."f_project" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
union
select 'ldb."D_PROJECT" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
union
select 'ldb."D_PROJECT_SEGMENT_GROUP_C" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."D_PROJECT_SEGMENT_GROUP_C" a13
on (a12.SEGMENT_GROUP_C_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_organization_legalentity" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."d_internal_organization_legalentity" a14
on (a11.COMPANY_KEY = a14.ROW_KEY)
union
select 'ldb."d_internal_contact_project_manager" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."d_internal_contact_project_manager" a15
on (a11.project_manager_key = a15.ROW_KEY)
union
select 'ldb."d_planview_project_department_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."d_planview_project_department_c" a16
on (a12.PLANVIEW_PROJECT_DEPARTMENT_C_KEY = a16.ROW_KEY)
union
select 'ldb."d_project_business_objective_c" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."d_project_business_objective_c" a17
on (a12.PROJECT_BUSINESS_OBJECTIVE_C_KEY = a17.ROW_KEY)
union
select 'ldb."d_project_category" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."d_project_category" a18
on (a12.PROJECT_CATEGORY_SRC_KEY = a18.ROW_KEY)
union
select 'ldb."d_lov_project_phase_view" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."d_lov_project_phase_view" a19
on (a12.PROJECT_PHASE_SRC_KEY = a19.ROW_KEY)
union
select 'ldb."d_project_segment_c" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."d_project_segment_c" a110
on (a12.PROJECT_SEGMENT_C_KEY = a110.ROW_KEY)
union
select 'ldb."d_lov_project_state_view" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_project" a11
join "ldb"."D_PROJECT" a12
on (a11.PROJECT_KEY = a12.ROW_KEY)
join "ldb"."d_lov_project_state_view" a111
on (a12.PROJECT_STATE_SRC_KEY = a111.ROW_KEY)