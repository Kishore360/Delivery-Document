select  		'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12
on   		    (a11.opened_by_key = a12.row_key)
union

select  		'd_master_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_master_item a13
on   		    (a11.catalog_item_key = a13.row_key)
union

select  		'd_calendar_date_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a14
on   		    (a11.closed_on_key = a14.row_key)
union

select  		'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15
on   		    (a11.opened_on_key = a15.row_key)
union

select  		'd_calendar_month_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a14
on   		    (a11.closed_on_key = a14.row_key)
left outer join ldb.d_calendar_month_closed a16
on   		    (a14.month_start_date_key = a16.row_key)
union

select  		'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15
on   		    (a11.opened_on_key = a15.row_key)
left outer join ldb.d_calendar_month a17
on   		    (a15.month_start_date_key = a17.row_key)
union

select  		'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12
on   		    (a11.opened_by_key = a12.row_key)
union

select  		'd_master_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_master_item a13
on   		    (a11.catalog_item_key = a13.row_key)
union

select  		'd_calendar_date_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a14
on   		    (a11.closed_on_key = a14.row_key)
union

select  		'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15
on   		    (a11.opened_on_key = a15.row_key)
union

select  		'd_request_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_request_item a16
on   		    (a11.request_item_key = a16.row_key)
union

select  		'd_calendar_month_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a14
on   		    (a11.closed_on_key = a14.row_key)
left outer join ldb.d_calendar_month_closed a17
on   		    (a14.month_start_date_key = a17.row_key)
union

select  		'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15
on   		    (a11.opened_on_key = a15.row_key)
left outer join ldb.d_calendar_month a18
on   		    (a15.month_start_date_key = a18.row_key)
union

select  		'd_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_internal_contact a12
on   		    (a11.opened_by_key = a12.row_key)
union

select  		'd_master_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_master_item a13
on   		    (a11.catalog_item_key = a13.row_key)
union

select  		'd_calendar_date_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a14
on   		    (a11.closed_on_key = a14.row_key)
union

select  		'd_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date a15
on   		    (a11.opened_on_key = a15.row_key)
union

select  		'd_request_item_state' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_request_item_state a16
on   		    (a11.state_src_key = a16.row_key)
union

select  		'd_calendar_month_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join ldb.d_calendar_date_closed a14
on   		    (a11.closed_on_key = a14.row_key)
left outer join ldb.d_calendar_month_closed a17
on   		    (a14.month_start_date_key = a17.row_key)
union

select  		'd_calendar_month' as Table_Name,count(a11.row_key) Row_Count 
from 			ldb.f_request_item a11 
left outer join	ldb.d_calendar_date	a15
on 				(a11.opened_on_key = a15.row_key)
left outer join	ldb.d_calendar_month	a18
on 				(a15.month_start_date_key = a18.row_key)
union

select  		'ZZMD01' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
union

select  		'ZZMD02' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
union	

select  		'ldb.d_request_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_request_item	a15
on 				(coalesce(pa11.request_item_key, pa12.request_item_key, pa14.request_item_key) = a15.row_key)
union

select  		'ldb.d_calendar_date_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_calendar_date_closed	a16
on 				(coalesce(pa11.row_key6, pa12.row_key6, pa14.row_key6) = a16.row_key)
union

select  		'ldb.d_master_item' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_master_item	a17
on			 	(coalesce(pa11.item_number, pa12.item_number, pa14.item_number) = a17.item_number)
union

select  		'ldb.d_calendar_date' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_calendar_date	a18
on			 	(coalesce(pa11.calendar_date_key, pa12.calendar_date_key, pa14.calendar_date_key) = a18.row_key)
union

select  		'ldb.d_internal_contact' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_internal_contact	a19
on			 	(coalesce(pa11.row_key7, pa12.row_key7, pa14.row_key7) = a19.row_key)
union

select  		'ldb.d_internal_organization_group' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_internal_organization_group	a110
	  on 	(coalesce(pa11.assignment_group_key, pa12.assignment_group_key, pa14.assignment_group_key) = a110.row_key)
