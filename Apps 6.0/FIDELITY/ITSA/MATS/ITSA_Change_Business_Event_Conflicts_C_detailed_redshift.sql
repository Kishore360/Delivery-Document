select 'ldb."F_CHANGE_BUSINESS_EVENTS_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_BUSINESS_EVENTS_C" a11
union
select 'ldb."d_change_bussiness_event_c" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_BUSINESS_EVENTS_C" a11
join "ldb"."d_change_bussiness_event_c" a12
on (a11.BUSSINESS_EVENT_C_KEY = a12.ROW_KEY)
union
select 'ldb."D_CHANGE_REQUEST" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_BUSINESS_EVENTS_C" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
union
select 'ldb."d_u_fmr_business_even_contact_c" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_BUSINESS_EVENTS_C" a11
join "ldb"."d_change_bussiness_event_c" a12
on (a11.BUSSINESS_EVENT_C_KEY = a12.ROW_KEY)
join "ldb"."d_u_fmr_business_even_contact_c" a14
on (a12.u_business_event_contact_c_key = a14.ROW_KEY)
union
select 'ldb."d_u_fmr_business_event_contact_group_c" a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_BUSINESS_EVENTS_C" a11
join "ldb"."d_change_bussiness_event_c" a12
on (a11.BUSSINESS_EVENT_C_KEY = a12.ROW_KEY)
join "ldb"."d_u_fmr_business_event_contact_group_c" a15
on (a12.u_business_event_contact_group_c_key = a15.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_BUSINESS_EVENTS_C" a11
join "ldb"."D_CHANGE_REQUEST" a13
on (a11.CHANGE_REQUEST_KEY = a13.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a16
on (a13.CHANGE_ENVIRONMENT_SRC_C_KEY = a16.ROW_KEY)