SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM
(select * from 
#MDS_TABLE_SCHEMA.prtimeentry_final prt where  prt.CDCTYPE<>'D') src
Left outer join 
(select REQUEST_NAME,SLICE_DATE,prj_object_id from #MDS_TABLE_SCHEMA.prj_blb_slices_final a 
LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b on 
a.SLICE_REQUEST_ID = b.ID
WHERE 
a.cdctype<>'D' and b.cdctype<>'D') pr_slices
on src.prid=pr_slices.prj_object_id
left join #DWH_TABLE_SCHEMA.f_time_card trg on
 concat(src.PRID,COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),'UNSPECIFIED') )=trg.row_id
and src.sourceinstance=trg.source_id
where 
pr_slices.REQUEST_NAME='DAILYRESOURCETIMECURVE' and 
COALESCE(CASE WHEN src.cdctype ='D' THEN 'D'     ELSE 'N' END,'')<>COALESCE(trg.soft_deleted_flag,'');

 
