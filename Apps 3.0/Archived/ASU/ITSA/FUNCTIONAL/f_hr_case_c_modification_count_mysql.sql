
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
FROM asu_mdsdb.hr_case_final
join asu_mdwdb.f_hr_case_c on sys_id=row_id and sourceinstance=source_id
where sys_mod_count<>modification_count


