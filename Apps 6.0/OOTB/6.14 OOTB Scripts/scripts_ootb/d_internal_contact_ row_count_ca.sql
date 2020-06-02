SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project_task' ELSE 'SUCCESS' END as Message
from
(select * from
 (
 select  count(*) count_src,src1.sourceinstance from
(select * from   #MDS_TABLE_SCHEMA.srm_resources_final where cdctype<>'D')src1
inner join 
(select * from   #MDS_TABLE_SCHEMA.prj_resources_final where prisrole=0)src2
on src1.id = src2.prid and  src1.sourceinstance=src2.sourceinstance
) count_src,
(select count(*) as count_trgt,trgt.source_id from
 (select * from  #MDS_TABLE_SCHEMA.srm_resources_final  where cdctype<>'D') sd
 left join 
(select * from   #MDS_TABLE_SCHEMA.prj_resources_final where prisrole=0)src3
on sd.id=src3.prid and sd.sourceinstance=src3.sourceinstance
 left join (select * from  #DWH_TABLE_SCHEMA.d_internal_contact)trgt
 on  sd.sourceinstance=trgt.source_id)count_trgt
  where count_src.count_src <> count_trgt.count_trgt
     )SQ