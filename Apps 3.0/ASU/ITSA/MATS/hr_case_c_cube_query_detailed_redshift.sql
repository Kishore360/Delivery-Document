select 'f_hr_case_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
union
select  'd_hr_case_c' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_hr_case_c   b
on   a.hr_case_c_key = b.row_key
union
select  'd_calendar_date' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_calendar_date   b
on   a.opened_on_key = b.row_key
union
select  'd_internal_organization' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_internal_organization   b
on   a.assignment_group_key= b.row_key
union
select  'd_internal_organization' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_internal_organization   b
on   a.assignment_group_key= b.row_key
union
select  'd_lov 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_hr_case_c   b
on   a.hr_case_c_key = b.row_key
join asu_mdwdb.d_lov c
on b.customer_type_src_c_key = c.row_key
union
select  'd_lov 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_hr_case_c   b
on   a.hr_case_c_key = b.row_key
join asu_mdwdb.d_lov c
on b.contact_type_src_c_key = c.row_key
union
select  'd_calendar_date 1' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_calendar_date   b
on   a.opened_on_key = b.row_key
union
select  'd_lov 3' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_lov    b
on   a.dormancy_age_key = b.row_key
union
select  'd_lov 4' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_lov    b
on   a.age_key = b.row_key
union
select  'd_internal_contact' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_internal_contact    b
on   a.closed_by_key = b.row_key
union
select  'd_calendar_date 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_calendar_date    b
on   a.closed_on_key  = b.row_key
union
select  'd_internal_contact 1 ' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_internal_contact    b
on   a.opened_for_key  = b.row_key
union
select  'd_internal_contact 2' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  asu_mdwdb.d_internal_contact    b
on   a.opened_by_key  = b.row_key
union
select  'd_lov 5' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_hr_case_c   b
on   a.hr_case_c_key = b.row_key
join asu_mdwdb.d_lov c
on b.state_src_key = c.row_key
union
select  'd_lov 6' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_hr_case_c   b
on   a.hr_case_c_key = b.row_key
join asu_mdwdb.d_lov c
on b.sub_category_src_key = c.row_key
union
select  'd_lov 7' as Table_Name,count(a.row_key) Row_Count
from ldb.f_hr_case_c    a
join  ldb.d_hr_case_c   b
on   a.hr_case_c_key = b.row_key
join asu_mdwdb.d_lov c
on b.category_src_key = c.row_key