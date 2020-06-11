SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project_task' ELSE 'SUCCESS' END as Message
from 
(select * from
 (
 select  count(*) count_src,src1.sourceinstance from
(select * from   #MDS_TABLE_SCHEMA.prtask_final where cdctype<>'D')src1
inner join 
(select * from   #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D')src2
on src1.prprojectid=src2.id and src1.sourceinstance=src2.sourceinstance
) count_src,
(select count(*) as count_trgt,trgt.source_id from
 (select * from  #MDS_TABLE_SCHEMA.prtask_final  where cdctype<>'D') sd
 left join 
(select * from   #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D')src3
on sd.prprojectid=src3.id and sd.sourceinstance=src3.sourceinstance
 left join (select * from #DWH_TABLE_SCHEMA.f_project_task)trgt
 on sd.prprojectid=trgt.row_id
 and sd.sourceinstance=trgt.source_id)count_trgt
  where count_src.count_src = count_trgt.count_trgt
     )SQ ;