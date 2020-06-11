drop table if exists #STG_TABLE_SCHEMA.issue_activity_temp;

create table if not exists #STG_TABLE_SCHEMA.issue_activity_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  author_key text COLLATE utf8_unicode_ci,
  issue_changelog_issueid int(11) DEFAULT NULL,
  created datetime DEFAULT NULL,
  issue_changelog_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  issue_changelog_cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  id int(11) NOT NULL DEFAULT '0',
  fromstring text COLLATE utf8_unicode_ci,
  issuechangelogid int(11) NOT NULL DEFAULT '0',
  issue_cnglg_itm_issueid int(11) DEFAULT NULL,
  issue_cnglg_itm_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  issue_cnglg_itm_cdctype varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `from` text COLLATE utf8_unicode_ci,
  `to` text COLLATE utf8_unicode_ci,
  tostring text COLLATE utf8_unicode_ci,  
  primary_sequence_id bigint(20) NOT NULL DEFAULT '0',
  inserted_on datetime DEFAULT NULL,
  PRIMARY KEY (sys_id,issue_changelog_sourceinstance),
  INDEX base_idx (sys_id,issue_changelog_sourceinstance),
  INDEX second_idx (issue_changelog_issueid, issuechangelogid,`field`),
  INDEX third_idx (issue_changelog_issueid, issue_changelog_sourceinstance)
);

insert into #STG_TABLE_SCHEMA.issue_activity_temp
(sys_id, author_key, issue_changelog_issueid, created, issue_changelog_sourceinstance, issue_changelog_cdctype, 
id, fromstring, issuechangelogid, issue_cnglg_itm_issueid, issue_cnglg_itm_sourceinstance, 
issue_cnglg_itm_cdctype, `field`, `from`, `to`, tostring, inserted_on)

select concat(LPAD(SRC.issueid,50,0), '~', case when upper(SRC2.field) = 'SPRINT' THEN 'ITERATION' ELSE upper(SRC2.field) END, '~', LPAD(SRC2.issuechangelogid,50,0)) as sys_id,
SRC.author_key ,
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
case when upper(SRC2.field) = 'SPRINT' THEN 'ITERATION' ELSE upper(SRC2.field) END ,
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
/*on chng.chnglog = SRC2.issuechangelogid and chng.author_key = SRC.author_key and chng.issueid = SRC.issueid and chng.created = SRC.created
and chng.field = SRC2.field and chng.`to` = SRC2.`to` and chng.`from` = SRC2.`from` and chng.sourceinstance = SRC.sourceinstance*/
where SRC.cdctype <> 'D' and upper(SRC2.field) in ('STATUS', 'SPRINT', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE', 'PRIORITY', 'ASSIGNEE', 'ISSUETYPE', 'RESOLUTION') and
TRIM(SUBSTRING_INDEX(COALESCE(SRC2.from,SRC2.fromstring,0),',',-1)) <> TRIM(SUBSTRING_INDEX(COALESCE(SRC2.to,SRC2.tostring,0),',',-1));