select 'ldb."F_FMR_TRACK_BUSINESS_UNITS_AFFECTED_C" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_FMR_TRACK_BUSINESS_UNITS_AFFECTED_C" a11
union
select 'ldb."D_CHANGE_REQUEST" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_FMR_TRACK_BUSINESS_UNITS_AFFECTED_C" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
union
select 'ldb."d_track_business_units_affected_c" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_FMR_TRACK_BUSINESS_UNITS_AFFECTED_C" a11
join "ldb"."d_track_business_units_affected_c" a13
on (a11.TRACK_BUSINESS_UNITS_AFFECTED_C_KEY = a13.ROW_KEY)
union
select 'ldb."d_lov_change_environment_c" a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_FMR_TRACK_BUSINESS_UNITS_AFFECTED_C" a11
join "ldb"."D_CHANGE_REQUEST" a12
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY)
join "ldb"."d_lov_change_environment_c" a14
on (a12.CHANGE_ENVIRONMENT_SRC_C_KEY = a14.ROW_KEY)