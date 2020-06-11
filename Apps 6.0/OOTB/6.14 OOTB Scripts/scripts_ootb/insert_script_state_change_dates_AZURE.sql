drop table if exists #STG_TABLE_SCHEMA.issue_dates_temp_azure;

create table if not exists #STG_TABLE_SCHEMA.issue_dates_temp_azure (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  resolution varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  resolved_by text COLLATE utf8_unicode_ci,
  cancelled_by text COLLATE utf8_unicode_ci,
  closed_by text COLLATE utf8_unicode_ci,
  created_by text COLLATE utf8_unicode_ci,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  work_start_on datetime DEFAULT NULL,
  resolved_on datetime DEFAULT NULL,
  resolved_on_calc datetime DEFAULT NULL,
  cancelled_on datetime DEFAULT NULL,
  cancelled_on_calc datetime DEFAULT NULL,
  completed_on datetime DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id,sourceinstance),
  INDEX base_idx (issueid,sourceinstance)
);

insert into #STG_TABLE_SCHEMA.issue_dates_temp_azure
(sys_id, sourceinstance, issueid, created_on, resolved_on, created_by, cdctype, inserted_on)
select SRC.__numerify__primary_key, SRC.sourceinstance, SRC.__numerify__primary_key, SRC.createdDate, SRC.msvsts_common_resolveddate, SRC.createdByKey, SRC.cdctype, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join #STG_TABLE_SCHEMA.workitem_temp_azure SRC
on SRC.__numerify__primary_key = temp.issueid and SRC.sourceinstance = temp.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map STS
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=STS.src_rowid and SRC.sourceinstance = STS.source_id
set temp.`status` = STS.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join #STG_TABLE_SCHEMA.workitem_temp_azure SRC
on SRC.__numerify__primary_key = temp.issueid and SRC.sourceinstance = temp.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id
set temp.resolution = RES.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as work_complete_on
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id

where lower(tmp.field) = 'status' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) compltd_dt
on temp.issueid=compltd_dt.issueid
and temp.sourceinstance=compltd_dt.sourceinstance

set temp.completed_on = case when temp.`status` = 'COMPLETED' then compltd_dt.work_complete_on else null end;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as resolved_on
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id

where lower(tmp.field) = 'status' and LM.dimension_wh_code='RESOLVED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) rslvd_dt
on temp.issueid=rslvd_dt.issueid
and temp.sourceinstance=rslvd_dt.sourceinstance

set temp.resolved_on_calc = case when temp.`status` in ('RESOLVED', 'COMPLETED') then rslvd_dt.resolved_on else null end;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join (
select tmp.issueid,tmp.sourceinstance,min(tmp.created) as work_start_on
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM.src_rowid and tmp.sourceinstance = LM.source_id
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='PROPOSED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) strtd_dt
on temp.issueid=strtd_dt.issueid
and temp.sourceinstance=strtd_dt.sourceinstance

set temp.work_start_on = strtd_dt.work_start_on;

update #STG_TABLE_SCHEMA.issue_dates_temp_azure temp
left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as cancelled_on
from #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on lower(tmp.field) = 'status' and concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id

where lower(tmp.field) = 'status' and LM.dimension_wh_code = 'CANCELLED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) cancld_dt
on temp.issueid=cancld_dt.issueid
and temp.sourceinstance=cancld_dt.sourceinstance

set temp.cancelled_on = case when (temp.`status` in ('CANCELLED') AND (temp.resolution != 'CANCELLED' OR temp.resolution IS NULL)) then cancld_dt.cancelled_on
 when temp.`status` in ('RESOLVED','CANCELLED','COMPLETED') AND temp.resolution in ('CANCELLED') then COALESCE(temp.resolved_on,cancld_dt.cancelled_on) else null end,
 temp.cancelled_on_calc = cancld_dt.cancelled_on;