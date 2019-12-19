
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt  from 
(select  a.number,e.sys_name,response,coso_impact_service_avail_c
from png_mdsdb.task_final a
join png_mdsdb.task_assessment_final b on a.sys_id=b.task and b.sourceinstance=2 
join png_mdsdb.assessment_master_final c on b.assessment=c.sys_id and c.sourceinstance=2
join png_mdsdb.survey_response_final d on b.instance=d.instance and d.sourceinstance=2
join png_mdsdb.survey_question_new_final e on d.question=e.sys_id and e.sourceinstance=2
join png_mdwdb.d_change_request d1 on a.sys_id=d1.row_id and a.sourceinstance=d1.source_id
join  png_mdwdb.d_change_failure f on d1.row_key=f.change_request_key 
WHERE -- a.number='CHG0139447' and 
a.sys_class_name='change_request' -- and question='827cacde6fc8f6006f94c951be3ee4d3';
 and  c.sys_name in ('Change Impact Assessment') and e.sys_name like '%service availability impact:%'  
 
)a
where response<>coso_impact_service_avail_c)b
;


