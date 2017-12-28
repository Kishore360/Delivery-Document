SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM
 gogo_mdsdb.wm_task_final b 
left join gogo_mdsdb.u_airport_codes_final c on c.sys_id=b.u_wo_station and c.sourceinstance=b.sourceinstance
join gogo_mdwdb.d_work_order_task_c a on a.row_id=b.sys_id and a.source_id=b.sourceinstance
where  
 a.airport_code<> coalesce(u_airport_code,'UNSPECIFIED') or
a.airport_location<>coalesce(u_airport_location,'UNSPECIFIED') or
a.upon_approval <>  b.upon_approval or
a.upon_reject <> b.upon_reject or
a.wo_log_field <> b.u_wo_log_field or
case when u_preventative_maintenance=1 then 'Y' else 'N' end <>PREVENTATIVE_MAINTENANCE_FLAG or 
case when is_fixed_window=1 then 'Y' else 'N' end <>is_fixed_window_flag or
a.acknowledged_on <>b.acknowledged_on or
CONCAT('<a href=\"','https://gogo.service-now.com/nav_to.do?uri=','wm_task.do?sys_id=',b.sys_id,'\" target=\"_blank\">',b.number,'</a>') 
<> source_url or
CREATED_BY	<>	b.sys_created_by	or
CHANGED_BY	<>	b.sys_updated_by	or
CREATED_ON	<>	convert_tz(b.sys_created_on,'GMT','America/Chicago')	or
CHANGED_ON	<>	convert_tz(b.sys_updated_on,'GMT','America/Chicago')	or
CDCTYPE	<>	CDCTYPE	
;

