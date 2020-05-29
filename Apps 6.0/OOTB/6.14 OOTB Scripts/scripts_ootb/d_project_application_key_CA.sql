SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from    #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from   #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(TRGT.application_key,'')<> 0