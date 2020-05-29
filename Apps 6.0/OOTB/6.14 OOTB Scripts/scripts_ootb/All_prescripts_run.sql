select if (
    exists(
        select distinct index_name from information_schema.statistics 
        where table_schema = '#MDS_TABLE_SCHEMA'
        and table_name = 'issue_final' and index_name like 'qa_idx'
    )
    ,'select ''index qa_idx exists'' _______;'
    ,concat('create index qa_idx on #MDS_TABLE_SCHEMA.issue_final (`key` (255), sourceinstance);')) into @a;
PREPARE idx_issue FROM @a;
EXECUTE idx_issue;

select if (
    exists(
        select distinct index_name from information_schema.statistics 
        where table_schema = '#MDS_TABLE_SCHEMA'
        and table_name = 'issue_comments_final' and index_name like 'qa_idx'
    )
    ,'select ''index qa_idx exists'' _______;'
    ,concat('create index qa_idx on #MDS_TABLE_SCHEMA.issue_comments_final (issueid, sourceinstance);')) into @a;
PREPARE idx_comments FROM @a;
EXECUTE idx_comments;

select if (
    exists(
        select distinct index_name from information_schema.statistics 
        where table_schema = '#DWH_TABLE_SCHEMA'
        and table_name = 'd_lov_map' and index_name like 'qa_idx'
    )
    ,'select ''index qa_idx exists'' _______;'
    ,concat('create index qa_idx on #DWH_TABLE_SCHEMA.d_lov_map (src_rowid, source_id, dimension_class);')) into @a;
PREPARE idx_lov_map FROM @a;
EXECUTE idx_lov_map;

drop table if exists #STG_TABLE_SCHEMA.issue_activity_temp;

create table if not exists #STG_TABLE_SCHEMA.issue_activity_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  authorRef text COLLATE utf8_unicode_ci,
  issueid int(11) DEFAULT NULL,
  created datetime DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  id int(11) NOT NULL DEFAULT '0',
  issuechangelogid int(11) NOT NULL DEFAULT '0',
  issue_cnglg_itm_issueid int(11) DEFAULT NULL,
  issue_cnglg_itm_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  issue_cnglg_itm_cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `from` text COLLATE utf8_unicode_ci,
  `to` text COLLATE utf8_unicode_ci,
  fromstring text COLLATE utf8_unicode_ci,
  tostring text COLLATE utf8_unicode_ci,  
  primary_sequence_id bigint(20) NOT NULL DEFAULT '0',
  inserted_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id,sourceinstance),
  INDEX base_idx (sys_id,sourceinstance),
  INDEX first_idx (issueid, sourceinstance),
  INDEX second_idx (issueid, issuechangelogid,`field`),
  INDEX third_idx (issueid, sourceinstance, `field`, primary_sequence_id)
);

insert into #STG_TABLE_SCHEMA.issue_activity_temp
(sys_id, authorRef, issueid, created, sourceinstance, cdctype, 
id, fromstring, issuechangelogid, issue_cnglg_itm_issueid, issue_cnglg_itm_sourceinstance, 
issue_cnglg_itm_cdctype, `field`, `from`, `to`, tostring, inserted_on)

select concat(SRC.issueid, '~', case when SRC2.field = 'sprint' THEN 'ITERATION' ELSE upper(SRC2.field) END, '~', SRC2.issuechangelogid) as sys_id,
SRC.authorRef ,
SRC.issueid ,
SRC.created ,
SRC.sourceinstance ,
SRC.cdctype ,
SRC.id ,
SRC2.fromstring ,
SRC2.issuechangelogid ,
SRC2.issueid ,
SRC2.sourceinstance ,
SRC2.cdctype ,
case when SRC2.field = 'sprint' THEN 'ITERATION' ELSE upper(SRC2.field) END ,
SRC2.`from` ,
SRC2.`to` ,
SRC2.tostring ,
current_timestamp
FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and issue.sourceinstance = SRC.sourceinstance
join (
select min(SRC2.issuechangelogid) chnglog, SRC.issueid, SRC.created, SRC2.field, SRC2.`to`, SRC2.`from`, SRC.sourceinstance
FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
group by SRC.issueid, SRC.created, SRC2.field, SRC2.`to`, SRC2.`from`, SRC.sourceinstance
) chng
on chng.chnglog = SRC2.issuechangelogid and chng.issueid = SRC.issueid and chng.field = SRC2.field and chng.sourceinstance = SRC.sourceinstance
/*on chng.chnglog = SRC2.issuechangelogid and chng.authorRef = SRC.authorRef and chng.issueid = SRC.issueid and chng.created = SRC.created
and chng.field = SRC2.field and chng.`to` = SRC2.`to` and chng.`from` = SRC2.`from` and chng.sourceinstance = SRC.sourceinstance*/
where SRC.cdctype <> 'D' and SRC2.field in ('status','sprint','timeoriginalestimate','Story Points','Business Value') and
TRIM(SUBSTRING_INDEX(COALESCE(SRC2.from,SRC2.fromstring,0),',',-1)) <> TRIM(SUBSTRING_INDEX(COALESCE(SRC2.to,SRC2.tostring,0),',',-1));


insert into #STG_TABLE_SCHEMA.issue_activity_temp
(sys_id, authorRef, issueid, created, sourceinstance, cdctype, 
id, fromstring, issuechangelogid, issue_cnglg_itm_issueid, issue_cnglg_itm_sourceinstance, 
issue_cnglg_itm_cdctype, `field`, `from`, `to`, tostring, inserted_on)

select concat(SRC.issueid, '~', case when SRC2.field = 'sprint' THEN 'ITERATION' ELSE upper(SRC2.field) END, '~', SRC2.issuechangelogid) as sys_id,
SRC.authorRef ,
SRC.issueid ,
SRC.created ,
SRC.sourceinstance ,
SRC.cdctype ,
SRC.id ,
TRIM(SRC2.fromstring) ,
SRC2.issuechangelogid ,
SRC2.issueid ,
SRC2.sourceinstance ,
SRC2.cdctype ,
case when SRC2.field = 'sprint' THEN 'ITERATION' ELSE upper(SRC2.field) END ,
SRC2.`from` ,
SRC2.`to` ,
TRIM(SRC2.tostring) ,
current_timestamp
FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and issue.sourceinstance = SRC.sourceinstance
join (
select min(SRC2.issuechangelogid) chnglog, SRC.issueid, SRC.created, SRC2.field, SRC2.`to`, SRC2.`from`, SRC.sourceinstance
FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
group by SRC.issueid, SRC.created, SRC2.field, SRC2.`to`, SRC2.`from`, SRC.sourceinstance
) chng
on chng.chnglog = SRC2.issuechangelogid and chng.issueid = SRC.issueid and chng.field = SRC2.field and chng.sourceinstance = SRC.sourceinstance
/*on chng.chnglog = SRC2.issuechangelogid and chng.authorRef = SRC.authorRef and chng.issueid = SRC.issueid and chng.created = SRC.created
and chng.field = SRC2.field and chng.`to` = SRC2.`to` and chng.`from` = SRC2.`from` and chng.sourceinstance = SRC.sourceinstance*/
where SRC.cdctype <> 'D' and SRC2.field in ('priority','assignee', 'resolution', 'issuetype', 'duedate', 'Project', 'Fix Version', 'summary') and
TRIM(COALESCE(SRC2.from,SRC2.fromstring,0)) <> TRIM(COALESCE(SRC2.to,SRC2.tostring,0));

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_activity_temp SRC
join (
 select main.issueid, main.issuechangelogid, main.field, main.created,main.sourceinstance,
 (
 select count(*) + 1
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) base
 where base.issueid = main.issueid and base.field = main.field and base.sourceinstance = main.sourceinstance and (main.created > base.created or (main.created = base.created and main.issuechangelogid > base.issuechangelogid))
 ) primary_sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) main
order by main.field, main.issueid, main.issuechangelogid
) SQ
on SRC.issueid = SQ.issueid and SRC.field = SQ.field and SRC.issuechangelogid = SQ.issuechangelogid and SRC.sourceinstance = SQ.sourceinstance
set SRC.primary_sequence_id = SQ.primary_sequence_id1;

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_activity_temp as SRC
join #STG_TABLE_SCHEMA.issue_activity_temp SRC_B
on SRC.issueid = SRC_B.issueid and SRC.field = SRC_B.field and SRC.`from` = SRC_B.`from` 
and SRC.`to` = SRC_B.`to` 
and SRC.issuechangelogid > SRC_B.issuechangelogid 
and SRC.primary_sequence_id = SRC_B.primary_sequence_id + 1
where SRC.field <> 'ITERATION';

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_activity_temp SRC
join (
 select main.issueid, main.issuechangelogid, main.field, main.created,main.sourceinstance,
 (
 select count(*) + 1
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) base
 where base.issueid = main.issueid and base.field = main.field and base.sourceinstance = main.sourceinstance and (main.created > base.created or (main.created = base.created and main.issuechangelogid > base.issuechangelogid))
 ) primary_sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) main
order by main.field, main.issueid, main.issuechangelogid
) SQ
on SRC.issueid = SQ.issueid and SRC.field = SQ.field and SRC.issuechangelogid = SQ.issuechangelogid and SRC.sourceinstance = SQ.sourceinstance
set SRC.primary_sequence_id = SQ.primary_sequence_id1;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_activity_temp SRC
join (
 select main.issueid, main.issuechangelogid, main.field, main.created,main.sourceinstance,
 (
 select count(*) + 1
 from (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) base
 where base.issueid = main.issueid and base.field = main.field and base.sourceinstance = main.sourceinstance and (main.created > base.created or (main.created = base.created and main.issuechangelogid > base.issuechangelogid))
 ) primary_sequence_id1
 from 
 (
 SELECT tmp.sys_id, tmp.issueid issueid, tmp.id, tmp.issuechangelogid, tmp.field, tmp.created, tmp.sourceinstance sourceinstance
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 ) main
order by main.field, main.issueid, main.issuechangelogid
) SQ
on SRC.issueid = SQ.issueid and SRC.field = SQ.field and SRC.issuechangelogid = SQ.issuechangelogid and SRC.sourceinstance = SQ.sourceinstance
set SRC.primary_sequence_id = SQ.primary_sequence_id1;

insert into #STG_TABLE_SCHEMA.issue_activity_temp
(sys_id, authorRef, issueid, created, sourceinstance, cdctype, 
id, fromstring, issuechangelogid, issue_cnglg_itm_issueid, issue_cnglg_itm_sourceinstance, 
issue_cnglg_itm_cdctype, `field`, `from`, `to`, tostring, inserted_on, primary_sequence_id)

select concat(issue.id, '~', tbl_task_attribute.task_attribute, '~', 0) as sys_id,
issue.creatorRef ,
issue.id as issueid,
issue.created ,
issue.sourceinstance as sourceinstance,
issue.cdctype cdctype,
issue.id as id,
null as fromstring ,
0 as issuechangelogid ,
issue.id as issue_cnglg_itm_issueid,
issue.sourceinstance issue_cnglg_itm_sourceinstance,
issue.cdctype issue_cnglg_itm_cdctype,
tbl_task_attribute.task_attribute as field ,
null as `from` ,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'STATUS' THEN LOV.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ITERATION' THEN ITE.row_id 
WHEN tbl_task_attribute.task_attribute = 'TIMEORIGINALESTIMATE' THEN LKP.originalestimateseconds 
WHEN tbl_task_attribute.task_attribute = 'STORY POINTS' THEN CASE WHEN ASCII(EXT.customfield_10004)>=49 AND ASCII(EXT.customfield_10004)<=57 THEN CAST(EXT.customfield_10004 AS DECIMAL(28,10)) ELSE NULL END
WHEN tbl_task_attribute.task_attribute = 'BUSINESS VALUE' THEN EXT.customfield_10005 
END
END as `to` ,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'STATUS' THEN LOV.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ITERATION' THEN ITE.row_id 
WHEN tbl_task_attribute.task_attribute = 'TIMEORIGINALESTIMATE' THEN LKP.originalestimateseconds 
WHEN tbl_task_attribute.task_attribute = 'STORY POINTS' THEN CASE WHEN ASCII(EXT.customfield_10004)>=49 AND ASCII(EXT.customfield_10004)<=57 THEN CAST(EXT.customfield_10004 AS DECIMAL(28,10)) ELSE NULL END
WHEN tbl_task_attribute.task_attribute = 'BUSINESS VALUE' THEN EXT.customfield_10005
END
END as tostring ,
current_timestamp,
0 as primary_sequence_id
FROM #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on issue.id = EXT.record_id and issue.sourceinstance = EXT.sourceinstance
left join
(
SELECT 'STATUS' task_attribute                       
UNION
SELECT 'ITERATION'  task_attribute   
UNION
SELECT 'TIMEORIGINALESTIMATE'  task_attribute  
UNION 
SELECT 'STORY POINTS'  task_attribute 
UNION
SELECT 'BUSINESS VALUE'  task_attribute                   
)  tbl_task_attribute                      
 ON 1=1 
left join #STG_TABLE_SCHEMA.issue_activity_temp tmp
ON issue.id=tmp.issueid 
AND issue.sourceinstance=tmp.sourceinstance 
AND tmp.primary_sequence_id=1 
AND tmp.field=tbl_task_attribute.task_attribute 
left join #DWH_TABLE_SCHEMA.d_lov LOV
ON ( CONCAT('STATUS','~','WORK_ITEM','~',UPPER(issue.status_id)) = LOV.src_rowid 
AND issue.sourceinstance=LOV.source_id 
AND LOV.dimension_class='STATUS~WORK_ITEM')
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.id, '')=D.row_id
and issue.sourceinstance=D.source_id 
LEFT JOIN #DWH_TABLE_SCHEMA.d_iteration ITE 
ON D.iteration_key=ITE.row_key 
AND D.source_id=ITE.source_id   
LEFT JOIN #MDS_TABLE_SCHEMA.issue_timetracking_final LKP
ON (issue.id = LKP.issueid 
AND issue.sourceinstance=LKP.sourceinstance);

