drop table if exists #STG_TABLE_SCHEMA.f_iteration_temp;

create table if not exists #STG_TABLE_SCHEMA.f_iteration_temp (
  sys_id VARCHAR(255) DEFAULT NULL,
  row_id VARCHAR(255) DEFAULT NULL,
  source_id SMALLINT(6) DEFAULT NULL,
  work_item_key BIGINT(20) DEFAULT NULL,
  dim_wi_key BIGINT(20) DEFAULT NULL,
  wi_typ VARCHAR(32) DEFAULT NULL,
  iteration_key BIGINT(20) DEFAULT NULL,
  burn_date_key BIGINT(20) DEFAULT NULL,
  iteration_start_date DATETIME DEFAULT NULL,
  is_added_count INT(11) DEFAULT NULL,
  is_removed_count INT(11) DEFAULT NULL,
  is_resolved_count INT(11) DEFAULT NULL,
  is_reopened_count INT(11) DEFAULT NULL,
  story_points_burn DECIMAL(28,10) DEFAULT NULL,
  business_value_burn DECIMAL(28,10) DEFAULT NULL,
  original_estimate_burn DECIMAL(28,10) DEFAULT NULL,
  soft_deleted_flag CHAR(1) DEFAULT NULL,
  changed_on DATETIME DEFAULT NULL,
  changed_by VARCHAR(60) DEFAULT NULL,
  created_by VARCHAR(60) DEFAULT NULL,
  created_on DATETIME DEFAULT NULL,
  cdctype CHAR(1) DEFAULT NULL,
  inserted_on DATETIME DEFAULT NULL,
  PRIMARY KEY (sys_id, source_id)
);

insert into #STG_TABLE_SCHEMA.f_iteration_temp
(sys_id, row_id, source_id, work_item_key, dim_wi_key, wi_typ, iteration_key, burn_date_key, iteration_start_date, 
is_added_count, is_removed_count, is_resolved_count, is_reopened_count, story_points_burn, business_value_burn, original_estimate_burn,
soft_deleted_flag, changed_on, changed_by, created_by, created_on, cdctype, inserted_on)

select BURN.row_id as sys_id, ITE.row_id, ITE.source_id, BURN.work_item_key as work_item_key, DWI.row_key as dim_wi_key, wi_typ.dimension_wh_code as wi_typ, ITE.row_key iteration_key, BURN.work_item_burn_date_key as burn_date_key, ITE.start_date as iteration_start_date, 
BURN.is_added_count , BURN.is_removed_count, BURN.is_resolved_count, BURN.is_reopened_count, BURN.story_points_burn, BURN.business_value_burn, BURN.original_estimate_burn,
ITE.soft_deleted_flag, ITE.changed_on, ITE.changed_by, ITE.created_by, ITE.created_on, ITE.cdctype, current_timestamp

from #DWH_TABLE_SCHEMA.f_work_item_burn_down BURN
left join #DWH_TABLE_SCHEMA.d_iteration ITE
on BURN.work_item_iteration_m2m_key = ITE.row_key
and BURN.source_id = ITE.source_id
left join #DWH_TABLE_SCHEMA.d_work_item DWI
on BURN.work_item_key = DWI.row_key
and BURN.source_id = DWI.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map wi_typ
on wi_typ.src_key = DWI.work_item_type_src_key;

alter table #DWH_TABLE_SCHEMA.f_iteration_temp
ADD INDEX first_idx (row_id, source_id),
ADD INDEX second_idx (work_item_key, source_id),
ADD INDEX third_idx (iteration_key, source_id);