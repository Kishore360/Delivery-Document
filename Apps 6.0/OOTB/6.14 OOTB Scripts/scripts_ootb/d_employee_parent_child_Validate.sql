 select case when count(1)<>0 then 'FAILURE' else 'SUCCESS' end as Result
 ,case when count(1)<>0 then 'View is not properly populated' else 'SUCCESS' end as Message
 from ldb.lh_employee lh
 where 
 COALESCE(lh.source_id, 0)||COALESCE(lh.parent_row_id, ' ')|| COALESCE(lh.parent_row_key, 0)
 ||COALESCE(lh.child_row_id, ' ')|| COALESCE(lh.child_row_key, 0)||COALESCE(lh.top_level_flag, ' ')
 not in
 (select COALESCE(source_id, 0)||COALESCE(parent_employee_id, ' ')||COALESCE(parent_employee_key, 0)
 ||COALESCE(child_employee_id, ' ')||COALESCE(child_employee_key, 0)||COALESCE(top_level_flag, ' ')
 from ldb.d_employee_parent_child)