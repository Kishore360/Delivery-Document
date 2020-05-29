SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_synthetic.monitor_key' ELSE 'SUCCESS' END as Message
FROM 
 ( select coalesce(b.GEOLOCATION,c.GEOLOCATION) as GEOLOCATION,coalesce(b.__numerify__primary_key,c.__numerify__primary_key) as __numerify__primary_key, 
coalesce(b.cdctype,c.cdctype) as cdctype, coalesce(b.sourceinstance,c.sourceinstance) as sourceinstance
,coalesce(b.SYNTHETIC_TEST,c.SYNTHETIC_TEST) SYNTHETIC_TEST
from 
(
select __numerify__primary_key ,GEOLOCATION
from  #MDS_TABLE_SCHEMA.availability_final SRC1
union 
select __numerify__primary_key  ,GEOLOCATION
from (select * from #MDS_TABLE_SCHEMA.location_responsetime_final where upper(AVG) not in ('NULL','NAN')) SRC2
) a
left outer join 
#MDS_TABLE_SCHEMA.availability_final b
on a.__numerify__primary_key=b.__numerify__primary_key
left outer join 
(select * from #MDS_TABLE_SCHEMA.location_responsetime_final where upper(AVG) not in ('NULL','NAN')) c
on a.__numerify__primary_key=c.__numerify__primary_key)SRC
 left join #DWH_TABLE_SCHEMA.d_monitor SRC3
 on SRC3.entity_id=SRC.SYNTHETIC_TEST

  left join #DWH_TABLE_SCHEMA.f_synthetic TRGT
on SRC.__numerify__primary_key =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.monitor_key,'')<>COALESCE(SRC3.row_key,'') ;