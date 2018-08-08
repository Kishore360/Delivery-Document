
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_case.meaningful_communication_duration_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
 FROM watson_mdsdb.sn_customerservice_case_final b
 left join watson_mdwdb.f_case a
on a.row_id = b.sys_id and a.source_id = b.sourceinstance
LEFT JOIN
(select element_id,count(sys_created_by) as cnt from watson_mdsdb.sys_journal_field_final
where sys_created_by not in ('system','IMS.SA') and element='comments' -- and  element_id='0009a173db641f447665d92b5e9619ab' --  (3)
group by 1  ) c ON a.row_id = c.element_id
Where 
a.meaningful_updates_count_c <> c.cnt
) temp;


