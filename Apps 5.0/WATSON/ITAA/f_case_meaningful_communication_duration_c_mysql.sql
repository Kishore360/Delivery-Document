
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_case.meaningful_communication_duration_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
from watson_mdsdb.sn_customerservice_case_final src 
join watson_mdwdb.f_case trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
LEFT JOIN
(select a.element_id,min(a.sys_created_on) as created_on from watson_mdsdb.sys_journal_field_final a
join watson_mdsdb.sn_customerservice_case_final src2
ON a.element_id = src2.sys_id and a.sourceinstance = src2.sourceinstance 
join watson_mdsdb.sys_user_final src3 on src2.contact=src3.sys_id and src2.sourceinstance=src3.sourceinstance
where a.sys_created_by not in ('system','IMS.SA') and a.element='comments' and src3.user_name<>a.sys_created_by
group by 1 ) c ON trgt.row_id = c.element_id
Where 
trgt.meaningful_communication_duration_c <> timestampdiff(second, src.opened_at,c.created_on)
) temp;

