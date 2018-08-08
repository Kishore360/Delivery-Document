
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_case.last_meaningful_communication_duration_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
 FROM watson_mdsdb.sn_customerservice_case_final b
 left join watson_mdwdb.f_case a
on a.row_id = b.sys_id and a.source_id = b.sourceinstance
LEFT JOIN
(select element_id,max(sys_created_on) as created_on from watson_mdsdb.sys_journal_field_final
where sys_created_by not in ('system','IMS.SA') and element='comments' 
group by 1 ) c ON a.row_id = c.element_id
Where 
a.last_meaningful_communication_duration_c <> timestampdiff(second, b.opened_at,c.created_on)
) temp;


