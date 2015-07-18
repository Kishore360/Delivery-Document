
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from FS_INCIDENT to F_INCIDENT did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_workdb.stg_fs_incident WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(incident_number,''), IFNULL(reported_type_src_code,''), IFNULL(category_src_code,''), IFNULL(sub_category_src_code,''), IFNULL(state_src_code,''), IFNULL(impact_src_code,''), IFNULL(urgency_src_code,''), IFNULL(severity_src_code,''), IFNULL(priority_src_code,''), IFNULL(open_to_close_duration,''), IFNULL(open_to_resolve_duration,''), IFNULL(resolve_to_close_duration,''), IFNULL(reassignment_count,''), IFNULL(reopened_count,''), IFNULL(time_worked,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(incident_number,''), IFNULL(reported_type_src_code,''), IFNULL(category_src_code,''), IFNULL(sub_category_src_code,''), IFNULL(state_src_code,''), IFNULL(impact_src_code,''), IFNULL(urgency_src_code,''), IFNULL(severity_src_code,''), IFNULL(priority_src_code,''), IFNULL(open_to_close_duration,''), IFNULL(open_to_resolve_duration,''), IFNULL(resolve_to_close_duration,''), IFNULL(reassignment_count,''), IFNULL(reopened_count,''), IFNULL(time_worked,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.dwh_f_incident)
