drop table if exists app_test.issue_sys_audit_temp;

create table if not exists app_test.issue_sys_audit_temp (
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  authorRef text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  issueid int(11) DEFAULT NULL,
  created datetime DEFAULT NULL,
  sourceinstance bigint(20) NOT NULL DEFAULT '0',
  cdctype varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  id int(11) NOT NULL DEFAULT '0',
  fromstring text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  issuechangelogid int(11) NOT NULL DEFAULT '0',
  issue_cnglg_itm_issueid int(11) DEFAULT NULL,
  issue_cnglg_itm_sourceinstance bigint(20) NOT NULL DEFAULT '0',
  issue_cnglg_itm_cdctype varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `from` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `to` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  tostring text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,  
  PRIMARY KEY (sys_id,sourceinstance),
  INDEX base_idx (sys_id,sourceinstance),
  INDEX secon_idx (issueid, issuechangelogid,`field`)
);

insert into app_test.issue_sys_audit_temp
(sys_id, authorRef, issueid, created, sourceinstance, cdctype, 
id, fromstring, issuechangelogid, issue_cnglg_itm_issueid, issue_cnglg_itm_sourceinstance, 
issue_cnglg_itm_cdctype, `field`, `from`, `to`, tostring)

select concat(SRC.issueid, '~', SRC2.issuechangelogid, '~', SRC2.field) as sys_id,
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
SRC2.`field` ,
SRC2.`from` ,
SRC2.`to` ,
SRC2.tostring 
FROM #MDS_TABLE_SCHEMA.issue_changelog_final SRC
left join #MDS_TABLE_SCHEMA.issue_changelog_items_final SRC2
on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance;