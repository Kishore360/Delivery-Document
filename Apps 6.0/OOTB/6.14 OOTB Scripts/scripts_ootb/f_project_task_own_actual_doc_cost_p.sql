SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.own_actual_doc_cost' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN  (
  SELECT project_key, SUM(expense_doc_amount) AS expense_doc_amount, SUM(expense_loc_amount) AS expense_loc_amount 
  FROM #DWH_TABLE_SCHEMA.f_expense_item 
  WHERE base_expense_item_key = 0 GROUP BY project_key
 ) FEI 
 ON (FEI.project_key=TRGT.project_key ) 
  left join #DWH_TABLE_SCHEMA.d_project DIM
 on TRGT.project_key = DIM.row_key 
 WHERE CAST(CASE WHEN DIM.is_leaf_flag='Y' AND FEI.project_key IS NULL THEN COALESCE(TRGT.total_actual_doc_cost,0) 
								WHEN DIM.is_leaf_flag='Y' AND FEI.project_key IS NOT NULL THEN COALESCE(FEI.expense_doc_amount,0)
								WHEN DIM.is_leaf_flag='N' THEN COALESCE(FEI.expense_doc_amount,0) 
								ELSE NULL END as decimal(20,10)) <> COALESCE(TRGT.own_actual_doc_cost ,'')