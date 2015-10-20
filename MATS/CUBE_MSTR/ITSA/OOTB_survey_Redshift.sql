CREATE TABLE ZZMD00(
	task_type	VARCHAR(60), 
	state	VARCHAR(60), 
	row_key	BIGINT, 
	location_key	BIGINT, 
	incident_key	BIGINT, 
	row_current_key	BIGINT, 
	opened_by_department_key	BIGINT, 
	calendar_date_key	BIGINT, 
	assignment_group_key	BIGINT, 
	row_key1	BIGINT, 
	WJXBFS1	INTEGER);

insert into ZZMD00 
select	a11.task_type AS task_type,
	a11.state AS state,
	a11.survey_key AS row_key,
	a11.location_key AS location_key,
	a11.incident_key AS incident_key,
	a13.row_current_key AS row_current_key,
	a12.row_key AS opened_by_department_key,
	a11.requested_on_key AS calendar_date_key,
	a11.assignment_group_key AS assignment_group_key,
	a11.assigned_to_key AS row_key1,
	count(distinct a11.row_key) AS WJXBFS1
from	ldb.f_incident_response	a11
	join	ldb.d_internal_organization_department	a12
	  on 	(a11.taken_by_department_key = a12.row_key)
	join	ldb.d_internal_contact	a13
	  on 	(a11.sent_to_key = a13.row_key)
	join	ldb.d_calendar_date	a14
	  on 	(a11.requested_on_key = a14.row_key)
	left outer join	ldb.d_calendar_month	a15
	  on 	(a14.month_start_date_key = a15.row_key)
where	a15.lagging_count_of_month between 0 and 11
group by	a11.task_type,
	a11.state,
	a11.survey_key,
	a11.location_key,
	a11.incident_key,
	a13.row_current_key,
	a12.row_key,
	a11.requested_on_key,
	a11.assignment_group_key,
	a11.assigned_to_key;
    
    SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ldb.f_incident_response' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response                         a11 
union
select'ldb.d_internal_organization_department' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response                         a11 
join ldb.d_internal_organization_department            a12
on (a11.taken_by_department_key = a12.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response                         a11 
join ldb.d_internal_contact            a13
on (a11.sent_to_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response                         a11 
join ldb.d_calendar_date            a14
on (a11.requested_on_key = a14.row_key)
union
select'ldb.d_calendar_month' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident_response                         a11 
 join ldb.d_calendar_date            a14
on (a11.requested_on_key = a14.row_key)
join ldb.d_calendar_month            a15
on (a14.month_start_date_key = a15.row_key)

)a
)b;

SELECT CASE WHEN max_count<>min_count THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN  max_count<>min_count THEN 'OOTB has Keys Dropped' ELSE 'SUCCESS'  END as Message FROM (
 select max(Row_Count) max_count,Min(Row_Count) min_count from (
select'ZZMD00' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
union

select'ldb.f_incident_response' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.f_incident_response            a14
on (pa11.assignment_group_key = a14.assignment_group_key and pa11.calendar_date_key = a14.requested_on_key and pa11.incident_key = a14.incident_key and pa11.location_key = a14.location_key and pa11.row_key = a14.survey_key and pa11.row_key1 = a14.assigned_to_key and pa11.state = a14.state and pa11.task_type = a14.task_type)
union
select'ldb.d_survey_question' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
 join ldb.f_incident_response            a14
on (pa11.assignment_group_key = a14.assignment_group_key and pa11.calendar_date_key = a14.requested_on_key and pa11.incident_key = a14.incident_key and pa11.location_key = a14.location_key and pa11.row_key = a14.survey_key and pa11.row_key1 = a14.assigned_to_key and pa11.state = a14.state and pa11.task_type = a14.task_type)
join ldb.d_survey_question            a13
on (a14.question_key = a13.row_key)
union
select'ldb.d_calendar_date' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.d_calendar_date            a15
on (pa11.calendar_date_key = a15.row_key)
union
select'ldb.d_internal_contact' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.d_internal_contact            a16
on (pa11.row_key1 = a16.row_key)
union
select'ldb.d_internal_organization_group' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
 join ldb.f_incident_response            a14
on (pa11.assignment_group_key = a14.assignment_group_key and pa11.calendar_date_key = a14.requested_on_key and pa11.incident_key = a14.incident_key and pa11.location_key = a14.location_key and pa11.row_key = a14.survey_key and pa11.row_key1 = a14.assigned_to_key and pa11.state = a14.state and pa11.task_type = a14.task_type)
join ldb.d_internal_organization_group            a17
on (a14.assignment_group_key = a17.row_key and pa11.assignment_group_key = a17.row_key)
union
select'ldb.d_internal_contact_mdm' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.d_internal_contact_mdm            a19
on (pa11.row_current_key = a19.row_current_key)
union
select'ldb.d_incident' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.d_incident            a110
on (pa11.incident_key = a110.row_key)
union
select'ldb.d_location' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.d_location            a111
on (pa11.location_key = a111.row_key)
union
select'ldb.d_survey' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
join ldb.d_survey            a112
on (pa11.row_key = a112.row_key)
union
select'ldb.d_question_type' as Table_Name, count(pa11.row_key) Row_Count
 from  ZZMD00   pa11 
  join ldb.f_incident_response            a14
on (pa11.assignment_group_key = a14.assignment_group_key and pa11.calendar_date_key = a14.requested_on_key and pa11.incident_key = a14.incident_key and pa11.location_key = a14.location_key and pa11.row_key = a14.survey_key and pa11.row_key1 = a14.assigned_to_key and pa11.state = a14.state and pa11.task_type = a14.task_type)
join ldb.d_survey_question            a13
on (a14.question_key = a13.row_key)
join ldb.d_question_type            a113
on (a13.question_type_src_key = a113.row_key)
)a
)b;

drop table ZZMD00;
    