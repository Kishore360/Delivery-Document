select distinct * from (
select case when count(1) > 0 then 'FAILURE-intuit' else 'SUCCESS-intuit' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from intuit_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a union all 
select case when count(1) > 0 then 'FAILURE-wow' else 'SUCCESS-wow' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from wow_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a union all 
select case when count(1) > 0 then 'FAILURE-MI' else 'SUCCESS-MI' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from mercuryinsurance_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a union all 
select case when count(1) > 0 then 'FAILURE-tesm' else 'SUCCESS-tesm' end as Result,
case when count(1) > 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (
select row_id,source_id,dimension_class
from tesm_mdwdb.d_lov
group by 1,2,3
having count(1)>1)a )a
