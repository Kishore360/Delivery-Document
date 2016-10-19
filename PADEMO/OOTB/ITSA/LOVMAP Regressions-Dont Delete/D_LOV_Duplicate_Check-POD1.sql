select distinct * from (
select case when count(1) > 0 then 'FAILURE-gogo' else 'SUCCESS-gogo' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from gogo_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-netflix' else 'SUCCESS-netflix' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from netflix_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-pgi' else 'SUCCESS-pgi' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from pgi_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-redbull' else 'SUCCESS-redbull' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from redbull_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-rei' else 'SUCCESS-rei' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from rei_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-ucla' else 'SUCCESS-ucla' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from uclahealth_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-usf' else 'SUCCESS-usf' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from usf_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
union all
select case when count(1) > 0 then 'FAILURE-weill' else 'SUCCESS-weill' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from weillcornell_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a
)a