


Change Related 

PROD 
Select a.date_key,SUM(a.closed_emergency_change_count)
from ldb.f_change_eod_current_c a 
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
where a.critical_business_process_c_key='-2'
AND a.date_key='1'
group by 1

PROD -UAT 

Select a.date_key,SUM(a.current_emergency_closed_count_c)
from ldb.f_change_eod_current_c a 
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
where a.critical_business_process_c_key='-2'
AND a.date_key='1'
group by 1





Incident:

PROD -UAT 

Select b.date_key,a.png_priority_c,SUM(a.priority_count)
From ldb.f_incident_eod_current_c a
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
where a.critical_business_process_c_key='-2'
AND a.date_key='1'
group by 1,2;


PROD :

Select b.date_key,a.png_priority_c,SUM(a.priority_count)
From ldb.f_incident_eod_current_c a
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
where a.critical_business_process_c_key='-2'
AND a.date_key='1'
group by 1,2;



problem Related queries :

SELECT a.date_key,SUM(a.open_p1_count)
FROM ldb.f_problem_eod_current_c a 
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
where a.critical_business_process_c_key='-2'
AND a.date_key='1'
group by 1



PROD-UAT_6.x

SELECT distinct a.date_key,b.date_filter,SUM(a.previous_open_p1_c)
FROM ldb.f_problem_eod_previous_c  a
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
Where a.critical_business_process_c_key='-2'
group  by 1,2

PROD_5.x

SELECT distinct a.date_key,b.date_filter,SUM(a.open_p1_count)
FROM ldb.f_problem_eod_previous_c  a
JOIN ldb.d_eod_date_filter_c b ON a.date_key=b.date_key
Where a.critical_business_process_c_key='-2'
group  by 1,2
