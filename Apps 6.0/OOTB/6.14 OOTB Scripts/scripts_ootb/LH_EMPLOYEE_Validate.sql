 select case when count(1)<>0 then 'FAILURE' else 'SUCCESS' end as Result
 ,case when count(1)<>0 then 'View not populated as per requirement' else 'SUCCESS' end as Message
 from #DWH_TABLE_SCHEMA.d_dh_hierarchy_security dh
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact d 
   ON concat('INTERNAL_CONTACT~', dh.upper_node_id) = d.row_id 
   AND dh.source_id = d.source_id 
   AND d.current_flag = 'Y'
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ch 
   ON concat('INTERNAL_CONTACT~', dh.lower_node_id) = ch.row_id 
   AND dh.source_id = ch.source_id 
   AND d.current_flag = 'Y'
   LEFT JOIN ldb.lh_employee_temp t 
   ON dh.source_id = t.source_id
  WHERE dh.hierarchy_class = 'EMPLOYEE' 
  AND NOT (dh.level = -1 AND dh.top_level = 0)
 and (COALESCE(dh.source_id, 0)||COALESCE(dh.upper_node_id, ' ')||COALESCE(d.row_key, 0)||
 COALESCE(dh.lower_node_id, ' ')||COALESCE(ch.row_key, 0)||
  (CASE WHEN dh.level = t.max_level THEN 'Y' ELSE 'N' END))
 not in
 (select COALESCE(source_id, 0)||COALESCE(parent_row_id, ' ')||COALESCE(parent_row_key, 0)
 ||COALESCE(child_row_id, ' ')||COALESCE(child_row_key, 0)||COALESCE(top_level_flag, ' ')
 from ldb.lh_employee)