SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.weeks_to_due_date' ELSE 'SUCCESS' END as Message 
FROM  (select * from  #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from  #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
left join (select * from  #MDS_TABLE_SCHEMA.prj_ev_history_final SRC  where cdctype<>'D') SRC2
on  SRC.prid = SRC2.object_id and SRC.sourceinstance = SRC2.sourceinstance
LEFT JOIN  #DWH_TABLE_SCHEMA.f_project_task TRGT 
on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
 LEFT join 
(select source_id,max(lastupdated) as lastupdated from
 #DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=TRGT.source_id
 WHERE case when FRSH.lastupdated< TRGT.planned_end_on then round(DATEDIFF(TRGT.planned_end_on,FRSH.lastupdated)/7,2) 
        when FRSH.lastupdated>TRGT.planned_end_on then round(DATEDIFF(TRGT.planned_end_on,FRSH.lastupdated)/7,2) 
       else 0 end  <> round(coalesce(TRGT.weeks_to_due_date,''),2)