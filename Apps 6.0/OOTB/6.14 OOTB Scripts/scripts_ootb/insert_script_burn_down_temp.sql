drop table if exists #STG_TABLE_SCHEMA.burn_down_temp;

create table if not exists #STG_TABLE_SCHEMA.burn_down_temp (
  sys_id VARCHAR(255) DEFAULT NULL,
  source_id SMALLINT(6) DEFAULT NULL,
  iteration_id BIGINT(20) DEFAULT NULL,
  started_on_key BIGINT(20) DEFAULT NULL,
  burn_on_key BIGINT(20) DEFAULT NULL,
  work_item_id BIGINT(20) DEFAULT NULL,
  work_item_key BIGINT(20) DEFAULT NULL,
  changed_on DATETIME DEFAULT NULL,
  changed_by VARCHAR(60) DEFAULT NULL,
  created_by VARCHAR(60) DEFAULT NULL,
  created_on DATETIME DEFAULT NULL,
  cdctype CHAR(1) DEFAULT NULL,
  soft_deleted_flag CHAR(1) DEFAULT NULL,
  is_added_count INT(11) DEFAULT NULL,
  is_removed_count INT(11) DEFAULT NULL,
  is_resolved_count INT(11) DEFAULT NULL,
  is_reopened_count INT(11) DEFAULT NULL,
  inserted_on DATETIME DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id),
  INDEX second_idx (iteration_id, burn_on_key, work_item_id, source_id),
  INDEX third_idx (work_item_key, source_id)
);

insert into #STG_TABLE_SCHEMA.burn_down_temp
(sys_id, source_id, iteration_id, burn_on_key, started_on_key, work_item_id, work_item_key, 
 changed_on, changed_by, created_by, created_on, cdctype, soft_deleted_flag, inserted_on,
 is_added_count, is_removed_count, is_resolved_count, is_reopened_count)


select SQ.sys_id, SQ.source_id, SQ.iteration_id, SQ.burn_on_key, SQ.started_on_key, SQ.work_item_id, SQ.work_item_key, SQ.changed_on, SQ.changed_by, 
SQ.created_by, SQ.created_on, SQ.cdctype, SQ.soft_deleted_flag,current_timestamp,
  
sum(SQ.is_added) is_added_count, sum(SQ.is_removed) is_removed_count, sum(SQ.is_resolved) is_resolved_count, sum(SQ.is_reopened) is_reopened_count

