select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.reassignment_count_numerify' ELSE 'SUCCESS' END as Messag
from watson_mdwdb.f_case f 
join (select fa.case_key, fa.source_id, count(1) as primary_sequence_id
		from watson_mdwdb.f_case_activity fa
		where fa.task_wh_type='sn_customerservice_case' and fa.task_attribute_wh_name='assignment_group'  
		and fa.task_attribute_wh_old_value is not NULL 
		group by fa.case_key) SQ
on f.case_key=SQ.case_key and f.source_id = SQ.source_id
where f.reassignment_count_numerify <> COALESCE(SQ.primary_sequence_id,0)
