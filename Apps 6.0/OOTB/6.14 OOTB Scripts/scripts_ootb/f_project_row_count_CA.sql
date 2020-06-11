SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_project' ELSE 'SUCCESS' END as Message
from 
(select * from
 (
 select  count(*) count_src,src1.sourceinstance from
(select * from   #MDS_TABLE_SCHEMA.inv_investments_final where cdctype<>'D')src1
inner join 
(select * from   #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')src2
on src1.ID=src2.PRID and src1.sourceinstance=src2.sourceinstance
) count_src,
(select count(*) as count_trgt,trgt.source_id from
 (select * from  #MDS_TABLE_SCHEMA.inv_investments_final  where cdctype<>'D') sd
 left join 
(select * from   #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')src3
on sd.id=src3.prid and sd.sourceinstance=src3.sourceinstance
 left join (select * from  #DWH_TABLE_SCHEMA.f_project)trgt
 on sd.id=trgt.row_id
 and sd.sourceinstance=trgt.source_id)count_trgt
  where count_src.count_src = count_trgt.count_trgt
     )SQ ;