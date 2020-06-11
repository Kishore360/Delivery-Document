SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reassignment_count_numerify' ELSE 'SUCCESS' END as Message

-- select SRC.sys_id,TRGT.reassignment_count_numerify,SYS.reass_count
from  #DWH_TABLE_SCHEMA.d_incident SRC

left join #DWH_TABLE_SCHEMA.f_incident TRGT
on SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id
where 
SRC.soft_deleted_flag<>'Y' and TRGT.soft_deleted_flag<>'Y' and 
coalesce(TRGT.reassignment_count_numerify,'')<>coalesce(SRC.reassignment_count_numerify,'0');

