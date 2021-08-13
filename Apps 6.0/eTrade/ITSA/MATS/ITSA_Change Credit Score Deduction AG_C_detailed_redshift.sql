/* Tables Accessed:
D_CHANGE_REQUEST
F_CHANGE_CREDIT_SCORE_DETAIL
d_change_request_assignment_group */

select 'ldb."F_CHANGE_CREDIT_SCORE_DETAIL" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_CREDIT_SCORE_DETAIL" a11 
union
select 'ldb."D_CHANGE_REQUEST" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_CREDIT_SCORE_DETAIL" a11 
join "ldb"."D_CHANGE_REQUEST" a12 
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY) 
union
select 'ldb."d_change_request_assignment_group" a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb."F_CHANGE_CREDIT_SCORE_DETAIL" a11 
join "ldb"."D_CHANGE_REQUEST" a12 
on (a11.CHANGE_REQUEST_KEY = a12.ROW_KEY) 
join "ldb"."d_change_request_assignment_group" a13 
on (a12.ASSIGNMENT_GROUP_KEY = a13.ROW_KEY)

