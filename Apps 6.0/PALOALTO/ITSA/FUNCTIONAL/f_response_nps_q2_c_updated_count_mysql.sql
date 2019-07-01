SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select coalesce(replace(d.string_value,'\n',''),''),f.response
from paloalto_mdsdb.asmt_assessment_instance_question_final a 
join paloalto_mdsdb.asmt_assessment_instance_final b on (a.instance = b.sys_id) 
join paloalto_mdsdb.asmt_metric_type_final c on (b.metric_type = c.sys_id and c.evaluation_method = 'survey' and 
c.description = 'NPS Survey' and c.name = 'NPS  Service Desk Survey')
join paloalto_mds_viewdb.asmt_metric_final e on (e.sys_id = a.metric and e.question = 
'Please provide us with the primary reason for your response.')
join paloalto_mdsdb.sys_user_final u on (b.user = u.sys_id)
left join paloalto_mdsdb.asmt_metric_result_final d on (d.instance = a.instance and a.metric = d.metric)
join paloalto_mdwdb.f_response_nps_q2_c f
on a.sys_id=f.row_id and a.sourceinstance=f.source_id
where a.sys_mod_count<>f.updated_count;