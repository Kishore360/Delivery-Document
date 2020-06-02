SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to Row count validation failed for f_time_card' ELSE 'SUCCESS' END as Message
FROM
(select count(*) src_count from 
#MDS_TABLE_SCHEMA.prtimeentry_final prt 
Left outer join 
#MDS_TABLE_SCHEMA.prj_blb_slices_final a  on prt.prid=a.prj_object_id
LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b on 
a.SLICE_REQUEST_ID = b.ID
WHERE 
prt.CDCTYPE<>'D' and 
b.REQUEST_NAME='DAILYRESOURCETIMECURVE' and a.cdctype<>'D' and b.cdctype<>'D') src,
(select count(*) trg_count from  #DWH_TABLE_SCHEMA.f_time_card ) trg
where 
src.src_count<>trg.trg_count;