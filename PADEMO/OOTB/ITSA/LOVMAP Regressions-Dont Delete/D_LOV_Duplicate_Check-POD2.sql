select distinct * from (
select case when count(1) > 0 then 'FAILURE-hd' else 'SUCCESS-hd' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from homedepot_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-ram' else 'SUCCESS-ram' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from rambus_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-star' else 'SUCCESS-star' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from starwood_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-svb' else 'SUCCESS-svb' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from svb_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
)a