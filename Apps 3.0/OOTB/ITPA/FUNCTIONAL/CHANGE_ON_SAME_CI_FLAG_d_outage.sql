select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'CHANGE_ON_SAME_CI_FLAG validation failed for d_outage' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_outage d
left join <<tenant>>_mdwdb.f_outage f
on f.outage_key=d.row_key
left join <<tenant>>_mdwdb.f_change_request f_chng
on f.caused_by_change_key = f_chng.change_request_key
where case when f.configuration_item_key=f_chng.configuration_item_key 
and f.configuration_item_key not in (0,-1)
and f_chng.configuration_item_key not in (0,-1)
then 'Y' else 'N' end <> d.CHANGE_ON_SAME_CI_FLAG
and d.row_key not in (0,-1);
