SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.is_top_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT * FROM #MDS_TABLE_SCHEMA.inv_investments_final  where odf_object_code='project' and cdctype<>'D') SRC 
INNER JOIN(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID 
LEFT JOIN(select ps.* from #MDS_TABLE_SCHEMA.prsubproject_final ps inner join
#MDS_TABLE_SCHEMA.prtask_final pt on pt.prid =ps.PRTASKID inner join
#MDS_TABLE_SCHEMA.inv_projects_final ip on ip.PRID=pt.PRPROJECTID
where ps.cdctype<>'D' and IS_PROGRAM=0 and IS_TEMPLATE = 0 )SRC2
on SRC.id=SRC2.prrefprojectid
LEFT JOIN  #DWH_TABLE_SCHEMA.d_project TRGT 
ON (SRC.id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(case when SRC2.prid IS NULL THEN 'Y' else 'N' end,'')<> COALESCE(TRGT.is_top_flag,'');