drop table if exists #STG_TABLE_SCHEMA.issue_dates_temp;

create table if not exists #STG_TABLE_SCHEMA.issue_dates_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  resolution varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  resolved_by text COLLATE utf8_unicode_ci,
  cancelled_by text COLLATE utf8_unicode_ci,
  closed_by text COLLATE utf8_unicode_ci,
  created_by text COLLATE utf8_unicode_ci,
  issueid int(11) DEFAULT NULL,
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

insert into #STG_TABLE_SCHEMA.issue_dates_temp
(sys_id, sourceinstance, issueid, created_on, resolved_on, created_by, cdctype, inserted_on)
select SRC.id, SRC.sourceinstance, SRC.id, SRC.created, SRC.resolutiondate, SRC.creatorRef, SRC.cdctype, current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final SRC;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join #MDS_TABLE_SCHEMA.issue_final SRC
on SRC.id = temp.issueid and SRC.sourceinstance = temp.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map STS
on concat('STATUS~WORK_ITEM~',upper(SRC.status_id))=STS.src_rowid and SRC.sourceinstance = STS.source_id and STS.dimension_class = 'STATUS~WORK_ITEM'
set temp.`status` = STS.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join #MDS_TABLE_SCHEMA.issue_final SRC
on SRC.id = temp.issueid and SRC.sourceinstance = temp.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
set temp.resolution = RES.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as work_complete_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'

where lower(tmp.field) = 'status' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) compltd_dt
on temp.issueid=compltd_dt.issueid
and temp.sourceinstance=compltd_dt.sourceinstance

set temp.completed_on = case when temp.`status` = 'COMPLETED' then compltd_dt.work_complete_on else null end;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as resolved_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'

where lower(tmp.field) = 'status' and LM.dimension_wh_code='RESOLVED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) rslvd_dt
on temp.issueid=rslvd_dt.issueid
and temp.sourceinstance=rslvd_dt.sourceinstance

set temp.resolved_on_calc = case when temp.`status` in ('RESOLVED', 'COMPLETED') then rslvd_dt.resolved_on else null end;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join (
select tmp.issueid,tmp.sourceinstance,min(tmp.created) as work_start_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'
 
where lower(tmp.field) = 'status' and LM.dimension_wh_code='PROPOSED' and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) strtd_dt
 
on temp.issueid=strtd_dt.issueid
and temp.sourceinstance=strtd_dt.sourceinstance
set temp.work_start_on = strtd_dt.work_start_on;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join (
select tmp.issueid,tmp.sourceinstance,max(tmp.created) as cancelled_on
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on lower(tmp.field) = 'status' and concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'

 left join #DWH_TABLE_SCHEMA.d_lov_map RES
 on lower(tmp.field) = 'resolution' and concat('RESOLUTION~WORK_ITEM~',upper(tmp.to))=RES.src_rowid and tmp.sourceinstance = RES.source_id and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
 
where (LM.dimension_wh_code = 'CANCELLED' or RES.dimension_wh_code in ('CANCELLED')) and tmp.primary_sequence_id <>0
group by tmp.issueid,tmp.sourceinstance
) cancld_dt
on temp.issueid=cancld_dt.issueid
and temp.sourceinstance=cancld_dt.sourceinstance

set temp.cancelled_on = case when (temp.`status` in ('CANCELLED') AND (temp.resolution != 'CANCELLED' OR temp.resolution IS NULL)) then cancld_dt.cancelled_on
 when temp.`status` in ('RESOLVED','CANCELLED','COMPLETED') AND temp.resolution in ('CANCELLED') then COALESCE(temp.resolved_on,cancld_dt.cancelled_on) else null end,
 temp.cancelled_on_calc = cancld_dt.cancelled_on;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join (
select distinct tmp.issueid, tmp.sourceinstance, tmp.authorRef, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'
where tmp.field = 'STATUS' and tmp.primary_sequence_id <>0
) resolved_by
on resolved_by.issueid = temp.issueid and resolved_by.sourceinstance = temp.sourceinstance 
and temp.resolved_on_calc = resolved_by.created
set temp.resolved_by = case when temp.`status` not in ('RESOLVED', 'COMPLETED') then NULL
 when temp.`status` in ('RESOLVED', 'COMPLETED') and ASCII(COALESCE(resolved_by.authorRef,'')) = 0 THEN NULL 
 when temp.`status` in ('RESOLVED', 'COMPLETED') then resolved_by.authorRef else 'UNKNOWN' end;
 
 use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join 
(
select tmp.issueid, tmp.sourceinstance, LM.dimension_wh_code, tmp.authorRef, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'
where tmp.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and tmp.primary_sequence_id <>0
) closed
on closed.issueid = temp.issueid and closed.sourceinstance = temp.sourceinstance
and temp.completed_on = closed.created
set temp.closed_by = case when temp.`status` not in ('COMPLETED') then NULL
when temp.`status`='COMPLETED' then closed.authorRef
when ASCII(COALESCE(closed.authorRef,'')) = 0 THEN NULL else 'UNKNOWN' end;

update #STG_TABLE_SCHEMA.issue_dates_temp temp
left join 
(
select tmp.issueid, tmp.sourceinstance, tmp.authorRef, tmp.created
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on lower(tmp.field) = 'status' and concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM.src_rowid and tmp.sourceinstance = LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on lower(tmp.field) = 'resolution' and concat('RESOLUTION~WORK_ITEM~',upper(tmp.to))=RES.src_rowid and tmp.sourceinstance = RES.source_id and RES.dimension_class = 'RESOLUTION~WORK_ITEM'
 
where (LM.dimension_wh_code = 'CANCELLED' or RES.dimension_wh_code in ('CANCELLED')) and tmp.primary_sequence_id <>0
) cncld_by
on cncld_by.issueid = temp.issueid and cncld_by.sourceinstance = temp.sourceinstance
and temp.cancelled_on_calc = cncld_by.created
set temp.cancelled_by = case when temp.`status` in ('CANCELLED') and (temp.resolution != 'CANCELLED' OR temp.resolution IS NULL) then cncld_by.authorRef
when temp.`status` in ('RESOLVED', 'COMPLETED', 'CANCELLED') then case when temp.resolution in ('CANCELLED') then coalesce(temp.resolved_by, temp.closed_by, cncld_by.authorRef) else NULL end
when temp.`status` not in ('RESOLVED', 'COMPLETED', 'CANCELLED') THEN NULL
when ASCII(COALESCE(cncld_by.authorRef,'')) = 0 THEN NULL
else 'UNKNOWN' end;

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

insert into #STG_TABLE_SCHEMA.burn_down_temp
(sys_id, source_id, iteration_id, burn_on_key, started_on_key, work_item_id, work_item_key, 
 changed_on, changed_by, created_by, created_on, cdctype, soft_deleted_flag, inserted_on,
 is_added_count, is_removed_count, is_resolved_count, is_reopened_count)


select SQ.sys_id, SQ.source_id, SQ.iteration_id, SQ.burn_on_key, SQ.started_on_key, SQ.work_item_id, SQ.work_item_key, SQ.changed_on, SQ.changed_by, 
SQ.created_by, SQ.created_on, SQ.cdctype, SQ.soft_deleted_flag,current_timestamp,
  
sum(SQ.is_added) is_added_count, sum(SQ.is_removed) is_removed_count, sum(SQ.is_resolved) is_resolved_count, sum(SQ.is_reopened) is_reopened_count

from (
select concat(DIT.row_id,'~',CAL.row_key,'~0') sys_id, 
DIT.row_id iteration_id, CAL.row_key as burn_on_key, CAL.row_key as started_on_key, 0 work_item_id, DIT.source_id, 0 as work_item_key, DIT.changed_on as changed_on, DIT.changed_by as changed_by, 
DIT.created_by as created_by, DIT.created_on as created_on, DIT.cdctype cdctype, DIT.soft_deleted_flag,

0 AS is_added,
0 AS is_removed,
0 AS is_reopened,
0 AS is_resolved  

FROM #DWH_TABLE_SCHEMA.d_iteration DIT      
JOIN #DWH_TABLE_SCHEMA.d_calendar_date CAL 
ON CAL.calendar_date BETWEEN DATE(DIT.start_date)  AND 
DATE(coalesce(DIT.completion_date, DIT.end_date)) AND DIT.row_key>0 
LEFT JOIN #STG_TABLE_SCHEMA.burn_down_temp burn_down 
ON DIT.row_id = burn_down.iteration_id and DIT.source_id = burn_down.source_id
AND CAL.row_key=burn_down.burn_on_key  
AND burn_down.work_item_key <> 0
WHERE burn_down.sys_id is null
) SQ
group by SQ.sys_id;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.burn_down_temp temp_removed
join #STG_TABLE_SCHEMA.burn_down_temp temp_resolved
on temp_removed.work_item_key = temp_resolved.work_item_key
and temp_removed.iteration_id = temp_resolved.iteration_id
and temp_removed.source_id = temp_resolved.source_id
and temp_removed.is_removed_count > 0
and temp_resolved.is_resolved_count > 0
set temp_removed.is_removed_count = 0
where temp_removed.burn_on_key >= temp_resolved.burn_on_key;

drop table if exists #STG_TABLE_SCHEMA.issue_changelog_link_temp;
create table if not exists #STG_TABLE_SCHEMA.issue_changelog_link_temp
(
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  log_key int(15) DEFAULT NULL,
  parent_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_type_id bigint(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  parent_precedence varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_type_id bigint(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_val varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL ,
  issue_field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `from` text COLLATE utf8_unicode_ci,
  fromstring text COLLATE utf8_unicode_ci,
  `to` text COLLATE utf8_unicode_ci,
  tostring text COLLATE utf8_unicode_ci,
  link_created datetime DEFAULT NULL,
  cdctime datetime DEFAULT NULL,
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT 'X',
  sequence_id int(11) DEFAULT 0,
  parent_preference_id int(11) DEFAULT 0,
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  
  index lnk_typ_idx (link_type, sourceinstance),
  index chld_wi_idx (child_wi_number, sourceinstance),
  index par_wi_idx (parent_wi_number, sourceinstance),
  index chld_wi_typ_idx (child_type_id, sourceinstance),
  index par_wi_typ_idx (parent_type_id, sourceinstance),
  index seq_id_idx (child_id, link_type, log_key, sourceinstance),
  index parent_prec_idx (parent_id, sourceinstance),
  index epic_link_idx (child_id, sourceinstance)
)
;

insert into #STG_TABLE_SCHEMA.issue_changelog_link_temp 
(sys_id, log_key, child_id, child_wi_number, child_type_id, parent_id, parent_wi_number, parent_type_id, sourceinstance, cdctype, issue_field, link_type, cdctime, `from`, fromstring, `to`, tostring, link_created, inserted_on)

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', chnglogitems.field) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_to_id.id parent_id, 
issue_to_id.`key` parent_wi_number,
issue_to_id.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
chnglogitems.field as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to_id
on COALESCE(chnglogitems.`to`, '') = issue_to_id.id and chnglogitems.sourceinstance = issue_to_id.sourceinstance
where field in ('Epic Link')

union all

select concat(issue.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', chnglogitems.field) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_to_id.id parent_id, 
issue_to_id.`key` parent_wi_number, 
issue_to_id.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
chnglogitems.field as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to_id
on COALESCE(chnglogitems.`to`, '') = issue_to_id.id and chnglogitems.sourceinstance = issue_to_id.sourceinstance
where field in ('Parent')

union all

select concat(issue_to.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue_to.id child_id, 
COALESCE(issue_to.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) child_wi_number,
issue_to.issuetype_id as child_type_id, 
issue.id as parent_id, 
issue.`key` as parent_wi_number, 
issue.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1)) as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to
on COALESCE(chnglogitems.`to`, '') = issue_to.id and chnglogitems.sourceinstance = issue_to.sourceinstance
where chnglogitems.field in ('Link') and 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))
in ('is implemented by')

union all

select concat(issue_to.id, '~', coalesce(chnglogitems.issuechangelogid, 0), '~', TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))) as sys_id,
chnglogitems.issuechangelogid as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_to.id parent_id, 
COALESCE(issue_to.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number,
issue_to.issuetype_id as parent_type_id, 
chnglog.sourceinstance as sourceinstance, 
chnglog.cdctype as cdctype, 
chnglogitems.field as issue_field, 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1)) as link_type, 
chnglog.cdctime as cdctime, 
chnglogitems.`from` as `from`, 
chnglogitems.fromstring as fromstring, 
chnglogitems.`to` as `to`, 
chnglogitems.tostring as tostring,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance 
left join #MDS_TABLE_SCHEMA.issue_final issue_to
on COALESCE(chnglogitems.`to`, '') = issue_to.id and chnglogitems.sourceinstance = issue_to.sourceinstance
where chnglogitems.field in ('Link') and 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.tostring, 'This issue ', ''), issue.`key`, ''), SUBSTRING_INDEX( chnglogitems.tostring, ' ', -1 ), 1))
in ('Parent');

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
join #MDS_TABLE_SCHEMA.issue_final parent_issue
on base.parent_wi_number = parent_issue.`key` and base.sourceinstance = parent_issue.sourceinstance and parent_issue.cdctype <> 'D'
set base.parent_id = parent_issue.id, base.parent_type_id = parent_issue.issuetype_id
where base.parent_id is null;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
join #MDS_TABLE_SCHEMA.issue_final child_issue
on base.child_wi_number = child_issue.`key` and base.sourceinstance = child_issue.sourceinstance and child_issue.cdctype <> 'D'
set base.child_id = child_issue.id, base.child_type_id = child_issue.issuetype_id
where base.child_id is null;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
set base.sys_id = concat(base.child_id, '~', base.log_key, '~', base.issue_field);

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #MDS_TABLE_SCHEMA.issue_final child_issue
on base.child_wi_number = child_issue.`key` and base.sourceinstance = child_issue.sourceinstance
set base.invalid_flag = 'Y'
where (child_issue.id is null and base.child_id is null) or child_issue.cdctype = 'D';

