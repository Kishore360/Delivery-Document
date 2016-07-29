select case when count(1) <> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <> 0 then 'multiple source_id, src_rowid exists in d_lov' else 'SUCCESS' end as Message
from (select source_id, src_rowid from <<tenant>>_mdwdb.d_lov where row_key not in(0,-1) and src_rowid <>'~~~' and current_flag='Y'
and dimension_class not like '%ASSET%' and dimension_class not like '%PROJECT%' and dimension_class not like '%WARRANTY%'
group by source_id, src_rowid
having count(1) > 1) A 