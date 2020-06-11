
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.expense_item_category' ELSE 'SUCCESS' END as Message
FROM (SELECT S.sys_id,S.sourceinstance,S.category 
	FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') S 
	JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC_P ON (SRC_P.sys_id = S.task) 
    UNION
    SELECT S.sys_id,S.sourceinstance,S.category 
	FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') S 
	JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC_PT ON (SRC_PT.sys_id = S.task) 
)SRC
JOIN #DWH_TABLE_SCHEMA.d_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(SRC.category,'')<> COALESCE(TRGT.expense_item_category ,'')

