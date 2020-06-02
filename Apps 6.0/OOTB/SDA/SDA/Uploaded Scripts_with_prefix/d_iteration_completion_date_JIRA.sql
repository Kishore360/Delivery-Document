SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_iteration.completion_date' ELSE 'SUCCESS' END as Message
 from (
select max(sprint.name) as name, sprint.id as id, max(sprint.sourceinstance) as sourceinstance, min(sprint.startDate) as startDate, max(sprint.endDate) as endDate, max(sprint.completeDate) as completeDate, max(sprint.state) as state, max(sprint.cdctype) as cdctype, max(sprint.cdctime) as cdctime
from #MDS_TABLE_SCHEMA.sprint_final sprint
join (
select id as id, sourceinstance, max(cdctime) as cdctime
from #MDS_TABLE_SCHEMA.sprint_final sprint
where sprint.id != 0 and sprint.state is not null
group by id, sourceinstance
) self
on self.id = sprint.id and self.sourceinstance = sprint.sourceinstance and self.cdctime = sprint.cdctime
where sprint.id != 0 and sprint.state is not null
group by id
) SRC

left join #DWH_TABLE_SCHEMA.d_iteration TRGT
on SRC.id =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(convert_tz(SRC.completeDate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.completion_date,'')