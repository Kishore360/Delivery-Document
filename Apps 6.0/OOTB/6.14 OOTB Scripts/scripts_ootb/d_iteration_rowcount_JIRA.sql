 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_iteration' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src from (
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
) SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_iteration TRGT 
 join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant') ODF on ODF.source_id = TRGT.source_id 
 where TRGT.row_key not in (0, -1)) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