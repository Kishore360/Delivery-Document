SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from  fidelity_mdsdb.hp_wp_work_units_final where cdctype<>'D') SRC
 left join(select * from fidelity_mdsdb.hp_knta_users_final)SRC4
 on SRC.resource_id=SRC4.user_id
left join(select * from fidelity_mdsdb.hp_wp_tasks_final)SRC1
on SRC.task_id=SRC1.task_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select * from fidelity_mdsdb.hp_wp_task_schedule_final)SRC2
on SRC1.task_schedule_id=SRC2.task_schedule_id
and SRC1.sourceinstance=SRC2.sourceinstance
left join
(select working_day_date,cal.calendar_id as calendar_id from (select * from fidelity_mdsdb.hp_kdrv_calendars_final)cal
INNER join(select * from fidelity_mdsdb.hp_kdrv_working_days_final where WORKING_DAY_FLAG='Y')days
on cal.parent_calendar_id=days.calendar_id)CAL_SRC
on (CAL_SRC.working_day_date between SRC2.sched_start_date and sched_finish_date)
and SRC4.calendar_id=CAL_SRC.calendar_id
left join(select * from  fidelity_mdsdb.hp_kdrv_calendar_exceptions_final where cdctype<>'D') SRC5
on CAL_SRC.calendar_id=SRC5.calendar_id
and CAL_SRC.working_day_date=SRC5.event_date
LEFT JOIN (select * from  fidelity_mdwdb.f_resource_allocation)TRGT   
on CONCAT('ASSIGN','~',coalesce(SRC.resource_id,'UNSPECIFIED'),'~',coalesce(SRC.task_id,'UNSPECIFIED'),'~',
coalesce(CAL_SRC.working_day_date,'UNSPECIFIED'))=COALESCE(TRGT.row_id,'') 
and SRC.sourceinstance=TRGT.source_id
where COALESCE(TRGT.assigned_doc_cost,'')<>0
