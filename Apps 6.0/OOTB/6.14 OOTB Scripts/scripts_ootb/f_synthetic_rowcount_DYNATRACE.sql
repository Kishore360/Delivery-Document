  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact' ELSE 'SUCCESS' END as Message
 -- select * 
 from 

 (select count(*) count_src, sourceinstance from ( select coalesce(b.GEOLOCATION,c.GEOLOCATION) as GEOLOCATION,coalesce(b.__numerify__primary_key,c.__numerify__primary_key) as __numerify__primary_key, 
coalesce(b.cdctype,c.cdctype) as cdctype, coalesce(b.sourceinstance,c.sourceinstance) as sourceinstance
,b.availability
from 
(
select __numerify__primary_key ,GEOLOCATION, sourceinstance as source_id1
from  #MDS_TABLE_SCHEMA.availability_final SRC1
union 
select __numerify__primary_key  ,GEOLOCATION, sourceinstance as source_id1
from (select * from #MDS_TABLE_SCHEMA.location_responsetime_final /* where upper(AVG) not in ('NULL','NAN')*/) SRC2
) a
left outer join 
#MDS_TABLE_SCHEMA.availability_final b
 on a.source_id1=b.sourceinstance
and a.__numerify__primary_key=b.__numerify__primary_key
left outer join 
(select * from #MDS_TABLE_SCHEMA.location_responsetime_final /*where upper(AVG) not in ('NULL','NAN')*/) c
on a.source_id1=c.sourceinstance
and  a.__numerify__primary_key=c.__numerify__primary_key
) SRC
group by sourceinstance
) count_src,
 

 
 (select count(*) count_trgt, source_id from #DWH_TABLE_SCHEMA.f_synthetic  TRGT where TRGT.row_key not in (0, -1) ) count_trgt
 
 where count_src.sourceinstance=count_trgt.source_id
 and count_src.count_src <>count_trgt.count_trgt