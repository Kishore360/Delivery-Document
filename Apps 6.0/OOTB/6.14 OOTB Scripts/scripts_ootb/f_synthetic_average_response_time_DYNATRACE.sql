SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_synthetic.average_response_time' ELSE 'SUCCESS' END as Message
FROM (select coalesce(b.__numerify__primary_key,c.__numerify__primary_key) as __numerify__primary_key, 
a.GEOLOCATION, b.availability, c.AVG*.001 as AVG,
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
on a.__numerify__primary_key=c.__numerify__primary_key
 ) SRC
left join #DWH_TABLE_SCHEMA.f_synthetic TRGT
on SRC.__numerify__primary_key =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.average_response_time,'')<>COALESCE(SRC.AVG,'')

