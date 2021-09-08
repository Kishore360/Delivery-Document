select 'ldb.f_task	a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
union
select 'ldb.d_internal_contact	a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
union
select 'ldb.d_calendar_date	a13 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
union
select 'ldb.d_task	a14 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_task	a14 
on (a11.task_key = a14.row_key) 
union
select 'ldb.d_task_approval	a155 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_task	a14 
on (a11.task_key = a14.row_key) 
join	ldb.d_task_approval	a155 
on (a14.approval_src_key = a155.row_key)	
union
select 'ldb.d_task_closed_by	a15 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_closed_by	a15 
on (a12.closed_by_key = a15.row_key) 
union
select 'ldb.d_task_contacttype	a16 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_contacttype	a16 
on (a12.contact_type_src_key = a16.row_key) 
union
select 'ldb.d_task_impact	a17 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_impact	a17 
on (a12.impact_src_key = a17.row_key) 
union
select 'ldb.d_task_opened_by	a18 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_opened_by	a18 
on (a12.opened_by_key = a18.row_key) 
union
select 'ldb.d_task_priority	a19 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_priority	a19 
on (a12.priority_src_key = a19.row_key) 
union
select 'ldb.d_task_state	a110 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_state	a110 
on (a12.state_src_key = a110.row_key) 
union
select 'ldb.d_task_type	a111 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_type	a111 
on (a12.task_type_src_key = a111.row_key) 
union
select 'ldb.d_task_urgency	a112 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_task_urgency	a112 
on (a12.urgency_src_key = a112.row_key) 
union
select 'ldb.d_calendar_month	a166 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_calendar_date	a13 
on (a11.opened_on_key = a13.row_key) 
join	ldb.d_calendar_month	a166 
on (a13.month_start_date_key = a166.row_key) 
union
select 'ldb.d_business_service	a167 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_business_service	a167 
on (a11.business_service_key = a167.row_key) 
union
select 'ldb.d_internal_contact_service_owned_by_c	a133 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_internal_contact	a12 
on (a11.opened_by_key = a12.row_key) 
join	ldb.d_internal_contact_service_owned_by_c	a133 
on (a12.owned_by_c_key = a133.row_key) 
union
select 'ldb.d_configuration_item	a168 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_configuration_item	a168 
on (a11.configuration_item_key = a168.row_key) 
union
select 'ldb.d_location	a169 ' as Table_name, count(a11.row_key) Row_Count
from ldb.f_task	a11 
join	ldb.d_location	a169 
on (a11.location_key = a169.row_key) 
