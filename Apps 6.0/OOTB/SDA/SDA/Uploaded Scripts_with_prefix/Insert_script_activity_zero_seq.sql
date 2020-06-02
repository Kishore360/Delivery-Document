insert into #STG_TABLE_SCHEMA.issue_activity_temp
(sys_id, author_key, issue_changelog_issueid, created, issue_changelog_sourceinstance, issue_changelog_cdctype, 
id, fromstring, issuechangelogid, issue_cnglg_itm_issueid, issue_cnglg_itm_sourceinstance, 
issue_cnglg_itm_cdctype, `field`, `from`, `to`, tostring, inserted_on, primary_sequence_id)

select concat(LPAD(issue.id,50,0), '~', tbl_task_attribute.task_attribute, '~', LPAD(0,50,0)) as sys_id,
issue.creator_key ,
issue.id as issue_changelog_issueid,
issue.created ,
issue.sourceinstance as issue_changelog_sourceinstance,
issue.cdctype issue_changelog_cdctype,
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
WHEN tbl_task_attribute.task_attribute = 'STORY POINTS' THEN CASE WHEN ASCII(issue.story_points)>=49 AND ASCII(issue.story_points)<=57 THEN CAST(issue.story_points AS DECIMAL(28,10)) ELSE NULL END
WHEN tbl_task_attribute.task_attribute = 'BUSINESS VALUE' THEN issue.business_value
END
END as `to` ,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'STATUS' THEN LOV.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ITERATION' THEN ITE.row_id 
WHEN tbl_task_attribute.task_attribute = 'TIMEORIGINALESTIMATE' THEN LKP.originalestimateseconds 
WHEN tbl_task_attribute.task_attribute = 'STORY POINTS' THEN CASE WHEN ASCII(issue.story_points)>=49 AND ASCII(issue.story_points)<=57 THEN CAST(issue.story_points AS DECIMAL(28,10)) ELSE NULL END
WHEN tbl_task_attribute.task_attribute = 'BUSINESS VALUE' THEN issue.business_value
END
END as tostring ,
current_timestamp,
0 as primary_sequence_id
FROM #MDS_TABLE_SCHEMA.issue_final issue
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
ON issue.id=tmp.issue_changelog_issueid 
AND issue.sourceinstance=tmp.issue_changelog_sourceinstance 
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