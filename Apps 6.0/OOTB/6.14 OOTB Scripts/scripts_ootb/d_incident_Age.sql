SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Age is not matching for d_incident Age' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_incident D
join #DWH_TABLE_SCHEMA.f_incident F
on (F.row_id=D.row_id)
where coalesce( D.age ,'')<>coalesce(floor(F.age/86400) ,'');