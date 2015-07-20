SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN ' f_n_asset_quarterly has records which are not having correct flag' ELSE 'SUCCESS' END as Message
from 
usf_mdwdb.f_n_asset_quarterly a join usf_mdwdb.d_calendar_date b
on a.n_key = b.row_id 
and b.lagging_count_of_quarter =0 
where 
(case when 
(a.retirement_date between  b.quarter_start_date  and b.quarter_end_date ) then 'Y'
else 'N' end )
<>a.is_retiring ;
