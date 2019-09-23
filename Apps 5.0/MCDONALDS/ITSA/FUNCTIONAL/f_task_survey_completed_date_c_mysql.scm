


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
FROM (
select count(1) cnt from  mcdonalds_mdsdb.task_survey_final
left join mcdonalds_mdwdb.f_task_survey on sys_id=row_id
where completed_date<>coalesce(completed_date_c,'UNSPECIFIED'))A


