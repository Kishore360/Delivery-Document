SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_allocation.group_resource_key' ELSE 'SUCCESS' END as Message
from (select SRC23.creation_date,SRC23.sourceinstance,concat(SRC23.resource_id,'~',SRC23.task_id) as row_id,SRC23.task_id,
SRC23.resource_id as user_id,temp.WORKING_DAY_DATE,
cast(SRC26.SCHED_START_DATE as date) , cast(SRC26.SCHED_FINISH_DATE as date)
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
WHERE SRC23.cdctype<>'D' )SRC
left join #DWH_TABLE_SCHEMA.f_resource_allocation TRGT
on concat('ASSIGN','~',SRC.row_id,'~',coalesce(SRC.WORKING_DAY_DATE,'UNSPECIFIED'))=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where COALESCE(TRGT.group_resource_key,'')<>0;