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