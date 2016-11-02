SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt 
from tesm_mdsdb.x_tori2_opd_incoming_alerts_final a
left  JOIN   tesm_mdwdb.d_x_tori2_opd_incoming_alerts_final_c b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
where a.alert_message <> b.alert_message_c) temp;