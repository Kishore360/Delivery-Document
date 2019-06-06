select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select source_id,row_id,count(1)
from mercuryins_mdwdb.d_lov 
where row_id not like '%CITY~GEO%'
group by 1,2
having count(1)>1)a;



