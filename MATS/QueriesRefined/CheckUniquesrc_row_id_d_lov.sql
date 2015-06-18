

select case when count(1) <> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <> 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (select source_id, src_rowid from <<tenant>>_mdwdb.<<tablename>> 
group by source_id, src_rowid
having count(1) > 1) A