union

select  		'ldb.d_internal_contact_mdm' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_internal_contact_mdm	a111
	  on 	(coalesce(pa11.row_current_key, pa12.row_current_key, pa14.row_current_key) = a111.row_current_key)
union

select  		'ldb.d_request' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_request	a112
	  on 	(coalesce(pa11.row_key4, pa12.row_key4, pa14.row_key4) = a112.row_key)
union

select  		'ldb.d_request_item_stage' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_request_item_stage	a113
	  on 	(coalesce(pa11.row_key2, pa12.row_key2, pa14.row_key2) = a113.row_key)
union

select  		'ldb.d_request_item_state' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_request_item_state	a114
	  on 	(coalesce(pa11.state_src_key, pa12.state_src_key, pa14.state_src_key) = a114.row_key)
union

select  		'ldb.d_internal_contact_requested_for' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_internal_contact_requested_for	a115
	  on 	(coalesce(pa11.row_key1, pa12.row_key1, pa14.row_key1) = a115.row_key)
union

select  		'ldb.d_task_approval' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_task_approval	a116
	  on 	(coalesce(pa11.row_key0, pa12.row_key0, pa14.row_key0) = a116.row_key)
union

select  		'ldb.d_internal_contact_task_closed_by' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
full outer join	ZZMD01	pa12
on 				(pa11.assignment_group_key = pa12.assignment_group_key and 
				pa11.calendar_date_key = pa12.calendar_date_key and 
				pa11.item_number = pa12.item_number and 
				pa11.request_item_key = pa12.request_item_key and 
				pa11.row_current_key = pa12.row_current_key and 
				pa11.row_key = pa12.row_key and 
				pa11.row_key0 = pa12.row_key0 and 
				pa11.row_key1 = pa12.row_key1 and 
				pa11.row_key2 = pa12.row_key2 and 
				pa11.row_key4 = pa12.row_key4 and 
				pa11.row_key6 = pa12.row_key6 and 
				pa11.row_key7 = pa12.row_key7 and 
				pa11.state_src_key = pa12.state_src_key)
full outer join	ZZMD02	pa14
on 				coalesce(pa11.assignment_group_key, pa12.assignment_group_key) = pa14.assignment_group_key and 
				coalesce(pa11.calendar_date_key, pa12.calendar_date_key) = pa14.calendar_date_key and 
				coalesce(pa11.item_number, pa12.item_number) = pa14.item_number and 
				coalesce(pa11.request_item_key, pa12.request_item_key) = pa14.request_item_key and 
				coalesce(pa11.row_current_key, pa12.row_current_key) = pa14.row_current_key and 
				coalesce(pa11.row_key, pa12.row_key) = pa14.row_key and 
				coalesce(pa11.row_key0, pa12.row_key0) = pa14.row_key0 and 
				coalesce(pa11.row_key1, pa12.row_key1) = pa14.row_key1 and 
				coalesce(pa11.row_key2, pa12.row_key2) = pa14.row_key2 and 
				coalesce(pa11.row_key4, pa12.row_key4) = pa14.row_key4 and 
				coalesce(pa11.row_key6, pa12.row_key6) = pa14.row_key6 and 
				coalesce(pa11.row_key7, pa12.row_key7) = pa14.row_key7 and 
				coalesce(pa11.state_src_key, pa12.state_src_key) = pa14.state_src_key)
left outer join	ldb.d_internal_contact_task_closed_by	a117
	  on 	(coalesce(pa11.row_key, pa12.row_key, pa14.row_key) = a117.row_key)
union

select  		'ldb.d_calendar_month_closed' as Table_Name,count(a11.row_key) Row_Count 
from 			ZZMD00 pa11 
left outer join	ldb.d_calendar_date_closed	a16
on 				(coalesce(pa11.row_key6, pa12.row_key6, pa14.row_key6) = a16.row_key)
left outer join	ldb.d_calendar_month_closed	a118
	  on 	(a16.month_start_date_key = a118.row_key)
union
