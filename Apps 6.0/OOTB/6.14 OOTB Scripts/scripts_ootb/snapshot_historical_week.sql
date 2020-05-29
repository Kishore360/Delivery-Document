-- drop index hf_inc_key on #MDS_TABLE_SCHEMA.sys_audit_final;
-- drop index hf_fieldname on #MDS_TABLE_SCHEMA.sys_audit_final;
-- drop index hf_task_on on #MDS_TABLE_SCHEMA.sys_audit_final;

ALTER TABLE #MDS_TABLE_SCHEMA.sys_audit_final ADD INDEX (documentkey);
ALTER TABLE #MDS_TABLE_SCHEMA.sys_audit_final ADD INDEX (fieldname);
ALTER TABLE #MDS_TABLE_SCHEMA.sys_audit_final ADD INDEX (sys_created_on);

-- create index hf_inc_key on #MDS_TABLE_SCHEMA.sys_audit_final(documentkey);
-- create index hf_fieldname on #MDS_TABLE_SCHEMA.sys_audit_final(fieldname);
-- create index hf_task_on on #MDS_TABLE_SCHEMA.sys_audit_final(sys_created_on);

drop table  if exists app_test.retention_week_details;
create table app_test.retention_week_details as (
select distinct
 df.source_id,df.lastupdated,
 dcal.row_key,dcal.row_id,
 date_format(DATE_ADD(dcal.week_start_date, INTERVAL '-1' week),'%Y%m%d') as start_week
,date_format(DATE_ADD(dcal.week_start_date, INTERVAL '-52' week),'%Y%m%d') as end_week
,date_format(dcal.week_start_date,'%Y%m%d') as current_week
,date_format(dcal1.week_start_date,'%Y%m%d') as retention_period_weeks
,date_format(dcal1.week_end_date,'%Y%m%d') as retention_end_week
,date_format(dcal2.week_start_date,'%Y%m%d') as current_week_n_key
from (select source_id,min(lastupdated) as lastupdated  -- for full load data
	from #DWH_TABLE_SCHEMA.d_o_data_freshness
	group by source_id 
)df
--  df.source_id=v.source_id
inner join (select d.row_id,d.row_key,d.week_start_date,d.week_end_date 
	from #DWH_TABLE_SCHEMA.d_calendar_date d) dcal
	on date_format( df.lastupdated,'%Y%m%d')=dcal.row_key
 inner join (select d.row_id,d.row_key,d.week_start_date,d.week_end_date 
	from #DWH_TABLE_SCHEMA.d_calendar_date d) dcal1
	on dcal1.week_start_date between DATE_ADD(dcal.week_start_date, INTERVAL '-18' week) 
		and DATE_ADD(dcal.week_start_date, INTERVAL '-1' week)
inner join (select d.row_id,d.row_key,d.week_start_date,d.week_end_date 
	from #DWH_TABLE_SCHEMA.d_calendar_date d) dcal2
	on dcal2.row_key=date_format(dcal.week_start_date,'%Y%m%d')
) ;


-- explain 
drop table  if exists app_test.hist_snap_week;
create table app_test.hist_snap_week as (
select dcal.week_start_date,date_format(ret.retention_period_weeks,'%Y-%m-%d'),
f.incident_key
,f.row_id 
,f.opened_by_department_key
,f.opened_by_key
,f.source_id
,ret.retention_period_weeks as n_key
,date_format(ret.retention_period_weeks,'%Y-%m-%d 00:00:00') as n_date
,date_format(ret.retention_end_week,'%Y-%m-%d') as n_end_date
-- ,date_format(f.opened_on_key,'%Y-%m-%d') as opened_on
,(select d.opened_on from #DWH_TABLE_SCHEMA.d_incident d where d.row_id=f.row_id) as opened_on

,date_format(f.last_resolved_on_key,'%Y-%m-%d') as last_resolved_on
,date_format(f.closed_on_key,'%Y-%m-%d') as closed_on
,f.created_on
,f.created_by
,f.changed_on
,f.changed_by
,dcal.calendar_code
,f.dormancy_age
,case when DATE_ADD(ret.retention_period_weeks, INTERVAL '18' week)=date_format(ret.current_week,'%Y-%m-%d')
		then 'D' else 'A' end as CDCtype

,case when DATE_ADD(ret.retention_period_weeks, INTERVAL '18' week)=date_format(ret.current_week,'%Y-%m-%d')
		then 'Y' else 'N' end as soft_deleted_flag

,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_lov d 
		on(d.dimension_class ='STATE~INCIDENT' and hf.newvalue=d.dimension_code)
where f.row_id=hf.documentkey and hf.fieldname = 'state'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_lov d 
		on(d.dimension_class ='STATE~INCIDENT' and hf.oldvalue=d.dimension_code)
where f.row_id=hf.documentkey and hf.fieldname = 'state'
order by hf.sys_created_on asc limit 1),f.state_src_key) as state_src_key

,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_lov d 
		on(d.dimension_class ='PRIORITY~INCIDENT' and hf.newvalue=d.dimension_code)
where f.row_id=hf.documentkey and hf.fieldname = 'priority'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_lov d 
		on(d.dimension_class ='PRIORITY~INCIDENT' and hf.oldvalue=d.dimension_code)
where f.row_id=hf.documentkey and hf.fieldname = 'priority'
order by hf.sys_created_on asc limit 1),f.priority_src_key) as priority_src_key


,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_lov d 
		on(d.dimension_class ='CATEGORY~INCIDENT' and hf.newvalue=d.dimension_code)
where f.row_id=hf.documentkey and hf.fieldname = 'category'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_lov d 
		on(d.dimension_class ='CATEGORY~INCIDENT' and hf.oldvalue=d.dimension_code)
where f.row_id=hf.documentkey and hf.fieldname = 'category'
order by hf.sys_created_on asc limit 1),f.category_src_key) as category_src_key

