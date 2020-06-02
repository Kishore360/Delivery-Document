SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_availability' ELSE 'SUCCESS' END as Message
 from (
 select count_src
 from
  (
 select SRC1.sourceinstance, COUNT(*) count_src FROM
 (select * from #MDS_TABLE_SCHEMA.prj_blb_slices_final  where cdctype<>'D')SRC1
inner join 
(select * from #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final where cdctype<>'D' and request_name='DAILYRESOURCEAVAILCURVE')SRC2
on SRC1.slice_request_id=SRC2.ID and SRC1.sourceinstance=SRC2.sourceinstance
) count_src
left outer join
 (select source_id,count(*) count_trgt from #DWH_TABLE_SCHEMA.f_resource_availability TRGT where TRGT.row_key not in (0, -1)
 group by source_id) count_trgt
 on count_src.sourceinstance=count_trgt.source_id where count_src.count_src <>count_trgt.count_trgt)SQ
 