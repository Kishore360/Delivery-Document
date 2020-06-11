
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_synthetic.location_key' ELSE 'SUCCESS' END as Message
FROM (select coalesce(b.__numerify__primary_key,c.__numerify__primary_key) as __numerify__primary_key, 
coalesce(c.GEOLOCATION ,b.GEOLOCATION) GEOLOCATION,
coalesce(b.cdctype,c.cdctype) as cdctype, coalesce(b.sourceinstance,c.sourceinstance) as sourceinstance
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
 left join #MDS_TABLE_SCHEMA.synthetic_location_detail_final SRC1
 on SRC1.entityId=SRC.GEOLOCATION
 
 left join #DWH_TABLE_SCHEMA.d_location SRC2
 on SRC2.source_id=SRC.sourceinstance
 AND   SRC1.name =SRC2.row_id
  left join #DWH_TABLE_SCHEMA.f_synthetic TRGT
on SRC.__numerify__primary_key =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.location_key,'')<>coalesce(SRC2.row_key,'')

