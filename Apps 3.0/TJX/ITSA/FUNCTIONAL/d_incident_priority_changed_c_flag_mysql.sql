SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.priority_escalated_flag' ELSE 'SUCCESS' END as Message from (
select count(1) cnt from (
select case when priority_escalated_flag='Y' or priority_downgraded_c_flag='Y' then 'Y' else 'N' end as SRC,priority_changed_c_flag TRGT
from tjx_mdwdb.d_incident )a
where SRC<>TRGT)b