delete from #STG_TABLE_SCHEMA.issue_changelog_link_temp
where child_id is null;

alter table #STG_TABLE_SCHEMA.issue_changelog_link_temp
add PRIMARY KEY pk (sys_id, sourceinstance);

insert into #STG_TABLE_SCHEMA.issue_changelog_link_temp
(sys_id, log_key, child_id, child_wi_number, child_type_id, parent_id, parent_wi_number, parent_type_id, sourceinstance, cdctype, issue_field, link_type, cdctime, `from`, fromstring, `to`, tostring, link_created, inserted_on)

select concat(issue.id, '~', coalesce(issue.id, 0), '~', 'Epic Link') as sys_id,
issue.id as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_parent.id as parent_id, 
EXT.customfield_10008 parent_wi_number,
issue_parent.issuetype_id as parent_type_id, 
issue.sourceinstance as sourceinstance, 
issue.cdctype as cdctype, 
'Epic Link' as issue_field, 
'Epic Link' as link_type, 
issue.cdctime as cdctime, 
issue.id as `from`, 
issue.`key` as fromstring, 
issue_parent.id as `to`, 
EXT.customfield_10008 as tostring,
issue.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on issue.id = EXT.record_id and issue.sourceinstance = EXT.sourceinstance
join #MDS_TABLE_SCHEMA.issue_final issue_parent
on EXT.customfield_10008 = issue_parent.`key` and issue.sourceinstance = issue_parent.sourceinstance
where EXT.customfield_10008 is not null and 
(issue.id, issue.sourceinstance) not in 
(select TMP.child_id, TMP.sourceinstance
from #STG_TABLE_SCHEMA.issue_changelog_link_temp TMP
where TMP.issue_field = 'Epic Link');

insert into #STG_TABLE_SCHEMA.issue_changelog_link_temp
(sys_id, log_key, child_id, child_wi_number, child_type_id, parent_id, parent_wi_number, parent_type_id, sourceinstance, cdctype, issue_field, link_type, cdctime, `from`, fromstring, `to`, tostring, link_created, inserted_on)

select concat(issue.id, '~', coalesce(issue.id, 0), '~', 'Parent') as sys_id,
issue.id as log_key, 
issue.id as child_id, 
issue.`key` as child_wi_number, 
issue.issuetype_id as child_type_id, 
issue_parent.id as parent_id, 
issue_parent.`key` parent_wi_number,
issue_parent.issuetype_id as parent_type_id, 
issue.sourceinstance as sourceinstance, 
issue.cdctype as cdctype, 
'Parent' as issue_field, 
'Parent' as link_type, 
issue.cdctime as cdctime, 
issue.id as `from`, 
issue.`key` as fromstring, 
issue_parent.id as `to`, 
issue_parent.`key` as tostring,
issue.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_final issue_parent
on issue.parent_id = issue_parent.id and issue.sourceinstance = issue_parent.sourceinstance
where issue.parent_id is not null and 
(issue.id, issue.sourceinstance) not in 
(select TMP.child_id, TMP.sourceinstance
from #STG_TABLE_SCHEMA.issue_changelog_link_temp TMP
where TMP.link_type = 'Parent');

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map child_wi_type
on concat('TYPE~WORK_ITEM~',upper(base.child_type_id)) = child_wi_type.src_rowid and base.sourceinstance = child_wi_type.source_id and child_wi_type.dimension_class = 'TYPE~WORK_ITEM'
set base.child_type = child_wi_type.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_type
on concat('TYPE~WORK_ITEM~',upper(base.parent_type_id)) = parent_wi_type.src_rowid and base.sourceinstance = parent_wi_type.source_id and parent_wi_type.dimension_class = 'TYPE~WORK_ITEM'
set base.parent_type = parent_wi_type.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map parent_wi_precedence
on concat('TYPE_LINK_PRECEDENCE~WORK_ITEM','~',upper(base.parent_type_id)) = parent_wi_precedence.src_rowid 
and base.sourceinstance=parent_wi_precedence.source_id and parent_wi_precedence.dimension_class = 'TYPE_LINK_PRECEDENCE~WORK_ITEM'
set base.parent_precedence = parent_wi_precedence.dimension_wh_code;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~',base.link_type) = link_type.src_rowid 
and base.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
set base.link_val = link_type.dimension_wh_code;

use #STG_TABLE_SCHEMA;

delete from #STG_TABLE_SCHEMA.issue_changelog_link_temp
where invalid_flag = 'Y';


use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select main.log_key, main.child_id,  main.parent_id, main.link_type, main.link_created,main.sourceinstance, main.parent_precedence,
(
select count(*) + 1
from (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
) base
where base.child_id = main.child_id and base.sourceinstance = main.sourceinstance and main.link_type = base.link_type 
 and (main.link_created > base.link_created or (main.link_created = base.link_created and main.log_key > base.log_key))
) sequence_id1
from 
 (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
) main
order by main.child_id,  main.parent_id, main.log_key
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type and SRC.log_key = SQ.log_key and SRC.sourceinstance = SQ.sourceinstance
set SRC.sequence_id = SQ.sequence_id1;

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_changelog_link_temp as SRC
join #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC_B
on SRC.child_id = SRC_B.child_id and SRC.parent_id = SRC_B.parent_id and SRC.link_type = SRC_B.link_type 
and SRC.issue_field = SRC_B.issue_field 
and SRC.log_key < SRC_B.log_key
and SRC.sequence_id + 1 = SRC_B.sequence_id;


drop table if exists #STG_TABLE_SCHEMA.parent_removed_temp;

create table if not exists #STG_TABLE_SCHEMA.parent_removed_temp (
  log_key int(15) DEFAULT NULL,
  old_parent_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  old_parent_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  child_wi_number varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_val varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL ,
  issue_field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
    
  PRIMARY KEY (log_key, sourceinstance)
);

insert into #STG_TABLE_SCHEMA.parent_removed_temp
(log_key, child_id, child_wi_number, old_parent_id, old_parent_wi_number, sourceinstance, link_type, link_val, issue_field, link_created, inserted_on)

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, coalesce(issue_from_id.id, issue_from_key.id) parent_id, coalesce(issue_from_id.`key`, SUBSTRING_INDEX(chnglogitems.tostring, ' ', -1)) parent_wi_number, 
coalesce(issue_from_id.sourceinstance, issue_from_key.sourceinstance, issue.sourceinstance) sourceinstance, chnglogitems.field as link_type, null as link_val, chnglogitems.`field` as issue_field, chnglog.created as link_created, current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_from_key
on COALESCE(chnglogitems.tostring, '') = issue_from_key.`key` and chnglogitems.sourceinstance = issue_from_key.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_from_id
on COALESCE(chnglogitems.`to`, '') = issue_from_id.id and chnglogitems.sourceinstance = issue_from_id.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', chnglogitems.field) = link_type.src_rowid and chnglogitems.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
where chnglogitems.`field` in ('Epic Link', 'Parent')
and link_type.dimension_wh_code in ('EPIC', 'PARENT')
and issue.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)

union all

select chnglogitems.issuechangelogid as log_key, issue_child.id child_id, SUBSTRING_INDEX(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1) child_wi_number, 
issue.id parent_id, issue.`key` parent_wi_number, issue.sourceinstance sourceinstance,
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1)) as link_type, null as link_val, 
chnglogitems.`field` as issue_field, 
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_child
on COALESCE(chnglogitems.`to`, chnglogitems.`from`) = issue_child.`key` and chnglogitems.sourceinstance = issue_child.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(COALESCE(chnglogitems.tostring, chnglogitems.fromstring), 'This issue ', ''), issue_child.`key`, ''), SUBSTRING_INDEX( COALESCE(chnglogitems.tostring, chnglogitems.fromstring), ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid and chnglogitems.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('IMPLEMENTED_BY')
and issue_child.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)

union all

select chnglogitems.issuechangelogid as log_key, issue.id child_id, issue.`key` child_wi_number, issue_parent.id parent_id, SUBSTRING_INDEX(COALESCE(chnglogitems.fromstring, ''), ' ', -1) parent_wi_number, issue_parent.sourceinstance sourceinstance,
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1)) as link_type, null as link_val, chnglogitems.`field` as issue_field,
chnglog.created as link_created,
current_timestamp as inserted_on
from #MDS_TABLE_SCHEMA.issue_final issue
left join #MDS_TABLE_SCHEMA.issue_changelog_final chnglog
on chnglog.issueid = issue.id and chnglog.sourceinstance = issue.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final chnglogitems
on chnglogitems.issuechangelogid = chnglog.id and chnglogitems.sourceinstance = chnglog.sourceinstance
left join #MDS_TABLE_SCHEMA.issue_final issue_parent
on COALESCE(chnglogitems.`from`, '') = issue_parent.`key` and chnglogitems.sourceinstance = issue_parent.sourceinstance
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~', case when chnglogitems.field = 'link' then 
TRIM(SUBSTRING_INDEX(REPLACE(REPLACE(chnglogitems.fromstring, 'This issue ', ''), issue_parent.`key`, ''), SUBSTRING_INDEX( chnglogitems.fromstring, ' ', -1 ), 1))
else chnglogitems.field end) = link_type.src_rowid and chnglogitems.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
where chnglogitems.`field` in ('Link')
and link_type.dimension_wh_code in ('PARENT')
and issue_parent.id is not null and (chnglogitems.tostring is null or chnglogitems.`to` is null)
order by child_id, child_wi_number, issue_field;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.parent_removed_temp base
left join #DWH_TABLE_SCHEMA.d_lov_map link_type
on concat('LINK_TYPE~WORK_ITEM~',base.link_type) = link_type.src_rowid 
and base.sourceinstance=link_type.source_id and link_type.dimension_class = 'LINK_TYPE~WORK_ITEM'
set base.link_val = link_type.dimension_wh_code;

use #STG_TABLE_SCHEMA;

delete hier
from #STG_TABLE_SCHEMA.issue_changelog_link_temp hier
join #STG_TABLE_SCHEMA.parent_removed_temp removed_parent
on hier.child_id = removed_parent.child_id and hier.parent_id = removed_parent.old_parent_id and coalesce(hier.link_type, hier.link_val) = coalesce(removed_parent.link_type, removed_parent.link_val) and hier.sourceinstance = removed_parent.sourceinstance
and removed_parent.link_created > hier.link_created and removed_parent.log_key > hier.log_key;

use #STG_TABLE_SCHEMA;

delete SRC
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val, max(tmp.sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp 
where tmp.link_type = 'Epic Link'
group by tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val
) SQ
on SRC.child_id = SQ.child_id and SRC.child_wi_number = SQ.child_wi_number and SRC.link_type = SQ.link_type and SRC.sequence_id < SQ.max_sequence_id
where SRC.link_type = 'Epic Link';

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val, min(tmp.sequence_id) max_sequence_id
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp 
where tmp.issue_field = 'Parent'
group by tmp.child_id, tmp.child_wi_number, tmp.link_type, tmp.link_val
) SQ
on SRC.child_id = SQ.child_id and SRC.child_wi_number = SQ.child_wi_number and SRC.link_type = SQ.link_type and SRC.link_val = SQ.link_val and SRC.sequence_id > SQ.max_sequence_id
where SRC.issue_field = 'Parent';

drop table if exists #STG_TABLE_SCHEMA.issue_changelog_link_temp_bkp;

create table #STG_TABLE_SCHEMA.issue_changelog_link_temp_bkp select * from #STG_TABLE_SCHEMA.issue_changelog_link_temp;

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select SRC.child_id, SRC.link_type
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select child_id, link_type, max(sequence_id) as max_sequence_id
from #STG_TABLE_SCHEMA.issue_changelog_link_temp
where link_type in ('Epic Link', 'Parent')
group by child_id, link_type
) base
on SRC.child_id = base.child_id and SRC.link_type = base.link_type and SRC.sequence_id = base.max_sequence_id
where SRC.link_type in ('Epic Link', 'Parent') and SRC.parent_id is null
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type
where SRC.link_type in ('Epic Link', 'Parent');

use #STG_TABLE_SCHEMA;

