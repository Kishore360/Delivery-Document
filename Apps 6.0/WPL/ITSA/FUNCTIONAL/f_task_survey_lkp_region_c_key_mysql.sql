SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_task_survey.lkp_region_c_key' ELSE 'SUCCESS' END as Message
FROM
(select count(1) as CNT FROM
(select sys_id,sourceinstance from wpl_mdsdb.task_survey_final src1
union
select sys_id,sourceinstance from wpl_mdsdb.asmt_assessment_instance_final src2) src
join wpl_mdwdb.f_task_survey a
on src.sys_id=a.row_id and src.sourceinstance=a.source_id
 JOIN wpl_mdwdb.f_request_item i ON a.request_item_key=i.request_item_key
 LEFT JOIN wpl_mdwdb.d_internal_contact ic ON i.requested_for_key = ic.row_key
 where ic.lkp_region_c_key <> CASE WHEN a.lkp_region_c_key in (0,-1) THEN ic.lkp_region_c_key ELSE a.lkp_region_c_key END
 and a.lkp_region_c_key in (0,-1)
 ) der;