from (
select concat(DIT.row_id, '~', case when FWIACT.task_attribute_wh_name = 'ITERATION' and FWIACT.started_on < DIT.start_date then DATE_FORMAT(DIT.start_date, '%Y%m%d')
else FWIACT.started_on_key end, '~',DWI.row_id) sys_id, 
DIT.row_id iteration_id, case when FWIACT.task_attribute_wh_name = 'ITERATION' and FWIACT.started_on < DIT.start_date then DATE_FORMAT(DIT.start_date, '%Y%m%d') 
else FWIACT.started_on_key end burn_on_key, FWIACT.started_on_key, DWI.row_id work_item_id, FWIACT.source_id, FWIACT.work_item_key, max(FWIACT.changed_on) changed_on, max(FWIACT.changed_by) changed_by, 
max(FWIACT.created_by) created_by, max(FWIACT.created_on) created_on, max(FWIACT.cdctype) cdctype, FWIACT.soft_deleted_flag,

sum(case when FWIACT.task_attribute_wh_new_value_key = DIT.row_key then 1 else 0 end) is_added,
sum(case when FWIACT.task_attribute_wh_old_value_key = DIT.row_key then 1 else 0 end) is_removed,
0 as is_resolved,
0 as is_reopened

from #DWH_TABLE_SCHEMA.f_work_item_activity FWIACT
join #DWH_TABLE_SCHEMA.d_work_item DWI
on FWIACT.work_item_key = DWI.row_key
and FWIACT.source_id = DWI.source_id
join #DWH_TABLE_SCHEMA.d_iteration DIT
ON ((FWIACT.task_attribute_wh_name = 'ITERATION' 
and (FWIACT.task_attribute_wh_new_value_key = DIT.row_key OR FWIACT.task_attribute_wh_old_value_key = DIT.row_key)) 
and DIT.source_id = FWIACT.source_id)
left join #DWH_TABLE_SCHEMA.d_lov_map lov_type 
on DWI.work_item_type_src_key=lov_type.src_key 
and lov_type.dimension_class = 'TYPE~WORK_ITEM' 
where lov_type.dimension_wh_code <> 'SUBTASK'
group by DIT.row_id, case when FWIACT.task_attribute_wh_name = 'ITERATION' and FWIACT.started_on < DIT.start_date then DATE_FORMAT(DIT.start_date, '%Y%m%d')    
else FWIACT.started_on_key end, DWI.row_id

union all

select concat(DIT.row_id, '~', case when FWIACT.started_on < DIT.start_date then DATE_FORMAT(DIT.start_date, '%Y%m%d')
else FWIACT.started_on_key END, '~',DWI.row_id) sys_id, 
DIT.row_id iteration_id, case when FWIACT.started_on < DIT.start_date then DATE_FORMAT(DIT.start_date, '%Y%m%d') 
else FWIACT.started_on_key end burn_on_key, FWIACT.started_on_key, DWI.row_id work_item_id, FWIACT.source_id, FWIACT.work_item_key, max(FWIACT.changed_on) changed_on, max(FWIACT.changed_by) changed_by, 
max(FWIACT.created_by) created_by, max(FWIACT.created_on) created_on, max(FWIACT.cdctype) cdctype,FWIACT.soft_deleted_flag,

0 as is_added,
0 as is_removed,
sum(case when status_to.dimension_wh_code in ('COMPLETED','RESOLVED', 'CANCELLED') and status_from.dimension_wh_code not in ('COMPLETED','RESOLVED') then 1 else 0 end) is_resolved,
sum(case when status_to.dimension_wh_code in ('PROPOSED', 'IN PROGRESS') and status_from.dimension_wh_code in ('COMPLETED','RESOLVED') then 1 else 0 end) is_reopened

from #DWH_TABLE_SCHEMA.f_work_item_activity FWIACT
join #DWH_TABLE_SCHEMA.f_work_item_activity FWIACT_ITE
on FWIACT.work_item_key = FWIACT_ITE.work_item_key and FWIACT.source_id = FWIACT_ITE.source_id
join #DWH_TABLE_SCHEMA.d_work_item DWI
on FWIACT.work_item_key = DWI.row_key
and FWIACT.source_id = DWI.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map status_to 
ON status_to.dimension_class = 'STATUS~WORK_ITEM' and FWIACT.task_attribute_wh_name = 'STATUS'  
and FWIACT.task_attribute_wh_new_value_key = status_to.src_key 
left join #DWH_TABLE_SCHEMA.d_lov_map status_from 
ON status_from.dimension_class = 'STATUS~WORK_ITEM' and FWIACT.task_attribute_wh_name = 'STATUS'  
and FWIACT.task_attribute_wh_old_value_key = status_from.src_key 
join #DWH_TABLE_SCHEMA.d_iteration DIT
ON (FWIACT.task_attribute_wh_name = 'STATUS' and FWIACT_ITE.task_attribute_wh_name = 'ITERATION' 
and FWIACT_ITE.task_attribute_wh_new_value_key = DIT.row_key 
and FWIACT.started_on BETWEEN FWIACT_ITE.started_on and COALESCE(FWIACT_ITE.ended_on, DIT.completion_date, DIT.end_date)
and DIT.source_id = FWIACT.source_id)
left join #DWH_TABLE_SCHEMA.d_lov_map lov_type 
ON DWI.work_item_type_src_key=lov_type.src_key 
and lov_type.dimension_class = 'TYPE~WORK_ITEM' 
where lov_type.dimension_wh_code <> 'SUBTASK'
group by DIT.row_id, case when FWIACT.started_on < DIT.start_date then DATE_FORMAT(DIT.start_date, '%Y%m%d')    
else FWIACT.started_on_key end, DWI.row_id
) SQ
group by SQ.sys_id;