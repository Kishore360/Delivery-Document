select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,count(1)
from <<tenant>>_mdwdb.d_lov 
group by 1,2
having count(1)>1)a;



