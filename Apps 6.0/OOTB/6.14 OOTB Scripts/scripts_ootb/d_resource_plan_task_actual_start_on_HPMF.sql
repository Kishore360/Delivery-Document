SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_plan.row_id' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_wp_work_units_final where cdctype<>'D' and resource_id is not null) SRC
left join   #DWH_TABLE_SCHEMA.d_resource_plan TRGT
on CONCAT('RES_TASK~',coalesce(SRC.RESOURCE_ID,'UNSPECIFIED'),'~',SRC.TASK_ID)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select min(timecard_on) as actual_start, resource_plan_key from  #DWH_TABLE_SCHEMA.f_time_card group by resource_plan_key)LKP
on TRGT.row_key=LKP.resource_plan_key
where coalesce(LKP.actual_start,'')<>coalesce(TRGT.actual_start_on,'')