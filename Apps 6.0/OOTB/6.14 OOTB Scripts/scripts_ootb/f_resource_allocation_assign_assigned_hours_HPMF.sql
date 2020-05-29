SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_allocation.assigned_hours' ELSE 'SUCCESS' END as Message
from(select case when SRC.working_day_count is not null then 
(work_units.SCHED_EFFORT/SRC.working_day_count) else 0 end as assigned_hours,
SRC.sourceinstance,SRC.row_id,SRC.task_id,SRC.user_id,temp1.WORKING_DAY_DATE,work_units.resource_id
from(select * from #MDS_TABLE_SCHEMA.hp_wp_work_units_final where resource_id is not null) work_units
left join #MDS_TABLE_SCHEMA.hp_wp_tasks_final wp_tasks
on work_units.task_id=wp_tasks.task_id and work_units.sourceinstance=wp_tasks.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_knta_users_final users
on users.USER_ID=work_units.resource_id and users.sourceinstance=work_units.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final task_schedule
on task_schedule.TASK_SCHEDULE_ID=wp_tasks.TASK_SCHEDULE_ID and task_schedule.sourceinstance=wp_tasks.sourceinstance
left join(
select SRC23.sourceinstance,concat(SRC23.resource_id,'~',SRC23.task_id) as row_id,SRC23.task_id,
SRC23.resource_id as user_id,count(temp.WORKING_DAY_DATE) as working_day_count
from (select * from #MDS_TABLE_SCHEMA.hp_wp_work_units_final where resource_id is not null) SRC23
left join #MDS_TABLE_SCHEMA.hp_wp_tasks_final SRC24
on SRC23.task_id=SRC24.task_id and SRC23.sourceinstance=SRC24.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_knta_users_final SRC25
on SRC25.USER_ID=SRC23.RESOURCE_ID and SRC25.sourceinstance=SRC23.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_wp_task_schedule_final SRC26
on SRC26.TASK_SCHEDULE_ID=SRC24.TASK_SCHEDULE_ID and SRC26.sourceinstance=SRC24.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kdrv_calendars_final SRC27
on SRC27.CALENDAR_ID=SRC25.CALENDAR_ID and SRC27.sourceinstance=SRC25.sourceinstance 
INNER JOIN #MDS_TABLE_SCHEMA.hp_pm_work_plans_final pm_work_plans 
                ON pm_work_plans.WORK_PLAN_ID = SRC24.WORK_PLAN_ID 
                AND pm_work_plans.ENTITY_TYPE='WORK_PLAN' 
                AND pm_work_plans.sourceinstance = SRC24.sourceinstance
left join
(select SRC20.sourceinstance,SRC20.WORKING_DAY_ID,SRC20.CALENDAR_ID,SRC20.WORKING_DAY_DATE,count(SRC20.WORKING_DAY_DATE) as calendar_id_count
from #MDS_TABLE_SCHEMA.hp_kdrv_working_days_final SRC20
inner join #MDS_TABLE_SCHEMA.hp_kdrv_calendars_final SRC21
on SRC20.CALENDAR_ID=SRC21.PARENT_CALENDAR_ID
and SRC20.sourceinstance=SRC21.sourceinstance
where SRC20.WORKING_DAY_FLAG='Y'
group by 1,2,3,4)temp
on cast(temp.WORKING_DAY_DATE as date) between cast(SRC26.SCHED_START_DATE as date) and cast(SRC26.SCHED_FINISH_DATE as date)
and SRC27.PARENT_CALENDAR_ID=temp.calendar_id and SRC27.sourceinstance=temp.sourceinstance
WHERE SRC23.cdctype<>'D' 
group by 1,2,3,4)SRC
on SRC.task_id=work_units.task_id and SRC.user_id=work_units.resource_id and SRC.sourceinstance=work_units.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_wp_task_info_final task_info
on task_info.TASK_INFO_ID=wp_tasks.TASK_INFO_ID and wp_tasks.sourceinstance=task_info.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_pm_work_plans_final pm_work_plans1
on pm_work_plans1.WORK_PLAN_ID=wp_tasks.WORK_PLAN_ID and pm_work_plans1.sourceinstance=wp_tasks.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final fg_pfm_project
on fg_pfm_project.PRJ_PROJECT_ID=pm_work_plans1.PROJECT_ID and fg_pfm_project.sourceinstance=pm_work_plans1.sourceinstance
left join #MDS_TABLE_SCHEMA.hp_kdrv_calendars_final kdrv_calendars 
on kdrv_calendars.CALENDAR_ID=users.CALENDAR_ID and kdrv_calendars.sourceinstance=users.sourceinstance  
left join
(select kdrv_working.sourceinstance,kdrv_working.WORKING_DAY_ID,kdrv_working.CALENDAR_ID,kdrv_working.WORKING_DAY_DATE,count(kdrv_working.WORKING_DAY_DATE) as calendar_id_count
from #MDS_TABLE_SCHEMA.hp_kdrv_working_days_final kdrv_working
inner join #MDS_TABLE_SCHEMA.hp_kdrv_calendars_final kdrv_calendars1
on kdrv_working.CALENDAR_ID=kdrv_calendars1.PARENT_CALENDAR_ID
and kdrv_working.sourceinstance=kdrv_calendars1.sourceinstance
where kdrv_working.WORKING_DAY_FLAG='Y'
group by 1,2,3,4)temp1
on cast(temp1.WORKING_DAY_DATE as date) between cast(task_schedule.SCHED_START_DATE as date)
AND cast(task_schedule.SCHED_FINISH_DATE as date) and temp1.sourceinstance=kdrv_calendars.sourceinstance and 
kdrv_calendars.PARENT_CALENDAR_ID=temp1.calendar_id)Sour 
left join #DWH_TABLE_SCHEMA.f_resource_allocation TRGT
on concat('ASSIGN','~',Sour.row_id,'~',Sour.WORKING_DAY_DATE)=TRGT.row_id and Sour.sourceinstance=TRGT.source_id
where round(COALESCE(Sour.assigned_hours,''),4)<>round(COALESCE(TRGT.assigned_hours,''),4);