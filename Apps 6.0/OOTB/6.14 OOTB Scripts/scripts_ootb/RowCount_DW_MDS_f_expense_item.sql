
SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM
(SELECT 
(SELECT COUNT(*) Count_MDS 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC1 
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_final WHERE CDCTYPE<>'D') SRC_P ON SRC_P.sys_id = SRC1.task
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.task is not null AND SRC1.asset is null)
+
(SELECT COUNT(*) Count_MDS 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC1 
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC_PT ON SRC_PT.sys_id = SRC1.task
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.task is not null AND SRC1.asset is null) 
+
(
SELECT COUNT(*) Count_MDS 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') SRC1 
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC2 ON SRC2.sys_id = SRC1.asset
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D') FI on FI.id=SRC1.sys_id and FI.field='amount'
WHERE SRC1.asset is not null
)
Count_MDS
, 'fm_expense_line_final' Table_MDS
) MDS,
(SELECT COUNT(*) Count_DWH, 'f_expense_item'  Table_DWH 
FROM #DWH_TABLE_SCHEMA.f_expense_item
WHERE soft_deleted_flag = 'N') DWH