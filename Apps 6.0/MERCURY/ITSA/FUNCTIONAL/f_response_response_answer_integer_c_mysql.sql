SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (select count(1) as cnt
from  mercury_mdsdb.asmt_assessment_instance_question_final a
JOIN mercury_mdsdb.asmt_assessment_instance_final b on (a.instance = b.sys_id) and a.CDCTYPE<>'D'
LEFT JOIN (
SELECT number,string_value,instance_question from mercury_mdsdb.asmt_metric_result_final abc
JOIN mercury_mdsdb.asmt_assessment_instance_final xyz on (xyz.sys_id = abc.instance) -- and abc.CDCTYPE<>'D'
WHERE actual_value = -1.00 )d2 on d2.number = b.number  and d2.instance_question = a.sys_id
JOIN mercury_mdsdb.asmt_metric_type_final c on (b.metric_type = c.sys_id and c.evaluation_method = 'survey')
LEFT JOIN mercury_mdsdb.asmt_metric_result_final d on (d.instance_question = a.sys_id) and d.CDCTYPE<>'D'
join
mercury_mdwdb.f_response fr on fr.row_id=a.sys_id
where  fr.response_answer_integer_c <>
CASE
   WHEN d.actual_value < 0 THEN d.string_value
   WHEN d.string_value is NOT NULL and d.actual_value is NOT NULL THEN CONCAT(d.actual_value ,' - ',d2.string_value)
   WHEN d.string_value is NOT NULL and d.actual_value is NULL THEN d2.string_value
   WHEN d.string_value is NULL and d.actual_value is NOT NULL THEN d.actual_value
   WHEN d.string_value is NULL and d.actual_value is NULL then NULL END
)c
