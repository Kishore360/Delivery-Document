-- AGE(DAYS),OPENED BY SERVICE REQUEST --

select	'Age(Days)' as metrics,	sum((a24.current_age / 86400.0)) AS value -- (*** Formula correct Data not matching)
from	ldb.f_service_request_c	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11

 union
 select	'Closed Service Request' as metrics,	count(1) AS value 
from	ldb.f_service_request_c_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
 union
 select	'Current Open count' as metrics,	count(1) AS value 
from	ldb.f_service_request_c	a24
    join        ldb.d_service_request_c              a16
                  on         (a24.service_request_c_key = a16.row_key)
join ldb.d_lov_service_request_state_c a11 on a16.state_src_key=a11.row_key
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where a11.wh_dimension_code = 'OPEN' and 	a13.lagging_count_of_month between 0 and 11
union
SELECT 'MTTR(hours)' as metrics,
a.Open_to_resolved_duration/b.resolved_incidents as value
FROM 
(select	sum((a11.open_to_resolve_duration / 3600.0)) AS Open_to_resolved_duration
from	ldb.f_service_request_c_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
		 join        ldb.d_service_request_c              a16
                  on         (a11.service_request_c_key = a16.row_key)
join ldb.d_lov_service_request_state_c a110 on a16.state_src_key=a110.row_key
	join	ldb.d_calendar_month	a15
	  on 	(a12.month_start_date_key = a15.row_key)
where	(a110.wh_dimension_code in ('RESOLVED', 'CLOSED')
 and a15.lagging_count_of_month between 0 and 11) 
) a 
CROSS JOIN 
(select	count(a11.row_key) AS resolved_incidents
from	ldb.f_service_request_c_resolved	a11
	join	ldb.d_calendar_date	a12
	  on 	(a11.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
) b
 union
 select	'Open to close duration(hours)' as metrics,	sum((a24.open_to_close_duration/3600.0)) AS value 
from	ldb.f_service_request_c_closed	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.closed_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11

 union
 select	'Open to resolve duration(hours)' as metrics,	sum((a24.open_to_resolve_duration/3600.0)) AS value
from	ldb.f_service_request_c_resolved	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11

union
 select	'Opened By Service Request' as metrics,	count(opened_by_key) AS value -- (***Data not matching)
from	ldb.f_service_request_c	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.opened_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11
 union
 SELECT 'planned effort hours' as metrics,sum(a.planned_effort_hours)/86400.00 AS value
FROM ldb.f_service_request_c a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11
union
 SELECT 'Reassignment Count' as metrics,sum(a.reasignment_count) AS value
FROM ldb.f_service_request_c a 
JOIN ldb.d_calendar_date b ON a.opened_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key
where c.lagging_count_of_month between 0 and 11
union
 select	'Resolved Service Request' as metrics,	count(1) AS value 
from	ldb.f_service_request_c_resolved	a24
	join	ldb.d_calendar_date	a12
	  on 	(a24.last_resolved_on_key = a12.row_key)
	join	ldb.d_calendar_month	a13
	  on 	(a12.month_start_date_key = a13.row_key)
where	a13.lagging_count_of_month between 0 and 11