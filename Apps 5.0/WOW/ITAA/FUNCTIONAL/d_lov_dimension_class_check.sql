select case when count(1) >1 then 'SUCCESS' else 'FAILURE' end as Result
,case when count(1) >1 then 'SUCCESS' else #DIMENSION_CLASS || 'not present in d_lov' end as Message
from wow_mdwdb.d_lov
where dimension_class =#DIMENSION_CLASS;