delete SRC 
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
where SRC.child_id = SRC.parent_id;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select main.log_key, main.child_id,  main.parent_id, main.link_type, main.link_created, main.sourceinstance, main.parent_precedence,
(
select count(*) + 1
from (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
) base
where base.child_id = main.child_id and base.sourceinstance = main.sourceinstance 
  and (CAST(main.parent_precedence AS UNSIGNED) < CAST(base.parent_precedence AS UNSIGNED) or (CAST(main.parent_precedence AS UNSIGNED) = CAST(base.parent_precedence AS UNSIGNED) and (main.link_created > base.link_created or (main.link_created = base.link_created and main.log_key > base.log_key))))
) parent_preference_id1
from 
 (
SELECT tmp.log_key, tmp.child_id child_id, tmp.parent_id parent_id, tmp.link_type, tmp.link_val, tmp.link_created, tmp.sourceinstance sourceinstance, tmp.parent_precedence
FROM #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
) main
order by main.child_id,  main.parent_id, main.log_key
) SQ
on SRC.child_id = SQ.child_id and SRC.link_type = SQ.link_type and SRC.log_key = SQ.log_key and SRC.sourceinstance = SQ.sourceinstance
set SRC.parent_preference_id = SQ.parent_preference_id1;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
join (
select SRC.child_id, SRC.sourceinstance, count(SRC.parent_id) parent_count
from #STG_TABLE_SCHEMA.issue_changelog_link_temp SRC
group by SRC.child_id, SRC.sourceinstance
having count(SRC.parent_id) > 1
) base
on SRC.child_id = base.child_id and SRC.sourceinstance = base.sourceinstance
set SRC.invalid_flag = 'Y';

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp main
join 
(
select log_key, child_id, invalid_flag from #STG_TABLE_SCHEMA.issue_changelog_link_temp base 
where (child_id, parent_preference_id) in 
(select child_id, min(parent_preference_id) from #STG_TABLE_SCHEMA.issue_changelog_link_temp where invalid_flag = 'Y' group by child_id)
) SQ
on SQ.log_key = main.log_key and SQ.child_id = main.child_id and SQ.invalid_flag = main.invalid_flag
set main.invalid_flag = 'N';

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.issue_changelog_link_temp main
set main.invalid_flag = 'Y'
where main.parent_id is null;

drop table if exists #STG_TABLE_SCHEMA.hier_base;

create table if not exists #STG_TABLE_SCHEMA.hier_base (
  base_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_top_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  cyclic_level int(15) DEFAULT 0,
  from_cyclic_level int(15) DEFAULT 99,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  link_type varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  link_created datetime DEFAULT NULL,
  curr_level int(15) DEFAULT 0,
  inserted_on datetime DEFAULT NULL,
  
  PRIMARY KEY (base_id, sourceinstance)
);

alter table #STG_TABLE_SCHEMA.hier_base
add index lev_6_idx (lev_6_id, sourceinstance),
add index lev_5_idx (lev_5_id, sourceinstance),
add index lev_4_idx (lev_4_id, sourceinstance),
add index lev_3_idx (lev_3_id, sourceinstance),
add index lev_2_idx (lev_2_id, sourceinstance),
add index lev_1_idx (lev_1_id, sourceinstance),
add index sys_idx (sys_id, sourceinstance),
add index cyclic_lev_idx (cyclic_level, sourceinstance);

-- Lev 0 & 1 -- 
insert into #STG_TABLE_SCHEMA.hier_base
(base_id, log_key, sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, is_top_flag, sourceinstance, link_type, link_created, curr_level, inserted_on)

select tmp.sys_id, tmp.log_key, CONCAT(tmp.child_id, '~WORK_ITEM'), tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.child_id, tmp.parent_id,
'N', tmp.sourceinstance, tmp.link_type, link_created, 1 as curr_level, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
where tmp.invalid_flag = 'N';


drop table if exists #STG_TABLE_SCHEMA.hier_data_temp;

create table if not exists #STG_TABLE_SCHEMA.hier_data_temp (
  base_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  driver_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  inserted_on datetime DEFAULT NULL 
  
  , PRIMARY KEY (driver_id, base_id, sourceinstance)
  , index parent_prec_idx (sys_id, sourceinstance)
);

insert into #STG_TABLE_SCHEMA.hier_data_temp
(base_id, log_key, sys_id, driver_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, sourceinstance, inserted_on)

select distinct tmp_lev1.sys_id, tmp_lev1.log_key, CONCAT(tmp_lev1.child_id, '~WORK_ITEM') as sys_id,
concat(tmp_lev1.child_id, coalesce(tmp_lev1.parent_id, ''), coalesce(tmp_lev2.parent_id, ''), coalesce(tmp_lev3.parent_id, ''), coalesce(tmp_lev4.parent_id, ''), coalesce(tmp_lev5.parent_id, ''), coalesce(tmp_lev6.parent_id, '')) as driver_id, tmp_lev1.child_id lev_0_id, tmp_lev1.parent_id lev_1_id, tmp_lev2.parent_id lev_2_id, tmp_lev3.parent_id lev_3_id, 
tmp_lev4.parent_id lev_4_id, tmp_lev5.parent_id lev_5_id, tmp_lev6.parent_id lev_6_id, 
tmp_lev1.sourceinstance, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev1
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev2
on tmp_lev1.parent_id = tmp_lev2.child_id and tmp_lev1.invalid_flag = 'N' and tmp_lev2.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev3
on tmp_lev2.parent_id = tmp_lev3.child_id and tmp_lev3.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev4
on tmp_lev3.parent_id = tmp_lev4.child_id and tmp_lev4.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev5
on tmp_lev4.parent_id = tmp_lev5.child_id and tmp_lev5.invalid_flag = 'N'
left join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp_lev6
on tmp_lev5.parent_id = tmp_lev6.child_id and tmp_lev6.invalid_flag = 'N'
where tmp_lev1.invalid_flag = 'N' 
order by tmp_lev1.log_key;

-- base lev 0 --

update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_0_id = base.lev_2_id then 2
when base.lev_0_id = base.lev_3_id then 3
when base.lev_0_id = base.lev_4_id then 4
when base.lev_0_id = base.lev_5_id then 5 
when base.lev_0_id = base.lev_6_id then 6 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on hier_base.base_id = SQ.base_id and hier_base.sourceinstance = SQ.sourceinstance
set hier_base.is_cyclic_flag = case when SQ.cycle_level > 0 then 'Y' else 'N' end, hier_base.cyclic_level = SQ.cycle_level, hier_base.from_cyclic_level = 0;

-- base lev 1 --

update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_1_id = base.lev_3_id then 3
when base.lev_1_id = base.lev_4_id then 4
when base.lev_1_id = base.lev_5_id then 5 
when base.lev_1_id = base.lev_6_id then 6 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on hier_base.base_id = SQ.base_id and hier_base.sourceinstance = SQ.sourceinstance
set hier_base.is_cyclic_flag = case when hier_base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
hier_base.cyclic_level = case when hier_base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < hier_base.cyclic_level then SQ.cycle_level else hier_base.cyclic_level end, hier_base.from_cyclic_level = 1;

-- base lev 2 --

update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_2_id = base.lev_4_id then 4
when base.lev_2_id = base.lev_5_id then 5 
when base.lev_2_id = base.lev_6_id then 6 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on hier_base.base_id = SQ.base_id and hier_base.sourceinstance = SQ.sourceinstance
set hier_base.is_cyclic_flag = case when hier_base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
hier_base.cyclic_level = case when hier_base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < hier_base.cyclic_level then SQ.cycle_level else hier_base.cyclic_level end, hier_base.from_cyclic_level = 2;

-- base lev 3 --

update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_3_id = base.lev_5_id then 5 
when base.lev_3_id = base.lev_6_id then 6 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on hier_base.base_id = SQ.base_id and hier_base.sourceinstance = SQ.sourceinstance
set hier_base.is_cyclic_flag = case when hier_base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
hier_base.cyclic_level = case when hier_base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < hier_base.cyclic_level then SQ.cycle_level else hier_base.cyclic_level end, hier_base.from_cyclic_level = 3;

-- base lev 4 --

update #STG_TABLE_SCHEMA.hier_base hier_base
join (
select base.base_id, base.sys_id, base.sourceinstance,
case 
when base.lev_4_id = base.lev_6_id then 6 end as cycle_level
from #STG_TABLE_SCHEMA.hier_data_temp base
) SQ
on hier_base.base_id = SQ.base_id and hier_base.sourceinstance = SQ.sourceinstance
set hier_base.is_cyclic_flag = case when hier_base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
hier_base.cyclic_level = case when hier_base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < hier_base.cyclic_level then SQ.cycle_level else hier_base.cyclic_level end, hier_base.from_cyclic_level = 4;

-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 1
set bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 2
set bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 3
set bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 4
set bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';

-- Lev 6 -- 
update #STG_TABLE_SCHEMA.hier_base bs
join #STG_TABLE_SCHEMA.issue_changelog_link_temp tmp
on tmp.child_id = bs.lev_6_id and tmp.sourceinstance = bs.sourceinstance and bs.curr_level = 5
set bs.lev_1_id = bs.lev_2_id, bs.lev_2_id = bs.lev_3_id, bs.lev_3_id = bs.lev_4_id, bs.lev_4_id = bs.lev_5_id, bs.lev_5_id = bs.lev_6_id, bs.lev_6_id = tmp.parent_id, bs.curr_level = bs.curr_level + 1, bs.inserted_on = current_timestamp
where tmp.invalid_flag = 'N';


-- Cyclic --
-- Lev 2 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_0_id, bs.lev_5_id = bs.lev_0_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 1;

-- Lev 3 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_1_id, bs.lev_5_id = bs.lev_0_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 2;

-- Lev 4 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_2_id, bs.lev_5_id = bs.lev_1_id, bs.lev_4_id = bs.lev_0_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 3;

-- Lev 5 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_3_id, bs.lev_5_id = bs.lev_2_id, bs.lev_4_id = bs.lev_1_id, bs.lev_3_id = bs.lev_0_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 4;

-- Lev 6 -- 
update #STG_TABLE_SCHEMA.hier_base bs
set bs.lev_6_id = bs.lev_4_id, bs.lev_5_id = bs.lev_3_id, bs.lev_4_id = bs.lev_2_id, bs.lev_3_id = bs.lev_1_id, bs.lev_2_id = bs.lev_0_id, bs.lev_1_id = bs.lev_0_id, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 5;

-- breaking hierarchy if cyclic is forming same precedence hierarchy or lower precedence hierarchy --

update #STG_TABLE_SCHEMA.hier_base hier
join (
select distinct hier.log_key, hier.sys_id, hier.lev_5_id, CAST(lev_5_parent_prec.parent_precedence AS UNSIGNED) lev_5_parent_precedence, hier.lev_6_id, CAST(lev_6_parent_prec.parent_precedence AS UNSIGNED) lev_6_parent_precedence, 
case when hier.cyclic_level = 2 then base.lev_2_id 
     when hier.cyclic_level = 3 then base.lev_3_id
     when hier.cyclic_level = 4 then base.lev_4_id
     when hier.cyclic_level = 5 then base.lev_5_id
     when hier.cyclic_level = 6 then base.lev_6_id
end as cyclic_lev_id, CAST(cyclic_lev_parent_prec.parent_precedence AS UNSIGNED) cyclic_lev_parent_precedence
from #STG_TABLE_SCHEMA.hier_base hier
join #STG_TABLE_SCHEMA.issue_changelog_link_temp lev_6_parent_prec
on lev_6_parent_prec.parent_id = hier.lev_6_id and lev_6_parent_prec.sourceinstance = hier.sourceinstance
join #STG_TABLE_SCHEMA.issue_changelog_link_temp lev_5_parent_prec
on lev_5_parent_prec.parent_id = hier.lev_5_id and lev_5_parent_prec.sourceinstance = hier.sourceinstance
join #STG_TABLE_SCHEMA.hier_data_temp base
on hier.sys_id = base.sys_id and hier.sourceinstance = base.sourceinstance
join #STG_TABLE_SCHEMA.issue_changelog_link_temp cyclic_lev_parent_prec
on cyclic_lev_parent_prec.parent_id = 
case when hier.cyclic_level = 2 then base.lev_2_id 
     when hier.cyclic_level = 3 then base.lev_3_id
     when hier.cyclic_level = 4 then base.lev_4_id
     when hier.cyclic_level = 5 then base.lev_5_id
     when hier.cyclic_level = 6 then base.lev_6_id
end
 and cyclic_lev_parent_prec.sourceinstance = hier.sourceinstance
where hier.is_cyclic_flag = 'Y'
) SQ
on SQ.log_key = hier.log_key and SQ.sys_id = hier.sys_id
set hier.lev_6_id = hier.lev_5_id, hier.lev_5_id = hier.lev_4_id, hier.lev_4_id = hier.lev_3_id, hier.lev_3_id = hier.lev_2_id, hier.lev_2_id = hier.lev_1_id, hier.lev_1_id = hier.lev_0_id
where (SQ.lev_5_parent_precedence = SQ.lev_6_parent_precedence = SQ.cyclic_lev_parent_precedence) 
or ((SQ.lev_5_parent_precedence <= SQ.lev_6_parent_precedence) and (SQ.lev_6_parent_precedence >= SQ.cyclic_lev_parent_precedence));



-- Weekly base table creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp;

create table if not exists #STG_TABLE_SCHEMA.history_snapshot_weekly_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  n_date date DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_weeks int(15) DEFAULT 0,
  wi_number varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  summary varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  age_since_creation int(20) DEFAULT 0,
  assignee varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  project varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  wi_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  work_item_status varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_resolution varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_iteration_key int(15) DEFAULT 0,
  work_item_earliest_fixed_version_key varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_priority varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  reassignment_count int(15) DEFAULT 0,
  reopen_count int(15) DEFAULT 0,
  reopened_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  overdue_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  in_progress_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  proposed_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  resolved_on datetime DEFAULT NULL,
  due_on datetime DEFAULT NULL,
  in_progress_on datetime DEFAULT NULL,
  completed_on datetime DEFAULT NULL,
  last_updated_on datetime DEFAULT NULL,
  business_value DECIMAL(28,10) DEFAULT NULL,
  cancelled_on DATETIME DEFAULT NULL,
  story_points DECIMAL(28,10) DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  changed_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT null,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL
);

insert into #STG_TABLE_SCHEMA.history_snapshot_weekly_temp

(issueid, wi_number, n_date, n_key, lagging_count_of_weeks, summary, wi_type, sourceinstance, due_on,
assignee, project, work_item_status, work_item_resolution, work_item_iteration_key, work_item_earliest_fixed_version_key, work_item_priority, 
business_value, story_points, created_on, created_by, changed_on, changed_by, cdctype, to_delete_flag, inserted_on, updated_on)

