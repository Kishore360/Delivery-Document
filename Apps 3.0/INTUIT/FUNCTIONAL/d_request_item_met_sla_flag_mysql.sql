SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdwdb.d_request_item a 
where   met_sla_flag <>  CASE  WHEN TIMESTAMPDIFF(day, opened_on, closed_on) <= 4 THEN 'Y' 
 ELSE 'N' end
) g