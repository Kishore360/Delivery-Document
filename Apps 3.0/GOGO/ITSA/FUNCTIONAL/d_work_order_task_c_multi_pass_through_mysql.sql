SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM
join gogo_mdsdb.wm_task_final b 
left join gogo_mdsdb.u_airport_codes_final c on c.sys_id=b.u_wo_station and c.sourceinstance=b.sourceinstance
join ds_work_order_task_c a on a.row_id=b.sys_id and a.source_id=b.sourceinstance
where  a.airport_code<> coalesce(u_airport_code,'UNSPECIFIED') or
a.airport_location<>coalesce(u_airport_location,'UNSPECIFIED') or
c.upon_approval <>  b.upon_approval or
c.upon_reject <> b.upon_reject or
c.wo_log_field <> b.wo_log_field or
case when u_preventative_maintenance=1 then 'Y' else 'N' end <>PREVENTATIVE_MAINTENANCE_FLAG or 
case when is_fixed_window=1 then 'Y' else 'N' end <>is_fixed_window_flag or
acknowledged_on <>acknowledged_on or
CONCAT('<a href=\"','@#ITSM_SYSTEM_SOURCE_URL@#','wm_task.do?sys_id=',i.sys_id,'\" target=\"_blank\">',i.number,'</a>') <> source_url or
case when first_time_fix_c_flag=1 then 'Y' else 'N' end <>first_time_fix_c_flag 

