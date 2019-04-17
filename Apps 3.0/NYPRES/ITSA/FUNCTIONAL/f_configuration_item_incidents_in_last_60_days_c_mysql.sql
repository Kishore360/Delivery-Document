
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
 from nypres_mdwdb.f_configuration_item_c f
JOIN 
(select ftc.configuration_item_key as row_key,count(inc.incident_key) as count_of_incidents
from nypres_mdwdb.f_task_ci_c as ftc
inner join  (select fi.incident_key from nypres_mdwdb.f_incident as fi
				inner join nypres_mdwdb.d_calendar_date as dt
				on fi.opened_on_key = dt.row_key and dt.lagging_count_of_days between 0 and 59) as inc
on ftc.incident_key = inc.incident_key
where ftc.soft_deleted_flag = 'N'
group by ftc.configuration_item_key)src
		on src.row_key=f.configuration_item_key
where f.incidents_in_last_60_days_c <> src.count_of_incidents;






