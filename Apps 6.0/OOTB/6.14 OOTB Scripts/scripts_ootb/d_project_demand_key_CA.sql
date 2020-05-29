SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN(select min(created_date) as min_created,idea_id,sourceinstance from  
#MDS_TABLE_SCHEMA.inv_investments_final where idea_id is not null group by idea_id,sourceinstance)SRC10
on SRC10.idea_id=SRC.idea_id
and SRC10.min_created=SRC.created_date
and SRC10.sourceinstance=SRC.sourceinstance
LEFT JOIN(select * from #DWH_TABLE_SCHEMA.d_demand)LKP
on SRC10.idea_id=LKP.row_id
and SRC10.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,case when SRC10.idea_id is null then 0 else -1 end, '') <> coalesce(TRGT.demand_key,'')

