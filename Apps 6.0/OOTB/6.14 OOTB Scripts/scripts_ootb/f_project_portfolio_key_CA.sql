SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.schedule_variance' ELSE 'SUCCESS' END as Message 
 FROM (select * from    #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from   #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select min(id) as id, investment_id as investment_id, portfolio_id,sourceinstance from #MDS_TABLE_SCHEMA.pfm_investments_final 
where odf_object_code='PROJECT'  group by investment_id,sourceinstance)pfm1
on pfm1.investment_id=SRC.id
 LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_portfolio)LKP
ON pfm1.portfolio_id = LKP.row_id
and TRGT.source_id=LKP.source_id
where  coalesce(LKP.row_key, case when pfm1.portfolio_id is null then 0 else -1 end) <> coalesce(TRGT.portfolio_key, '');