select issue.id, issue.`key`, calendar.calendar_date as n_date, calendar.row_key as n_key, calendar.lagging_count_of_weeks, 
issue.summary, issue.issuetype_id, issue.sourceinstance, convert_tz(issue.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as due_on, issue.assigneeRef, issue.project_id, issue.status_id, issue.resolution_id, D.iteration_key, D.earliest_fixed_version_key,
issue.priority_id, round(EXT.customfield_10005,10) as business_value, EXT.customfield_10004 as story_points, issue.created, issue.creatorRef, issue.updated, issue.creatorRef, issue.cdctype, 
'N' as to_delete_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on issue.id = EXT.record_id and issue.sourceinstance = EXT.sourceinstance
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.id, '')=D.row_id and issue.sourceinstance=D.source_id
cross join (
select distinct CAL_WK.calendar_date, CAL_WK.row_key, CAL.lagging_count_of_weeks
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL_WK
ON (date_format(CAL.week_start_date,'%Y%m%d') = CAL_WK.row_id)
join (select source_id, current_flag, target_table, retention, subject_area, calendar_code, day_of_week_month 
from #STG_TABLE_SCHEMA.lsm_ls_dw_aggregator where target_table = 'f_work_item_snapshot_weekly' and subject_area = 'JIRA') lsm_aggregator
on CAL.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = 'f_work_item_snapshot_weekly' and lsm_aggregator.subject_area = 'JIRA' 
where CAL.lagging_count_of_weeks between 1 and lsm_aggregator.retention) calendar;

alter table #STG_TABLE_SCHEMA.history_snapshot_weekly_temp
ADD PRIMARY KEY (issueid, sourceinstance, n_key),
ADD INDEX first_idx (issueid,sourceinstance) USING BTREE,
ADD INDEX second_idx (issueid,sourceinstance,n_key) USING BTREE,
ADD INDEX third_idx (n_key) USING BTREE;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (base.n_key = CAL.row_key)
set base.to_delete_flag = 'Y', base.updated_on = current_timestamp
where date_format(convert_tz(base.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(CAL.week_end_date, '%Y-%m-%d'); 

use #STG_TABLE_SCHEMA;

delete base
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
where base.to_delete_flag = 'Y';

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
set sys_id = concat(issueid, '~', n_key);

-- Weekly changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.weekly_changelog_id;

create table if not exists #STG_TABLE_SCHEMA.weekly_changelog_id 

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field, max(chnglog.issuechangelogid) as max_chnglog_id, min(chnglog.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field

union all

select base.issueid, base.sourceinstance, base.n_key, base.lagging_count_of_weeks, base.field, cnglg_max.id as max_chnglog_id, cnglg_min.id as min_chnglog_id
from (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field, min(coalesce(chnglog.`to`, chnglog.`from`)) as min_chnglog_id,
max(coalesce(chnglog.`to`, chnglog.`from`)) as max_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') 
and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field
) base
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
left join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.created
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) cnglg_max
on coalesce(cnglg_max.to, cnglg_max.from, '') = base.max_chnglog_id and cnglg_max.issueid = base.issueid 
and cnglg_max.sourceinstance = base.sourceinstance and cnglg_max.field = base.field 
and date_format(convert_tz(cnglg_max.created,'GMT','America/Los_Angeles'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') 
left join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.created
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) cnglg_min
on coalesce(cnglg_min.from, cnglg_min.to, '') = base.min_chnglog_id and cnglg_min.issueid = base.issueid 
and cnglg_min.sourceinstance = base.sourceinstance and cnglg_min.field = base.field 
and date_format(convert_tz(cnglg_min.created,'GMT','America/Los_Angeles'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') 

union all

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field, max(chnglog.issuechangelogid) as max_chnglog_id, min(chnglog.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field;

drop table if exists #STG_TABLE_SCHEMA.changelog_weekly_temp;

create table if not exists #STG_TABLE_SCHEMA.changelog_weekly_temp (
  changelogid int(15) DEFAULT NULL,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  created datetime DEFAULT NULL,
  field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  fromstring text COLLATE utf8_unicode_ci DEFAULT NULL,
  tostring text COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_weeks int(15) DEFAULT 0,
  
  PRIMARY KEY (changelogid, field, sourceinstance, n_key),
  KEY first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
  KEY second_idx (field) USING BTREE,
  KEY third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
  KEY fourth_idx (changelogid, sourceinstance) USING BTREE
);

insert into #STG_TABLE_SCHEMA.changelog_weekly_temp 
(changelogid, issueid, sourceinstance, created, field, fromstring, tostring, `from`, `to`, n_key, lagging_count_of_weeks)

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, weekly.n_key, weekly.lagging_count_of_weeks
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 
and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) base

join #STG_TABLE_SCHEMA.weekly_changelog_id weekly
on weekly.max_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, weekly.n_key, weekly.lagging_count_of_weeks
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) base

join #STG_TABLE_SCHEMA.weekly_changelog_id weekly
on weekly.min_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field

union all 

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, 
case when base.field in ('STORY POINTS', 'BUSINESS VALUE') then case when base.fromstring  is null then base.fromstring when base.fromstring = '' then null else convert(base.fromstring,DECIMAL(28,10)) end else base.fromstring end as fromstring, 
case when base.field in ('STORY POINTS', 'BUSINESS VALUE') then case when base.tostring is null then base.tostring when base.tostring = '' then null else cast(base.tostring as DECIMAL(28,10)) end else base.tostring end as tostring,
base.`from`, base.`to`, weekly.n_key, weekly.lagging_count_of_weeks
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
) base

join #STG_TABLE_SCHEMA.weekly_changelog_id weekly
on weekly.max_chnglog_id = base.id and weekly.issueid = base.issueid and weekly.sourceinstance = base.sourceinstance and weekly.field = base.field;

-- Weekly next changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.next_changelog_val_week;

create table if not exists #STG_TABLE_SCHEMA.next_changelog_val_week 

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.fromstring as next_fromstring, chnglog.`from` as next_from, next_id.n_key, next_id.lagging_count_of_weeks
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field, min(chnglog.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglog.field
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0

union all

select cnglg.id AS changelogid, base.issueid, base.sourceinstance, base.field, cnglg.fromstring as next_fromstring, cnglg.`from` as next_from, base.n_key, base.lagging_count_of_weeks
from (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field, min(coalesce(chnglog.`to`, chnglog.`from`)) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field
) base
join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.fromstring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION')  and chnglog.primary_sequence_id <> 0
) cnglg
on coalesce(cnglg.from) = base.min_chnglog_id and cnglg.issueid = base.issueid 
and cnglg.sourceinstance = base.sourceinstance and cnglg.field = base.field

union all

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglog.field, 
case when chnglog.field in ('STORY POINTS', 'BUSINESS VALUE') then case when chnglog.fromstring  is null then chnglog.fromstring when chnglog.fromstring = '' then null else convert(chnglog.fromstring,DECIMAL(28,10)) end else chnglog.fromstring end as next_fromstring, chnglog.`from` as next_from, next_id.n_key, next_id.lagging_count_of_weeks
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field, min(chnglog.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_weeks, chnglog.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglog.field
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0;


alter table #STG_TABLE_SCHEMA.next_changelog_val_week
ADD PRIMARY KEY (issueid, changelogid, field, sourceinstance, n_key),
ADD INDEX first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
ADD INDEX second_idx (field) USING BTREE,
ADD INDEX third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
ADD INDEX fourth_idx (changelogid, sourceinstance) USING BTREE;

-- Weekly base table status update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_status = coalesce(LKP.`to`, SRC.work_item_status), SRC.updated_on = current_timestamp
where LKP.field in ('STATUS');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_status = coalesce(LKP2.next_from, SRC.work_item_status), SRC.updated_on = current_timestamp
where LKP2.field in ('STATUS') and LKP2.next_from <> SRC.work_item_status;

-- Weekly base table assignee update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.assignee = coalesce(LKP.`to`, SRC.assignee), SRC.updated_on = current_timestamp
where LKP.field in ('ASSIGNEE');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.assignee = coalesce(LKP2.next_from, SRC.assignee), SRC.updated_on = current_timestamp
where LKP2.field in ('ASSIGNEE') and SRC.assignee <> LKP2.next_from;

-- Weekly base table project update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.project = coalesce(LKP.`to`, LKP.`from`, SRC.project), SRC.updated_on = current_timestamp
where LKP.field in ('PROJECT');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.project = coalesce(LKP2.next_from, SRC.project), SRC.updated_on = current_timestamp
where LKP2.field in ('PROJECT') and LKP2.next_from <> SRC.project;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.tostring, LKP.fromstring, SRC.summary), SRC.updated_on = current_timestamp
where LKP.field in ('SUMMARY');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.summary = coalesce(LKP2.next_fromstring, SRC.summary), SRC.updated_on = current_timestamp
where LKP2.field in ('SUMMARY') and LKP2.next_fromstring <> SRC.summary;

-- Weekly base table business value update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = round(coalesce(LKP.tostring, SRC.business_value),10), SRC.updated_on = current_timestamp
where LKP.field in ('BUSINESS VALUE');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.business_value = coalesce(LKP2.next_fromstring, SRC.business_value), SRC.updated_on = current_timestamp
where LKP2.field in ('BUSINESS VALUE') and coalesce(LKP2.next_fromstring, '') <> coalesce(SRC.business_value, '');

-- Weekly base table story points update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.tostring, SRC.story_points), SRC.updated_on = current_timestamp
where LKP.field in ('STORY POINTS');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.story_points = coalesce(LKP2.next_fromstring, SRC.story_points), SRC.updated_on = current_timestamp
where LKP2.field in ('STORY POINTS') and SRC.story_points <> LKP2.next_fromstring;

-- Weekly base table resolution update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where LKP.field in ('RESOLUTION');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_resolution = coalesce(LKP2.next_from, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where LKP2.field in ('RESOLUTION') and LKP2.next_from <> SRC.work_item_resolution;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where LKP.field in ('PRIORITY');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_priority = coalesce(LKP2.next_from, SRC.work_item_priority), SRC.updated_on = current_timestamp
where LKP2.field in ('PRIORITY') and LKP2.next_from <> SRC.work_item_priority;

-- Weekly base table work_item_iteration_key update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join (
select FACT.work_item_key, base.issueid, FACT.source_id, base.n_key, FACT.task_attribute_wh_new_value_key
from #DWH_TABLE_SCHEMA.f_work_item_activity FACT
left join (
select FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key, max(FACT.primary_sequence_id) max_primary_sequence_id
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid = D.row_id and SRC.sourceinstance = D.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on SRC.n_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.f_work_item_activity FACT
on FACT.work_item_key = D.row_key and FACT.source_id = D.source_id and FACT.task_attribute_wh_name = 'ITERATION'
where FACT.task_attribute_wh_name = 'ITERATION' and FACT.started_on_key <= CAL.week_end_date_key
group by FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key
) base
on FACT.work_item_key = base.work_item_key and FACT.source_id = base.source_id and FACT.task_attribute_wh_name = base.task_attribute_wh_name 
and FACT.primary_sequence_id = base.max_primary_sequence_id and FACT.task_attribute_wh_name = 'ITERATION'
where base.n_key is not null) LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.source_id and SRC.n_key = LKP.n_key
set SRC.work_item_iteration_key = coalesce(LKP.task_attribute_wh_new_value_key, 0);

-- Weekly base table fix version update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP.`to`, LKP.`from`)=DFV.row_id and LKP.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when coalesce(LKP.`to`, LKP.`from`) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where LKP.field in ('FIX VERSION');

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP2.next_from, '')=DFV.row_id and LKP2.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when LKP2.next_from is null then 0 else -1 end), SRC.updated_on = current_timestamp
where LKP2.field in ('FIX VERSION') and DFV.row_key <> SRC.work_item_earliest_fixed_version_key;

