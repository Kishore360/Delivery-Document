SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.skill_key' ELSE 'SUCCESS' END as Message
 from #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT
 left join #DWH_TABLE_SCHEMA.d_internal_contact lkp1
 on TRGT.employee_key = lkp1.row_key
  left join #DWH_TABLE_SCHEMA.d_acd d
 on d.row_key = TRGT.acd_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact lkp2
 on (lkp2.source_id = 2 AND lkp1.row_id =concat('INTERNAL_CONTACT~',d.acd_code,'~', lkp2.mdm_id))
 where concat(lkp2.cost_center_key,'~',lkp2.department_key,'~',lkp2.location_key) 
 <> concat(TRGT.cost_center_key,'~',TRGT.department_key,'~',TRGT.location_key) 
 
 
