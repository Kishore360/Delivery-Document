select 'ldb.f_request_item' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_item       a11 
union
select'ldb.d_internal_contact_cost_center_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_item       a11 
left outer join ldb.d_internal_contact_cost_center_c       a16
on (a11.requested_for_key=a16.row_key)
union
select'ldb.d_request_item_hardware_status_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_item       a11 
 left outer join ldb.d_request_item       a14
on (a11.request_item_key=a14.row_key)
left outer join ldb.d_request_item_hardware_status_c       a17
on (a14.row_key=a17.row_key)
union
select'ldb.d_internal_organization_primary_group_c' as Table_Name, count(a11.row_key) Row_Count
from  ldb.f_request_item       a11 
 left outer join ldb.d_internal_contact       a12
on (a11.opened_by_key=a12.row_key)
left outer join ldb.d_internal_organization_primary_group_c       a120
on (a12.internal_organization_group_key=a120.row_key)
