SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdwdb.d_incident fi
join (select t.incident_key, t.task_attribute_wh_old_value
FROM uclahealth_mdwdb.f_incident_activity t
   JOIN uclahealth_mdwdb.d_internal_organization g_old ON right(trim(g_old.row_id), 32) = t.task_attribute_wh_old_value
WHERE t.task_wh_type = 'incident' AND t.task_attribute_wh_name = 'assignment_group' AND
 g_old.organization_name = 'ISS Customer Care'
 ) temp  on temp.incident_key=fi.row_key
 and fi.reassignment_count>0
where fi.hd_reassignment_count_c<> fi.reassignment_count-1)E; 
