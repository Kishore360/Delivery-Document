select 'f_problem' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
union
select  'd_lov' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  asu_mdwdb.d_lov   b
on  (a.prob_category_1_src_c_key = b.row_key)
UNION
select  'd_lov1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  asu_mdwdb.d_lov   b
on  (a.prob_category_2_src_c_key = b.row_key)
UNION
select  'd_lov2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  asu_mdwdb.d_lov   b
on  (a.prob_category_src_c_key = b.row_key)
UNION
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_problem    a
join  asu_mdwdb.d_internal_contact  b
on  (a.prob_requester_c_key = b.row_key)