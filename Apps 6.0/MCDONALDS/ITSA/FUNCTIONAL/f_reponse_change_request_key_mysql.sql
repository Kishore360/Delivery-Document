SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.standard_change_c_key' ELSE 'SUCCESS' END as Message 
FROM (SELECT a11.sys_id,a11.sourceinstance,a13.task
from mcdonalds_mds_viewdb.survey_response_final a11
join mcdonalds_mds_viewdb.survey_question_new_final a12 ON a11.question = a12.sys_id
JOIN mcdonalds_mds_viewdb.task_assessment_final a13 ON a11.instance = a13.instance) src
LEFT JOIN mcd_mdwdb.f_response trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_change_request lkp ON COALESCE(src.task,'UNSPECIFIED') = lkp.row_id
WHERE COALESCE(lkp.row_key, CASE WHEN src.task IS NULL THEN 0 ELSE -1 END) <> trgt.change_request_key 
