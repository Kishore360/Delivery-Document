SELECT 
CASE WHEN CNT > 2 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >2 THEN 'Multiple 0 and -1 in the dim table LOV MAP' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as CNT
from <<tenant>>_mdwdb.d_lov_map where row_key in (-1,0))a;