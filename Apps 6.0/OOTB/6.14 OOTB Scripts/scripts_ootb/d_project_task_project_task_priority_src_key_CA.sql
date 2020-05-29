SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.project_task_priority_src_key' ELSE 'SUCCESS' END as Message
FROM  (SELECT CASE when prpriority between 0 and 9 then 1
when prpriority between  10 and 20 then 2
when prpriority between 21 and 36 then 3
else null end as prt,PRID, sourceinstance,prprojectid from #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from   #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
 and SRC1.sourceinstance=SRC10.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_project_task)TRGT   
	ON SRC.prid =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (concat('PROJECT_TASK','~','PRIORITY','~',SRC.prt) = LKP.src_rowid 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.prt IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.project_task_priority_src_key,'')
 
 
