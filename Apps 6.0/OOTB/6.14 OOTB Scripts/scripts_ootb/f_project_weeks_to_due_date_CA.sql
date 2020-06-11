SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from     #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from    #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
and TRGT.source_id = SRC.sourceinstance
LEFT join 
(select source_id,max(lastupdated) as lastupdated from
  #DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=TRGT.source_id
 WHERE case when FRSH.lastupdated< TRGT.planned_end_on then round(DATEDIFF(TRGT.planned_end_on,FRSH.lastupdated)/7,2) 
        when FRSH.lastupdated>TRGT.planned_end_on then round(DATEDIFF(TRGT.planned_end_on,FRSH.lastupdated)/7,2) 
       else 0 end  <> round(coalesce(TRGT.weeks_to_due_date,''),2)