-- Weekly base table duedate update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and LKP.field in ('DUEDATE')
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.tostring, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_week LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.due_on = coalesce(convert_tz(LKP2.next_from,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.due_on), SRC.updated_on = current_timestamp
where LKP2.field in ('DUEDATE') and SRC.due_on <> convert_tz(LKP2.next_fromstring,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>');

-- Weekly base table completed_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('COMPLETED')

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as completed_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then tmp.completed_on else null end, SRC.updated_on = current_timestamp;

-- Weekly base table in_progress_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, min(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(chnglog.`from`))=LM.src_rowid
and chnglog.sourceinstance=LM.source_id
where lower(chnglog.field) = 'STATUS' and LM.dimension_wh_code IN ('PROPOSED') and date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`,'') <> coalesce(chnglog.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = tmp.in_prog_on, SRC.updated_on = current_timestamp;

-- Weekly base table last_updated_on update --
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join 
(
select SQ.issueid, SQ.sourceinstance, SQ.n_key, max(SQ.last_updated_on) as last_updated_on
from
(
select base.issueid, base.sourceinstance, base.n_key, max(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
FROM #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
left join #MDS_TABLE_SCHEMA.issue_changelog_final SRC
on base.issueid=SRC.issueid and base.sourceinstance=SRC.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
where date_format(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
group by base.issueid, base.sourceinstance, base.n_key
union all
select base.issueid, base.sourceinstance, base.n_key, max(convert_tz(comments.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
FROM #STG_TABLE_SCHEMA.history_snapshot_weekly_temp base
left join #MDS_TABLE_SCHEMA.issue_comments_final comments
on base.issueid=comments.issueid
and base.sourceinstance=comments.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
where date_format(convert_tz(comments.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
group by base.issueid, base.sourceinstance, base.n_key
) SQ
group by SQ.issueid, SQ.sourceinstance, SQ.n_key
) base
on base.issueid = SRC.issueid and base.sourceinstance = SRC.sourceinstance and base.n_key = SRC.n_key
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

set SRC.last_updated_on = case when date_format(D.changed_on, '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') then D.changed_on else coalesce(base.last_updated_on, D.created_on) end, SRC.updated_on = current_timestamp;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
set SRC.changed_on = SRC.last_updated_on;

-- SRC.changed_by = base.authorRef

-- Weekly base table resolved_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and issue.sourceinstance = SRC.sourceinstance

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED')

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as resolved_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code IN ('RESOLVED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED') 
then coalesce(case when date_format(convert_tz(issue.resolutiondate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') 
then convert_tz(issue.resolutiondate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else null end, tmp_res.resolved_on, SRC.completed_on) else null end, SRC.updated_on = current_timestamp;

-- Weekly base table cancelled_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM_ST
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM_ST.src_rowid
and SRC.sourceinstance=LM_ST.source_id and LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED')

left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as cancelled_on
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id
where LKP.field = 'STATUS' and (LM.dimension_wh_code = 'CANCELLED' or LM_RES.dimension_wh_code in ('CANCELLED')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.cancelled_on = case when (LM_ST.dimension_wh_code in ('CANCELLED') AND (LM_RES.dimension_wh_code != 'CANCELLED' OR LM_RES.dimension_wh_code IS NULL)) then tmp_cncl.cancelled_on
when LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND LM_RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.resolved_on,tmp_cncl.cancelled_on)
else null end, SRC.updated_on = current_timestamp;

-- Weekly base table overdue_flag update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key = SRC.n_key

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < cal.week_end_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Weekly base table proposed_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Weekly base table in_progress_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.in_progress_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Weekly base table reopened_flag reopen_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(1) as reopened_count
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM_TO.src_rowid
and LKP.sourceinstance=LM_TO.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM_FROM.src_rowid
and LKP.sourceinstance=LM_FROM.source_id
where LKP.field = 'STATUS' and (LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reopn
on tmp_reopn.issueid = SRC.issueid and tmp_reopn.sourceinstance = SRC.sourceinstance and tmp_reopn.n_key = SRC.n_key

set SRC.reopened_flag = coalesce(case when tmp_reopn.reopened_count > 0 THEN 'Y' ELSE 'N' END, 'N'), SRC.reopen_count = tmp_reopn.reopened_count, SRC.updated_on = current_timestamp;

-- Weekly base table reassignment_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(LKP.issueid) as reassignment_count
from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where lower(LKP.`field`) = 'ASSIGNEE' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.week_end_date, '%Y-%m-%d') and (LKP.fromstring is not null or LKP.`from` is not null)
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;


-- Weekly base table invalid_flag update -- wi_type

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.wi_type))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.work_item_status))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.work_item_resolution))=RES.src_rowid and SRC.sourceinstance = RES.source_id

set SRC.invalid_flag = coalesce(CASE when ((DM.dimension_wh_code in ('COMPLETED', 'RESOLVED','CANCELLED') and RES.dimension_wh_code in ('CANCELLED')) or DM.dimension_wh_code in ('CANCELLED')) then 'Y' ELSE 'N' end,'N' ), SRC.updated_on = current_timestamp;

-- Weekly base table age_since_creation update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = SRC.n_key
set SRC.age_since_creation =  coalesce(case when date_format(convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > CAL.week_end_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(timestamp(CAL.week_end_date),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) + 86400 end,0), SRC.updated_on = current_timestamp;

-- Weekly final table creation --

drop table if exists #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base;

create table #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base (
  work_item_key int(15) DEFAULT 0, 
  age_since_creation int(20) DEFAULT 0, 
  assigned_to_key int(15) DEFAULT 0, 
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT null,
  changed_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  due_date datetime DEFAULT NULL,
  in_progress_date datetime DEFAULT NULL,
  resolved_date datetime DEFAULT NULL,
  completed_date datetime DEFAULT NULL,
  cancelled_date DATETIME DEFAULT NULL,
  in_progress_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  proposed_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  reopened_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  overdue_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  last_updated_date datetime DEFAULT NULL,
  n_date date DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  project_key int(15) DEFAULT 0,
  reassignment_count int(15) DEFAULT 0,
  reopen_count int(15) DEFAULT 0,
  row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  soft_deleted_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  source_id bigint(20) NOT NULL DEFAULT 0,
  summary varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_earliest_fixed_version_key int(15) DEFAULT 0,
  work_item_iteration_key int(15) DEFAULT 0,
  work_item_priority_src_key int(15) DEFAULT 0,
  work_item_status_src_key int(15) DEFAULT 0,
  work_item_resolution_src_key int(15) DEFAULT 0,
  business_value DECIMAL(28,10) DEFAULT NULL,
  story_points DECIMAL(28,10) DEFAULT NULL
  );
  
insert into #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, invalid_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select D.row_key as work_item_key,
SRC.age_since_creation as age_since_creation,
coalesce(ASGN.row_key, case when SRC.assignee is null then 0 else -1 end) as assigned_to_key,
SRC.cdctype as cdctype,
SRC.changed_by as changed_by,
SRC.changed_on as changed_on,
SRC.created_by as created_by,
convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as created_on,
SRC.due_on as due_date,
SRC.in_progress_on as in_progress_date,
SRC.resolved_on as resolved_date,
SRC.completed_on as completed_date,
SRC.cancelled_on as cancelled_date,
SRC.in_progress_flag as in_progress_flag,
SRC.proposed_flag as proposed_flag,
SRC.reopened_flag as reopened_flag,
SRC.overdue_flag as overdue_flag,
SRC.invalid_flag as invalid_flag,
SRC.last_updated_on as last_updated_date,
SRC.n_date as n_date,
SRC.n_key as n_key,
coalesce(PROJ.row_key, case when SRC.project is null then 0 else -1 end) as project_key,
SRC.reassignment_count as reassignment_count,
SRC.reopen_count as reopen_count,
SRC.issueid as row_id,
cast((case when SRC.cdctype = 'D' then 'Y' else 'N' end) as char(1)) as soft_deleted_flag,
SRC.sourceinstance as source_id,
SRC.summary as summary,
SRC.work_item_earliest_fixed_version_key as work_item_earliest_fixed_version_key,
SRC.work_item_iteration_key as work_item_iteration_key,
coalesce(PRIO.row_key, case when SRC.work_item_priority is null then 0 else -1 end) as work_item_priority_src_key,
coalesce(STATUS.row_key, case when SRC.work_item_status is null then 0 else -1 end) as work_item_status_src_key,
coalesce(RESOLUTION.row_key, case when SRC.work_item_resolution is null then 0 else -1 end) as work_item_resolution_src_key,
SRC.business_value as business_value,
SRC.story_points as story_points


from #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
left join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid=D.row_id
and SRC.sourceinstance=D.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ASGN
ON (concat('INTERNAL_CONTACT~', SRC.assignee) = ASGN.row_id 
AND SRC.sourceinstance=ASGN.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_project PROJ
ON (SRC.project = PROJ.row_id 
AND SRC.sourceinstance=PROJ.source_id)
left join #DWH_TABLE_SCHEMA.d_lov PRIO
on concat('PRIORITY~WORK_ITEM','~',upper(SRC.work_item_priority))=PRIO.src_rowid
and SRC.sourceinstance=PRIO.source_id
left join #DWH_TABLE_SCHEMA.d_lov STATUS
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status))=STATUS.src_rowid
and SRC.sourceinstance=STATUS.source_id
left join #DWH_TABLE_SCHEMA.d_lov RESOLUTION
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution))=RESOLUTION.src_rowid
and SRC.sourceinstance=RESOLUTION.source_id;

insert into #STG_TABLE_SCHEMA.f_work_item_snpst_wk_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, invalid_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select F.work_item_key as work_item_key,
F.age_since_creation as age_since_creation,
D.work_item_assigned_to_key as assigned_to_key,
F.cdctype as cdctype,
F.changed_by as changed_by,
F.changed_on as changed_on,
F.created_by as created_by,
F.created_on as created_on,
D.due_on as due_date,
D.work_start_on as in_progress_date,
D.resolved_on as resolved_date,
D.completed_on as completed_date,
D.cancelled_on as cancelled_date,
D.in_progress_flag as in_progress_flag,
D.proposed_flag as proposed_flag,
D.reopened_flag as reopened_flag,
D.overdue_flag as overdue_flag,
D.invalid_flag as invalid_flag,
D.work_item_updated_on as last_updated_date,
CAL.week_start_date as n_date,
CAL.week_start_date_key as n_key,
F.project_key as project_key,
F.reassignment_count as reassignment_count,
F.reopen_count as reopen_count,
F.row_id as row_id,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
D.short_description as summary,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key as work_item_priority_src_key, 
D.work_item_status_src_key as work_item_status_src_key,
D.work_item_resolution_src_key as work_item_resolution_src_key,
F.business_value as business_value,
F.story_points as story_points

from #DWH_TABLE_SCHEMA.f_work_item F
left join  #DWH_TABLE_SCHEMA.d_work_item D
ON F.work_item_key = D.row_key
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'Jira_Tenant' group by source_id) ODF 
on ODF.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (date_format(ODF.last_updated,'%Y%m%d') = CAL.row_id);

-- Monthly base table creation --

drop table if exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp;

create table if not exists #STG_TABLE_SCHEMA.history_snapshot_monthly_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  n_date date DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_month int(15) DEFAULT 0,
  wi_number varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  summary varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  age_since_creation int(20) DEFAULT 0,
  assignee varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  project varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  wi_type varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  work_item_status varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_resolution varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_iteration_key int(15) DEFAULT 0,
  work_item_earliest_fixed_version_key varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_priority varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  reassignment_count int(15) DEFAULT 0,
  reopen_count int(15) DEFAULT 0,
  reopened_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  overdue_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  in_progress_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  proposed_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  resolved_on datetime DEFAULT NULL,
  due_on datetime DEFAULT NULL,
  in_progress_on datetime DEFAULT NULL,
  completed_on datetime DEFAULT NULL,
  last_updated_on datetime DEFAULT NULL,
  business_value DECIMAL(28,10) DEFAULT NULL,
  cancelled_on DATETIME DEFAULT NULL,
  story_points DECIMAL(28,10) DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  changed_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT null,
  to_delete_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  inserted_on datetime DEFAULT NULL,
  updated_on datetime DEFAULT NULL
);

insert into #STG_TABLE_SCHEMA.history_snapshot_monthly_temp

(issueid, wi_number, n_date, n_key, lagging_count_of_month, summary, wi_type, sourceinstance, due_on,
assignee, project, work_item_status, work_item_resolution, work_item_iteration_key, work_item_earliest_fixed_version_key, work_item_priority, 
business_value, story_points, created_on, created_by, changed_on, changed_by, cdctype, to_delete_flag, inserted_on, updated_on)

select issue.id, issue.`key`, calendar.calendar_date as n_date, calendar.row_key as n_key, calendar.lagging_count_of_month, 
issue.summary, issue.issuetype_id, issue.sourceinstance, convert_tz(issue.duedate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), issue.assigneeRef, issue.project_id, issue.status_id, issue.resolution_id, D.iteration_key, D.earliest_fixed_version_key,
issue.priority_id, round(EXT.customfield_10005,10) as business_value, EXT.customfield_10004 as story_points, issue.created, issue.creatorRef, issue.updated, issue.creatorRef, issue.cdctype, 
'N' as to_delete_flag, current_timestamp as inserted_on, current_timestamp as updated_on
from #MDS_TABLE_SCHEMA.issue_final issue
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on issue.id = EXT.record_id and issue.sourceinstance = EXT.sourceinstance
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.id, '')=D.row_id and issue.sourceinstance=D.source_id
cross join (
select distinct CAL_MN.calendar_date, CAL_MN.row_key, CAL.lagging_count_of_month
from #DWH_TABLE_SCHEMA.d_calendar_date CAL
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,'%Y%m%d') = CAL_MN.row_id)
join (select source_id, current_flag, target_table, retention, subject_area, calendar_code, day_of_week_month 
from #STG_TABLE_SCHEMA.lsm_ls_dw_aggregator where target_table = 'f_work_item_snapshot_monthly' and subject_area = 'JIRA') lsm_aggregator
on CAL.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = 'f_work_item_snapshot_monthly' and lsm_aggregator.subject_area = 'JIRA' 
where CAL.lagging_count_of_month between 1 and lsm_aggregator.retention) calendar;

alter table #STG_TABLE_SCHEMA.history_snapshot_monthly_temp
ADD PRIMARY KEY (issueid, sourceinstance, n_key),
ADD INDEX first_idx (issueid,sourceinstance) USING BTREE,
ADD INDEX second_idx (issueid,sourceinstance,n_key) USING BTREE,
ADD INDEX third_idx (n_key) USING BTREE;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (base.n_key = CAL.row_key)
set base.to_delete_flag = 'Y', base.updated_on = current_timestamp
where date_format(convert_tz(base.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(CAL.month_end_date, '%Y-%m-%d'); 

use #STG_TABLE_SCHEMA;

delete base
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
where base.to_delete_flag = 'Y';

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
set sys_id = concat(issueid, '~', n_key);

-- Monthly changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.monthly_changelog_id;

create table if not exists #STG_TABLE_SCHEMA.monthly_changelog_id 

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, max(chnglog.issuechangelogid) as max_chnglog_id, min(chnglog.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field

union all

select base.issueid, base.sourceinstance, base.n_key, base.lagging_count_of_month, base.field, cnglg_max.id as max_chnglog_id, cnglg_min.id as min_chnglog_id
from (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(coalesce(chnglog.`to`, chnglog.`from`)) as min_chnglog_id,
max(coalesce(chnglog.`to`, chnglog.`from`)) as max_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field
) base
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
left join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.created
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) cnglg_max
on coalesce(cnglg_max.to, cnglg_max.from, '') = base.min_chnglog_id and cnglg_max.issueid = base.issueid 
and cnglg_max.sourceinstance = base.sourceinstance and cnglg_max.field = base.field 
and date_format(convert_tz(cnglg_max.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
left join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.created
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) cnglg_min
on coalesce(cnglg_min.from, cnglg_min.to, '') = base.min_chnglog_id and cnglg_min.issueid = base.issueid 
and cnglg_min.sourceinstance = base.sourceinstance and cnglg_min.field = base.field 
and date_format(convert_tz(cnglg_min.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 


union all

select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, max(chnglog.issuechangelogid) as max_chnglog_id, min(chnglog.issuechangelogid) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field;

drop table if exists #STG_TABLE_SCHEMA.changelog_monthly_temp;

create table if not exists #STG_TABLE_SCHEMA.changelog_monthly_temp (
  changelogid int(15) DEFAULT NULL,
  issueid varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  created datetime DEFAULT NULL,
  field varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  fromstring text COLLATE utf8_unicode_ci DEFAULT NULL,
  tostring text COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` text COLLATE utf8_unicode_ci DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  lagging_count_of_month int(15) DEFAULT 0,
  
  PRIMARY KEY (changelogid, field, sourceinstance, n_key),
  KEY first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
  KEY second_idx (field) USING BTREE,
  KEY third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
  KEY fourth_idx (changelogid, sourceinstance) USING BTREE
);


insert into #STG_TABLE_SCHEMA.changelog_monthly_temp 
(changelogid, issueid, sourceinstance, created, field, fromstring, tostring, `from`, `to`, n_key, lagging_count_of_month)

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, base.fromstring, base.tostring, base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.min_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field

union all 

select distinct base.id as changelogid, base.issueid, base.sourceinstance, base.created, base.field, 
case when base.field in ('STORY POINTS', 'BUSINESS VALUE') then case when base.fromstring  is null then base.fromstring when base.fromstring = '' then null else convert(base.fromstring,DECIMAL(28,10)) end else base.fromstring end as fromstring, 
case when base.field in ('STORY POINTS', 'BUSINESS VALUE') then case when base.tostring is null then base.tostring when base.tostring = '' then null else cast(base.tostring as DECIMAL(28,10)) end else base.tostring end as tostring, 
base.`from`, base.`to`, monthly.n_key, monthly.lagging_count_of_month
from 
(select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.created, chnglog.field, chnglog.fromstring, chnglog.`from`, chnglog.`to`, chnglog.tostring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
) base

join #STG_TABLE_SCHEMA.monthly_changelog_id monthly
on monthly.max_chnglog_id = base.id and monthly.issueid = base.issueid and monthly.sourceinstance = base.sourceinstance and monthly.field = base.field;

-- Monthly next changelog table creation --

drop table if exists #STG_TABLE_SCHEMA.next_changelog_val_month;

create table if not exists #STG_TABLE_SCHEMA.next_changelog_val_month 

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.fromstring as next_fromstring, chnglog.`from` as next_from, next_id.n_key, next_id.lagging_count_of_month
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(chnglog.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglog.field
where chnglog.field in ('STATUS', 'ASSIGNEE', 'PRIORITY', 'ITERATION', 'DUEDATE', 'PROJECT', 'RESOLUTION') and chnglog.primary_sequence_id <> 0

union all

select cnglg.id AS changelogid, base.issueid, base.sourceinstance, base.field, cnglg.fromstring as next_fromstring, cnglg.`from` as next_from, base.n_key, base.lagging_count_of_month
from (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(chnglog.`from`) as min_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('FIX VERSION') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.`from`, '') <> coalesce(chnglog.`to`, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field
) base
join 
(
select chnglog.id, chnglog.issueid, chnglog.sourceinstance, chnglog.field, chnglog.`to`, chnglog.`from`, chnglog.fromstring
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
where chnglog.field in ('FIX VERSION')  and chnglog.primary_sequence_id <> 0
) cnglg
on coalesce(cnglg.`from`, '') = base.min_chnglog_id and cnglg.issueid = base.issueid 
and cnglg.sourceinstance = base.sourceinstance and cnglg.field = base.field
where cnglg.id is not null

union all

select chnglog.id AS changelogid, chnglog.issueid, chnglog.sourceinstance, chnglog.field, 
case when chnglog.field in ('STORY POINTS', 'BUSINESS VALUE') then case when chnglog.fromstring  is null then chnglog.fromstring when chnglog.fromstring = '' then null else convert(chnglog.fromstring,DECIMAL(28,10)) end else chnglog.fromstring end as next_fromstring, 
chnglog.`from` as next_from, next_id.n_key, next_id.lagging_count_of_month
from #STG_TABLE_SCHEMA.issue_activity_temp chnglog
join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field, min(chnglog.issuechangelogid) as nxt_chnglog_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp chnglog
on SRC.issueid=chnglog.issueid and SRC.sourceinstance=chnglog.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0 and
date_format(convert_tz(chnglog.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(chnglog.fromstring, '') <> coalesce(chnglog.tostring, '')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key, SRC.lagging_count_of_month, chnglog.field) next_id
on next_id.nxt_chnglog_id = chnglog.id and next_id.sourceinstance = chnglog.sourceinstance and next_id.issueid = chnglog.issueid and next_id.field = chnglog.field
where chnglog.field in ('BUSINESS VALUE', 'STORY POINTS', 'SUMMARY') and chnglog.primary_sequence_id <> 0;

alter table #STG_TABLE_SCHEMA.next_changelog_val_month
ADD PRIMARY KEY (changelogid, field, sourceinstance, n_key),
ADD INDEX first_idx (issueid, sourceinstance, field, n_key) USING BTREE,
ADD INDEX second_idx (field) USING BTREE,
ADD INDEX third_idx (changelogid, issueid, sourceinstance, field) USING BTREE,
ADD INDEX fourth_idx (changelogid, sourceinstance) USING BTREE;

-- Monthly base table status update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_status = coalesce(LKP.`to`, SRC.work_item_status), SRC.updated_on = current_timestamp
where LKP.field in ('STATUS');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_status = coalesce(LKP2.next_from, SRC.work_item_status), SRC.updated_on = current_timestamp
where LKP2.field in ('STATUS') and SRC.work_item_status <> LKP2.next_from;

-- Monthly base table assignee update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.assignee = coalesce(LKP.`to`, SRC.assignee), SRC.updated_on = current_timestamp
where LKP.field in ('ASSIGNEE');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.assignee = coalesce(LKP2.next_from, SRC.assignee), SRC.updated_on = current_timestamp
where LKP2.field in ('ASSIGNEE') and SRC.assignee <> LKP2.next_from;

-- Monthly base table project update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.project = coalesce(LKP.`to`, LKP.`from`, SRC.project), SRC.updated_on = current_timestamp
where LKP.field in ('PROJECT');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.project = coalesce(LKP2.next_from, SRC.project), SRC.updated_on = current_timestamp
where LKP2.field in ('PROJECT') and SRC.project <> LKP2.next_from;

-- Monthly base table summary update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.summary = coalesce(LKP.tostring, LKP.fromstring, SRC.summary), SRC.updated_on = current_timestamp
where LKP.field in ('SUMMARY');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.summary = coalesce(LKP2.next_fromstring, SRC.summary), SRC.updated_on = current_timestamp
where LKP2.field in ('SUMMARY') and SRC.summary <> LKP2.next_fromstring;

-- Monthly base table business value update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.business_value = coalesce(LKP.tostring, SRC.business_value), SRC.updated_on = current_timestamp
where LKP.field in ('BUSINESS VALUE');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.business_value = coalesce(LKP2.next_fromstring, SRC.business_value), SRC.updated_on = current_timestamp
where LKP2.field in ('BUSINESS VALUE') and SRC.business_value <> LKP2.next_fromstring;

-- Monthly base table story points update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.story_points = coalesce(LKP.tostring, SRC.story_points), SRC.updated_on = current_timestamp
where LKP.field in ('STORY POINTS');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.story_points = coalesce(LKP2.next_fromstring, SRC.story_points), SRC.updated_on = current_timestamp
where LKP2.field in ('STORY POINTS') and SRC.story_points <> LKP2.next_fromstring;

-- Monthly base table resolution update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_resolution = coalesce(LKP.`to`, LKP.`from`, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where LKP.field in ('RESOLUTION');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_resolution = coalesce(LKP2.next_from, SRC.work_item_resolution), SRC.updated_on = current_timestamp
where LKP2.field in ('RESOLUTION') and SRC.work_item_resolution <> LKP2.next_from;

-- Monthly base table priority update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
set SRC.work_item_priority = coalesce(LKP.`to`, SRC.work_item_priority), SRC.updated_on = current_timestamp
where LKP.field in ('PRIORITY');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.work_item_priority = coalesce(LKP2.next_from, SRC.work_item_priority), SRC.updated_on = current_timestamp
where LKP2.field in ('PRIORITY') and SRC.work_item_priority <> LKP2.next_from;

-- Monthly base table work_item_iteration_key update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join (
select FACT.work_item_key, base.issueid, FACT.source_id, base.n_key, FACT.task_attribute_wh_new_value_key
from #DWH_TABLE_SCHEMA.f_work_item_activity FACT
left join (
select FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key, max(FACT.primary_sequence_id) max_primary_sequence_id
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid = D.row_id and SRC.sourceinstance = D.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on SRC.n_key = CAL.row_key
left join #DWH_TABLE_SCHEMA.f_work_item_activity FACT
on FACT.work_item_key = D.row_key and FACT.source_id = D.source_id and FACT.task_attribute_wh_name = 'ITERATION'
where FACT.task_attribute_wh_name = 'ITERATION' and FACT.started_on_key <= CAL.month_end_date_key
group by FACT.work_item_key, SRC.issueid, FACT.source_id, FACT.task_attribute_wh_name, SRC.n_key
) base
on FACT.work_item_key = base.work_item_key and FACT.source_id = base.source_id and FACT.task_attribute_wh_name = base.task_attribute_wh_name 
and FACT.primary_sequence_id = base.max_primary_sequence_id and FACT.task_attribute_wh_name = 'ITERATION'
where base.n_key is not null) LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.source_id and SRC.n_key = LKP.n_key
set SRC.work_item_iteration_key = coalesce(LKP.task_attribute_wh_new_value_key, 0);

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP.`to`, LKP.`from`)=DFV.row_id and LKP.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when coalesce(LKP.`to`, LKP.`from`) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where LKP.field in ('FIX VERSION');

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
left join #DWH_TABLE_SCHEMA.d_work_item_version DFV
on coalesce(LKP2.next_from, '') = DFV.row_id and LKP2.sourceinstance=DFV.source_id
set SRC.work_item_earliest_fixed_version_key = coalesce(DFV.row_key,case when LKP2.next_from is null then 0 else -1 end), SRC.updated_on = current_timestamp
where LKP2.field in ('FIX VERSION') and DFV.row_key <> SRC.work_item_earliest_fixed_version_key;

-- Monthly base table duedate update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.changelog_monthly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key and LKP.field in ('DUEDATE')
left join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and SRC.sourceinstance = issue.sourceinstance
set SRC.due_on = convert_tz(coalesce(LKP.tostring, issue.duedate),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.updated_on = current_timestamp;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #STG_TABLE_SCHEMA.next_changelog_val_month LKP2
on SRC.issueid = LKP2.issueid and SRC.sourceinstance = LKP2.sourceinstance and SRC.n_key = LKP2.n_key
set SRC.due_on = coalesce(convert_tz(LKP2.next_from,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), SRC.due_on), SRC.updated_on = current_timestamp
where LKP2.field in ('DUEDATE') and SRC.due_on <> convert_tz(LKP2.next_fromstring,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>');

-- Monthly base table completed_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('COMPLETED')

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as completed_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code='COMPLETED' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.completed_on = case when LM.dimension_wh_code IN ('COMPLETED') then tmp.completed_on else null end, SRC.updated_on = current_timestamp;

-- Monthly base table in_progress_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, min(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as in_prog_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code IN ('PROPOSED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp
on tmp.issueid = SRC.issueid and tmp.sourceinstance = SRC.sourceinstance and tmp.n_key = SRC.n_key

set SRC.in_progress_on = tmp.in_prog_on, SRC.updated_on = current_timestamp;

-- Monthly base table last_updated_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join 
(
select SQ.issueid, SQ.sourceinstance, SQ.n_key, max(SQ.last_updated_on) as last_updated_on
from (
select base.issueid, base.sourceinstance, base.n_key, max(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
left join #MDS_TABLE_SCHEMA.issue_changelog_final SRC
on base.issueid=SRC.issueid and base.sourceinstance=SRC.sourceinstance
join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
where date_format(convert_tz(SRC.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by base.issueid, base.sourceinstance, base.n_key
union all 
select base.issueid, base.sourceinstance, base.n_key, max(convert_tz(comments.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as last_updated_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp base
left join #MDS_TABLE_SCHEMA.issue_comments_final comments
on base.issueid=comments.issueid
and base.sourceinstance=comments.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on base.n_key = cal.row_key
where date_format(convert_tz(comments.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by base.issueid, base.sourceinstance, base.n_key
) SQ
group by SQ.issueid, SQ.sourceinstance, SQ.n_key
) base
on base.issueid = SRC.issueid and base.sourceinstance = SRC.sourceinstance and base.n_key = SRC.n_key
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(SRC.issueid, '') = D.row_id and SRC.sourceinstance = D.source_id
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

set SRC.last_updated_on = case when date_format(D.changed_on, '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') then D.changed_on else coalesce(base.last_updated_on, D.created_on) end, SRC.updated_on = current_timestamp;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
set SRC.changed_on = SRC.last_updated_on;

-- SRC.changed_by = base.authorRef, 

-- Monthly base table resolved_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key

join #MDS_TABLE_SCHEMA.issue_final issue
on issue.id = SRC.issueid and issue.sourceinstance = SRC.sourceinstance

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id and LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED')

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')) as resolved_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id
where LKP.field = 'STATUS' and LM.dimension_wh_code IN ('RESOLVED') and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_res
on tmp_res.issueid = SRC.issueid and tmp_res.sourceinstance = SRC.sourceinstance and tmp_res.n_key = SRC.n_key

set SRC.resolved_on = case when LM.dimension_wh_code IN ('RESOLVED' , 'COMPLETED') 
then coalesce(case when date_format(convert_tz(issue.resolutiondate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') 
then convert_tz(issue.resolutiondate,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else null end, tmp_res.resolved_on, SRC.completed_on) else null end, SRC.updated_on = current_timestamp;

-- Monthly base table cancelled_on update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM_ST
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM_ST.src_rowid
and SRC.sourceinstance=LM_ST.source_id and LM_ST.dimension_class = 'STATUS~WORK_ITEM' and LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED')

left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id and LM_RES.dimension_class = 'RESOLUTION~WORK_ITEM'

left join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, max(convert_tz(LKP.created,'GMT','America/Los_Angeles')) as cancelled_on
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM.src_rowid
and LKP.sourceinstance=LM.source_id and LM.dimension_class = 'STATUS~WORK_ITEM'
left join #DWH_TABLE_SCHEMA.d_lov_map LM_RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution)) = LM_RES.src_rowid
and SRC.sourceinstance=LM_RES.source_id and LM_RES.dimension_class = 'RESOLUTION~WORK_ITEM'
where (LM.dimension_wh_code = 'CANCELLED' or LM_RES.dimension_wh_code in ('CANCELLED')) and LKP.primary_sequence_id <> 0 and date_format(convert_tz(LKP.created,'GMT','America/Los_Angeles'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and coalesce(LKP.`from`,'') <> coalesce(LKP.`to`,'')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_cncl
on tmp_cncl.issueid = SRC.issueid and tmp_cncl.sourceinstance = SRC.sourceinstance and tmp_cncl.n_key = SRC.n_key

set SRC.cancelled_on = case when (LM_ST.dimension_wh_code in ('CANCELLED') AND (LM_RES.dimension_wh_code != 'CANCELLED' OR LM_RES.dimension_wh_code IS NULL)) then tmp_cncl.cancelled_on
when LM_ST.dimension_wh_code in ('RESOLVED','CANCELLED','COMPLETED') AND LM_RES.dimension_wh_code  in ('CANCELLED') then COALESCE(SRC.resolved_on,tmp_cncl.cancelled_on)
else null end, SRC.updated_on = current_timestamp;

-- Monthly base table overdue_flag update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cal.row_key = SRC.n_key

set SRC.overdue_flag = coalesce(case when SRC.due_on is null then 'N' when LM.dimension_wh_code IN ('PROPOSED','IN PROGRESS') and coalesce(SRC.due_on,0) < cal.month_end_date THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Monthly base table proposed_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.proposed_flag = coalesce(case when LM.dimension_wh_code IN ('PROPOSED') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Monthly base table in_progress_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id

set SRC.in_progress_flag = coalesce(case when LM.dimension_wh_code IN ('IN PROGRESS') THEN 'Y' ELSE 'N' END, 'N'), SRC.updated_on = current_timestamp;

-- Monthly base table reopened_flag reopen_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(1) as reopened_count
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(LKP.`to`))=LM_TO.src_rowid
and LKP.sourceinstance=LM_TO.source_id
left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(LKP.`from`))=LM_FROM.src_rowid
and LKP.sourceinstance=LM_FROM.source_id
where LKP.field = 'STATUS' and (LM_FROM.dimension_wh_code in ('COMPLETED','RESOLVED','CANCELLED') and LM_TO.dimension_wh_code in ('PROPOSED', 'IN PROGRESS')) and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d')
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reopn
on tmp_reopn.issueid = SRC.issueid and tmp_reopn.sourceinstance = SRC.sourceinstance and tmp_reopn.n_key = SRC.n_key

set SRC.reopened_flag = coalesce(case when tmp_reopn.reopened_count > 0 THEN 'Y' ELSE 'N' END, 'N'), SRC.reopen_count = tmp_reopn.reopened_count, SRC.updated_on = current_timestamp;

-- Monthly base table reassignment_count update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join (
select SRC.issueid,SRC.sourceinstance, SRC.n_key, count(LKP.issueid) as reassignment_count
from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #STG_TABLE_SCHEMA.issue_activity_temp LKP
on SRC.issueid=LKP.issueid and SRC.sourceinstance=LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on SRC.n_key = cal.row_key
where LKP.field = 'ASSIGNEE' and date_format(convert_tz(LKP.created,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') <= date_format(cal.month_end_date, '%Y-%m-%d') and (LKP.fromstring is not null or LKP.`from` is not null)
group by SRC.issueid,SRC.sourceinstance, SRC.n_key
) tmp_reasgn
on tmp_reasgn.issueid = SRC.issueid and tmp_reasgn.sourceinstance = SRC.sourceinstance and tmp_reasgn.n_key = SRC.n_key

set SRC.reassignment_count = tmp_reasgn.reassignment_count, SRC.updated_on = current_timestamp;


-- Monthly base table invalid_flag update --

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC

join #DWH_TABLE_SCHEMA.d_lov_map TYP
on concat('TYPE~WORK_ITEM~',upper(SRC.wi_type))=TYP.src_rowid and SRC.sourceinstance = TYP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.work_item_status))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.work_item_resolution))=RES.src_rowid and SRC.sourceinstance = RES.source_id

set SRC.invalid_flag = coalesce(CASE when ((DM.dimension_wh_code in ('COMPLETED', 'RESOLVED','CANCELLED') and RES.dimension_wh_code in ('CANCELLED')) or DM.dimension_wh_code in ('CANCELLED')) then 'Y' ELSE 'N' end,'N' ), SRC.updated_on = current_timestamp;

-- Monthly base table age_since_creation update --

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status)) = LM.src_rowid
and SRC.sourceinstance=LM.source_id
join #DWH_TABLE_SCHEMA.d_calendar_date CAL
on CAL.row_key = SRC.n_key
set SRC.age_since_creation =  coalesce(case when date_format(convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '%Y-%m-%d') > CAL.month_end_date then 0 
when LM.dimension_wh_code in ('RESOLVED', 'COMPLETED') then timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(SRC.resolved_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') , case when LM.dimension_wh_code in ('COMPLETED','RESOLVED') then convert_tz(SRC.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') else null end, convert_tz(SRC.cancelled_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>')))
when LM.dimension_wh_code in ('CANCELLED') then timestampdiff(second,coalesce(SRC.created_on,0),convert_tz(coalesce(SRC.resolved_on, SRC.cancelled_on),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'))
else timestampdiff(second,coalesce(SRC.created_on,0),coalesce(convert_tz(timestamp(CAL.month_end_date),'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),0)) + 86400 end,0), SRC.updated_on = current_timestamp;

drop table if exists #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base;

create table #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base (
  work_item_key int(15) DEFAULT 0, 
  age_since_creation int(20) DEFAULT 0, 
  assigned_to_key int(15) DEFAULT 0, 
  cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT null,
  changed_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  changed_on datetime DEFAULT NULL,
  created_by varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  created_on datetime DEFAULT NULL,
  due_date datetime DEFAULT NULL,
  in_progress_date datetime DEFAULT NULL,
  resolved_date datetime DEFAULT NULL,
  completed_date datetime DEFAULT NULL,
  cancelled_date DATETIME DEFAULT NULL,
  in_progress_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  proposed_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  reopened_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  overdue_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  last_updated_date datetime DEFAULT NULL,
  n_date date DEFAULT NULL,
  n_key int(15) DEFAULT 0,
  project_key int(15) DEFAULT 0,
  reassignment_count int(15) DEFAULT 0,
  reopen_count int(15) DEFAULT 0,
  row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  soft_deleted_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  source_id bigint(20) NOT NULL DEFAULT 0,
  summary varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  work_item_earliest_fixed_version_key int(15) DEFAULT 0,
  work_item_iteration_key int(15) DEFAULT 0,
  work_item_priority_src_key int(15) DEFAULT 0,
  work_item_status_src_key int(15) DEFAULT 0,
  work_item_resolution_src_key int(15) DEFAULT 0,
  business_value DECIMAL(28,10) DEFAULT NULL,
  story_points DECIMAL(28,10) DEFAULT NULL
  );
  
insert into #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, invalid_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select D.row_key as work_item_key,
SRC.age_since_creation as age_since_creation,
coalesce(ASGN.row_key, case when SRC.assignee is null then 0 else -1 end) as assigned_to_key,
SRC.cdctype as cdctype,
SRC.changed_by as changed_by,
SRC.changed_on as changed_on,
SRC.created_by as created_by,
convert_tz(SRC.created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') as created_on,
SRC.due_on as due_date,
SRC.in_progress_on as in_progress_date,
SRC.resolved_on as resolved_date,
SRC.completed_on as completed_date,
SRC.cancelled_on as cancelled_date,
SRC.in_progress_flag as in_progress_flag,
SRC.proposed_flag as proposed_flag,
SRC.reopened_flag as reopened_flag,
SRC.overdue_flag as overdue_flag,
SRC.invalid_flag as invalid_flag,
SRC.last_updated_on as last_updated_date,
SRC.n_date as n_date,
SRC.n_key as n_key,
coalesce(PROJ.row_key, case when SRC.project is null then 0 else -1 end) as project_key,
SRC.reassignment_count as reassignment_count,
SRC.reopen_count as reopen_count,
SRC.issueid as row_id,
cast((case when SRC.cdctype = 'D' then 'Y' else 'N' end) as char(1)) as soft_deleted_flag,
SRC.sourceinstance as source_id,
SRC.summary as summary,
SRC.work_item_earliest_fixed_version_key as work_item_earliest_fixed_version_key,
SRC.work_item_iteration_key as work_item_iteration_key,
coalesce(PRIO.row_key, case when SRC.work_item_priority is null then 0 else -1 end) as work_item_priority_src_key,
coalesce(STATUS.row_key, case when SRC.work_item_status is null then 0 else -1 end) as work_item_status_src_key,
coalesce(RESOLUTION.row_key, case when SRC.work_item_resolution is null then 0 else -1 end) as work_item_resolution_src_key,
SRC.business_value as business_value,
SRC.story_points as story_points


from #STG_TABLE_SCHEMA.history_snapshot_monthly_temp SRC
left join #DWH_TABLE_SCHEMA.d_work_item D
on SRC.issueid=D.row_id
and SRC.sourceinstance=D.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ASGN
ON (concat('INTERNAL_CONTACT~', SRC.assignee) = ASGN.row_id 
AND SRC.sourceinstance=ASGN.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_project PROJ
ON (SRC.project = PROJ.row_id 
AND SRC.sourceinstance=PROJ.source_id)
left join #DWH_TABLE_SCHEMA.d_lov PRIO
on concat('PRIORITY~WORK_ITEM','~',upper(SRC.work_item_priority))=PRIO.src_rowid
and SRC.sourceinstance=PRIO.source_id
left join #DWH_TABLE_SCHEMA.d_lov STATUS
on concat('STATUS~WORK_ITEM','~',upper(SRC.work_item_status))=STATUS.src_rowid
and SRC.sourceinstance=STATUS.source_id
left join #DWH_TABLE_SCHEMA.d_lov RESOLUTION
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.work_item_resolution))=RESOLUTION.src_rowid
and SRC.sourceinstance=RESOLUTION.source_id;

insert into #STG_TABLE_SCHEMA.f_work_item_snpst_mn_base
(work_item_key, age_since_creation, assigned_to_key, cdctype, changed_by, changed_on, created_by, created_on, 
due_date, in_progress_date, resolved_date, completed_date, cancelled_date, in_progress_flag, proposed_flag , 
reopened_flag, overdue_flag, invalid_flag, last_updated_date, n_date, n_key, project_key, reassignment_count, reopen_count, row_id, soft_deleted_flag, source_id, summary, 
work_item_earliest_fixed_version_key, work_item_iteration_key, work_item_priority_src_key, work_item_status_src_key, work_item_resolution_src_key, business_value, story_points)

select F.work_item_key as work_item_key,
F.age_since_creation as age_since_creation,
D.work_item_assigned_to_key as assigned_to_key,
F.cdctype as cdctype,
F.changed_by as changed_by,
F.changed_on as changed_on,
F.created_by as created_by,
F.created_on as created_on,
D.due_on as due_date,
D.work_start_on as in_progress_date,
D.resolved_on as resolved_date,
D.completed_on as completed_date,
D.cancelled_on as cancelled_date,
D.in_progress_flag as in_progress_flag,
D.proposed_flag as proposed_flag,
D.reopened_flag as reopened_flag,
D.overdue_flag as overdue_flag,
D.invalid_flag as invalid_flag,
D.work_item_updated_on as last_updated_date,
CAL.month_start_date as n_date,
CAL.month_start_date_key as n_key,
F.project_key as project_key,
F.reassignment_count as reassignment_count,
F.reopen_count as reopen_count,
F.row_id as row_id,
F.soft_deleted_flag as soft_deleted_flag,
F.source_id as source_id,
D.short_description as summary,
D.earliest_fixed_version_key as work_item_earliest_fixed_version_key,
D.iteration_key as work_item_iteration_key,
D.work_item_priority_src_key as work_item_priority_src_key, 
D.work_item_status_src_key as work_item_status_src_key,
D.work_item_resolution_src_key as work_item_resolution_src_key,
F.business_value as business_value,
F.story_points as story_points

from #DWH_TABLE_SCHEMA.f_work_item F
left join  #DWH_TABLE_SCHEMA.d_work_item D
ON F.work_item_key = D.row_key
left join (
select source_id, max(lastupdated) as last_updated
from #DWH_TABLE_SCHEMA.d_o_data_freshness 
where sourcename = 'Jira_Tenant' group by source_id) ODF 
on ODF.source_id = F.source_id
left join  #DWH_TABLE_SCHEMA.d_calendar_date CAL
ON (date_format(ODF.last_updated,'%Y%m%d') = CAL.row_id);
