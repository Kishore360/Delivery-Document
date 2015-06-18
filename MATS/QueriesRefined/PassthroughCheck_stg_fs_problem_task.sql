

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from PROBLEM_TASK_final to FS_PROBLEM_TASK did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdsdb.problem_task_final S 
JOIN app_test.lsm_ls_source_timezone L

ON(S.sourceinstance= L.sourceid)
WHERE CRC32(CONCAT( IFNULL(sys_id,'UNSPECIFIED'), IFNULL(sourceinstance,'UNSPECIFIED'), IFNULL(number,'UNSPECIFIED'), IFNULL(problem,'UNSPECIFIED'), IFNULL(convert_tz(opened_at,source_time_zone,target_time_zone),''), 'INTERNAL_CONTACT~' ,IFNULL(opened_by,'UNSPECIFIED'), IFNULL(location,'UNSPECIFIED'), IFNULL(cmdb_ci,'UNSPECIFIED'), IFNULL(assignment_group,''), 'INTERNAL_CONTACT~' ,IFNULL(assigned_to,'UNSPECIFIED'), IFNULL(convert_tz(closed_at,source_time_zone,target_time_zone),''), 'INTERNAL_CONTACT~' ,IFNULL(closed_by,'UNSPECIFIED'), IFNULL(convert_tz(due_date,source_time_zone,target_time_zone),'UNSPECIFIED'), IFNULL(contact_type,'UNSPECIFIED'), IFNULL(problem_state,'UNSPECIFIED'), IFNULL(related_incidents,'UNSPECIFIED'), IFNULL(impact,'UNSPECIFIED'), IFNULL(urgency,'UNSPECIFIED'), IFNULL(priority,'UNSPECIFIED'), IFNULL(time_worked,'UNSPECIFIED'), IFNULL(sys_domain,'UNSPECIFIED'), IFNULL(company,'UNSPECIFIED'), IFNULL(reassignment_count,'UNSPECIFIED'), IFNULL(sys_created_by,'UNSPECIFIED'), IFNULL(sys_updated_by,'UNSPECIFIED'), IFNULL(sys_created_on,'UNSPECIFIED'), IFNULL(sys_updated_on,'UNSPECIFIED'), IFNULL(description,'UNSPECIFIED'), IFNULL(short_description,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,'UNSPECIFIED'), IFNULL(source_id,'UNSPECIFIED'), IFNULL(problem_task_number,'UNSPECIFIED'), IFNULL(problem_id,'UNSPECIFIED'), IFNULL(opened_on,'UNSPECIFIED'), IFNULL(opened_by_id,'UNSPECIFIED'), IFNULL(location_id,'UNSPECIFIED'), IFNULL(configuration_item_id,'UNSPECIFIED'), IFNULL(assignment_group_id,'UNSPECIFIED'), IFNULL(assigned_to_id,'UNSPECIFIED'), IFNULL(closed_on,'UNSPECIFIED'), IFNULL(closed_by_id,'UNSPECIFIED'), IFNULL(due_on,'UNSPECIFIED'), IFNULL(reported_type_src_code,'UNSPECIFIED'), IFNULL(state_src_code,'UNSPECIFIED'), IFNULL(linked_incident_count,'UNSPECIFIED'), IFNULL(impact_src_code,'UNSPECIFIED'), IFNULL(urgency_src_code,'UNSPECIFIED'), IFNULL(priority_src_code,'UNSPECIFIED'), IFNULL(time_worked,'UNSPECIFIED'), IFNULL(domain_id,'UNSPECIFIED'), IFNULL(company_id,'UNSPECIFIED'), IFNULL(reassignment_count,'UNSPECIFIED'), IFNULL(created_by,'UNSPECIFIED'), IFNULL(changed_by,'UNSPECIFIED'), IFNULL(created_on,'UNSPECIFIED'), IFNULL(changed_on,'UNSPECIFIED'), IFNULL(description,'UNSPECIFIED'), IFNULL(short_description,''))) FROM <<tenant>>_mdwdb.fs_problem_task)
