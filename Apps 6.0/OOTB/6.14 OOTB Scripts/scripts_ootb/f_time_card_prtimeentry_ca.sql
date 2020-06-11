--Need to change query after reivew with dev

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.prtimeentry' ELSE 'SUCCESS' END as Message
FROM
(select prt.* from 
#MDS_TABLE_SCHEMA.prtimeentry_final prt  where  prt.CDCTYPE<>'D'
) src
Left outer join 
(select SLICE_DATE,prj_object_id from #MDS_TABLE_SCHEMA.prj_blb_slices_final a 
LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b on 
a.SLICE_REQUEST_ID = b.ID
WHERE 
b.REQUEST_NAME='DAILYRESOURCETIMECURVE') pr_slices
on src.prid=pr_slices.prj_object_id
left join #DWH_TABLE_SCHEMA.f_time_card trg on
 concat(src.PRID,COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),'UNSPECIFIED') )=trg.row_id
and src.sourceinstance=trg.source_id
where 
COALESCE(src.prid,'')<> COALESCE(trg.prtimeentry ,'');


