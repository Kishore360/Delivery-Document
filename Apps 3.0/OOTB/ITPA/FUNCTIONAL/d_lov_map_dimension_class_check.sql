select case when count(1) >1 then 'SUCCESS' else 'FAILURE' end as Result
,case when count(1) >1 then 'SUCCESS' else #DIMENSION_CLASS || 'not present in d_lov_map' end as Message
from <<tenant>>_mdwdb.d_lov_map
where dimension_class =#DIMENSION_CLASS;
