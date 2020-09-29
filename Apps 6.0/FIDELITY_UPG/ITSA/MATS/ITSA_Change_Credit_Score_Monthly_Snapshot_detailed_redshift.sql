select 'ldb."n_change_credit_score_monthly" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
union
select 'ldb."d_application" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
union
select 'ldb."d_configuration_item" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
union
select 'ldb."d_internal_organization_group" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
union
select 'ldb."d_assignment_group_manager" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_internal_organization_group" a14
on (a11.ASSIGNMENT_GROUP_KEY = a14.ROW_KEY)
join "ldb"."d_assignment_group_manager" a15
on (a14.assignment_group_manager_key = a15.ROW_KEY)
union
select 'ldb."d_configuration_item_mdm" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_configuration_item" a13
on (a11.CONFIGURATION_ITEM_KEY = a13.ROW_KEY)
join "ldb"."d_configuration_item_mdm" a16
on (a13.mdm_key = a16.ROW_KEY)
union
select 'ldb."d_application_mdm" a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_application" a12
on (a11.APPLICATION_KEY = a12.ROW_KEY)
join "ldb"."d_application_mdm" a17
on (a12.mdm_key = a17.ROW_KEY)
union
select 'ldb."d_internal_contact_assigned_to" a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_internal_contact_assigned_to" a18
on (a11.ASSIGNED_TO_KEY = a18.ROW_KEY)
union
select 'ldb."d_business_service" a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_business_service" a19
on (a11.BUSINESS_SERVICE_KEY = a19.ROW_KEY)
union
select 'ldb."d_calendar_month" a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_calendar_month" a110
on (a11.aggr_month_key = a110.ROW_KEY)
union
select 'ldb."d_internal_organization_department" a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb."n_change_credit_score_monthly" a11
join "ldb"."d_internal_organization_department" a111
on (a11.department_key = a111.ROW_KEY)