,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_internal_organization d 
		on(concat('GROUP~', hf.newvalue) = d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'assignment_group'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_internal_organization d 
		on(concat('GROUP~', hf.oldvalue) = d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'assignment_group'
order by hf.sys_created_on asc limit 1),f.assignment_group_key) as assignment_group_key

,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_internal_organization d 
		on(concat('INTERNAL_CONTACT~', hf.newvalue) = d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'assigned_to'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_internal_organization d 
		on(concat('INTERNAL_CONTACT~', hf.oldvalue) = d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'assigned_to'
order by hf.sys_created_on asc limit 1),f.assigned_to_key) as assigned_to_key

,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_internal_organization d 
		on(hf.newvalue= d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'cmdb_ci'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_internal_organization d 
		on(hf.oldvalue= d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'cmdb_ci'
order by hf.sys_created_on asc limit 1),f.configuration_item_key) as configuration_item_key

,coalesce((select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_service d 
		on(concat('BUSINESS_SERVICE~',hf.newvalue)= d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'cmdb_ci'
and hf.sys_created_on <= date_format(ret.retention_period_weeks,'%Y-%m-%d')
order by hf.sys_created_on desc limit 1),(select d.row_key 
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
join #DWH_TABLE_SCHEMA.d_service d 
		on(concat('BUSINESS_SERVICE~',hf.oldvalue)= d.row_id)
where f.row_id=hf.documentkey and hf.fieldname = 'cmdb_ci'
order by hf.sys_created_on asc limit 1),f.business_service_key) as business_service_key

,case when coalesce((select hf.newvalue
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') hf
where f.row_id=hf.documentkey
and hf.fieldname = 'reopen_count'
order by hf.sys_created_on desc limit 1),f.reopened_count) >0 then 'Y' else 'N' end as reopened_flag

from #DWH_TABLE_SCHEMA.f_incident f
inner join #DWH_TABLE_SCHEMA.d_lov_map lmc
on (f.state_src_key= lmc.src_key and lmc.dimension_class ='STATE~INCIDENT')
inner join (select d.row_key,d.week_start_date,d.calendar_code,d.source_id from #DWH_TABLE_SCHEMA.d_calendar_date d) dcal
on f.opened_on_key=dcal.row_key

inner join app_test.retention_week_details ret
on (dcal.source_id=ret.source_id
and dcal.week_start_date<=date_format(ret.retention_period_weeks,'%Y-%m-%d')
and case when lmc.dimension_wh_code in ('CLOSED','RESOLVED') then 
concat(substring(coalesce(f.closed_on_key,f.last_resolved_on_key) from 1 for 6),'01') > ret.retention_period_weeks 
else True end
)
);
