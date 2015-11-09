CREATE TEMPORARY TABLE ZZMD00(
	row_key	BIGINT, 
	task_type	VARCHAR(50), 
	state	VARCHAR(50), 
	row_key0	BIGINT, 
	location_key	BIGINT, 
	row_key1	BIGINT, 
	row_key2	BIGINT, 
	row_key3	BIGINT, 
	row_key4	BIGINT, 
	row_key5	BIGINT, 
	incident_key	BIGINT, 
	row_current_key	BIGINT, 
	opened_by_department_key	BIGINT, 
	calendar_date_key	BIGINT, 
	row_key7	BIGINT, 
	assignment_group_key	BIGINT, 
	row_key8	BIGINT, 
	WJXBFS1	INTEGER);

insert into ZZMD00 
select	a11.reported_type_src_key AS row_key,
	a11.task_type AS task_type,
	a11.state AS state,
	a11.survey_key AS row_key0,
	a11.location_key AS location_key,
	a15.row_current_key AS row_key1,
	a14.row_key AS row_key2,
	a11.incident_task_assignment_group_key AS row_key3,
	a11.incident_task_assigned_to_key AS row_key4,
	a11.incident_task_key AS row_key5,
	a11.incident_key AS incident_key,
	a13.row_current_key AS row_current_key,
	a12.row_key AS opened_by_department_key,
	a11.requested_on_key AS calendar_date_key,
	a11.incident_task_business_service_key AS row_key7,
	a11.assignment_group_key AS assignment_group_key,
	a11.assigned_to_key AS row_key8,
	count(distinct a11.row_key) AS WJXBFS1
from	ldb.f_incident_response	a11
	join	ldb.d_internal_organization_department	a12
	  on 	(a11.taken_by_department_key = a12.row_key)
	join	ldb.d_internal_contact	a13
	  on 	(a11.sent_to_key = a13.row_key)
	join	ldb.d_internal_organization_department_incident_task_c	a14
	  on 	(a11.incident_task_department_key = a14.row_key)
	join	ldb.d_internal_contact_caller_incident_task_c	a15
	  on 	(a11.incident_task_opened_by_key = a15.row_key)
	join	ldb.d_calendar_date	a16
	  on 	(a11.requested_on_key = a16.row_key)
	left outer join	ldb.d_calendar_month	a17
	  on 	(a16.month_start_date_key = a17.row_key)
where	a17.lagging_count_of_month between 0 and 11
group by	a11.reported_type_src_key,
	a11.task_type,
	a11.state,
	a11.survey_key,
	a11.location_key,
	a15.row_current_key,
	a14.row_key,
	a11.incident_task_assignment_group_key,
	a11.incident_task_assigned_to_key,
	a11.incident_task_key,
	a11.incident_key,
	a13.row_current_key,
	a12.row_key,
	a11.requested_on_key,
	a11.incident_task_business_service_key,
	a11.assignment_group_key,
	a11.assigned_to_key;
	
	
	SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select 'ldb.f_incident_response' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
union
select 'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_organization_department         a12
on (a11.taken_by_department_key = a12.row_key)
union
select 'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_contact         a13
on (a11.sent_to_key = a13.row_key)
union
select 'ldb.d_internal_organization_department_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_organization_department_incident_task_c         a14
on (a11.incident_task_department_key = a14.row_key)
union
select 'ldb.d_internal_contact_caller_incident_task_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_internal_contact_caller_incident_task_c         a15
on (a11.incident_task_opened_by_key = a15.row_key)
union
select 'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11 
join ldb.d_calendar_date         a16
on (a11.requested_on_key = a16.row_key)
union
select 'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response             a11
 join ldb.d_calendar_date         a16
on (a11.requested_on_key = a16.row_key)
left outer join ldb.d_calendar_month         a17
on (a16.month_start_date_key = a17.row_key)
)a
)b;
