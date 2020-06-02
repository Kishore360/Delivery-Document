insert into #STG_TABLE_SCHEMA.issue_activity_azure_base
(sys_id, authorkey, issueid, created, sourceinstance, cdctype, id, fromstring, `from`, tostring, `to`, `field`, sequence_id, inserted_on, primary_sequence_id)

select concat(issue.__numerify__primary_key, '~', tbl_task_attribute.task_attribute, '~', 0) as sys_id,
issue.createdByKey ,
issue.__numerify__primary_key as issueid,
issue.createdDate ,
issue.sourceinstance as sourceinstance,
issue.cdctype cdctype,
issue.__numerify__primary_key as id,
null as fromstring ,
null as `from` ,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'STATUS' THEN LOV.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ITERATION' THEN ITE.row_id 
WHEN tbl_task_attribute.task_attribute = 'TIMEORIGINALESTIMATE' THEN issue.msvsts_scheduling_originalestimate 
WHEN tbl_task_attribute.task_attribute = 'STORY POINTS' THEN CASE WHEN ASCII(issue.msvsts_scheduling_storypoints)>=49 AND ASCII(issue.msvsts_scheduling_storypoints)<=57 THEN CAST(issue.msvsts_scheduling_storypoints AS DECIMAL(28,10)) ELSE NULL END
WHEN tbl_task_attribute.task_attribute = 'BUSINESS VALUE' THEN issue.msvsts_common_businessvalue
END
END as tostring ,
CASE WHEN tmp.sys_id IS NOT NULL THEN COALESCE(tmp.`from`, tmp.fromstring)    
ELSE CASE WHEN tbl_task_attribute.task_attribute = 'STATUS' THEN LOV.dimension_code      
WHEN tbl_task_attribute.task_attribute = 'ITERATION' THEN ITE.row_id 
WHEN tbl_task_attribute.task_attribute = 'TIMEORIGINALESTIMATE' THEN issue.msvsts_scheduling_originalestimate 
WHEN tbl_task_attribute.task_attribute = 'STORY POINTS' THEN CASE WHEN ASCII(issue.msvsts_scheduling_storypoints)>=49 AND ASCII(issue.msvsts_scheduling_storypoints)<=57 THEN CAST(issue.msvsts_scheduling_storypoints AS DECIMAL(28,10)) ELSE NULL END
WHEN tbl_task_attribute.task_attribute = 'BUSINESS VALUE' THEN issue.msvsts_common_businessvalue
END
END as `to` ,
tbl_task_attribute.task_attribute as `field` ,
0 as sequence_id,
current_timestamp as inserted_on, 
0 as primary_sequence_id
FROM #STG_TABLE_SCHEMA.workitem_temp_azure issue
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
left join #STG_TABLE_SCHEMA.issue_activity_azure_base tmp
ON issue.__numerify__primary_key=tmp.issueid 
AND issue.sourceinstance=tmp.sourceinstance 
AND tmp.primary_sequence_id=1 
AND tmp.field=tbl_task_attribute.task_attribute 
left join #DWH_TABLE_SCHEMA.d_lov LOV
ON ( CONCAT('STATUS','~','WORK_ITEM','~',UPPER(issue.state)) = LOV.src_rowid 
AND issue.sourceinstance=LOV.source_id 
AND LOV.dimension_class='STATUS~WORK_ITEM')
left join #DWH_TABLE_SCHEMA.d_work_item D
on concat(issue.__numerify__primary_key, '')=D.row_id
and issue.sourceinstance=D.source_id 
LEFT JOIN #DWH_TABLE_SCHEMA.d_iteration ITE 
ON D.iteration_key=ITE.row_key 
AND D.source_id=ITE.source_id;