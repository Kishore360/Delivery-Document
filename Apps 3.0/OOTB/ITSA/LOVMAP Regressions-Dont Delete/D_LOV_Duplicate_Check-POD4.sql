select distinct * from (
select case when count(1) > 0 then 'FAILURE-ucsf' else 'SUCCESS-ucsf' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from ucsf_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
)a