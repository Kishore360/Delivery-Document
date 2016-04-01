SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
wow_mdsdb.change_request_final a
join wow_mdwdb.d_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.lead_time_c_flag<> case when a.u_lead_time='0' then 'N' else 'Y' end;