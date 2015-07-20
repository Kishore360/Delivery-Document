

SELECT CASE WHEN  count_stg <> count_dwh THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN Count_STG <> Count_DWH THEN 'RowCount did not Match. '|| STG.Table_STG||' : ' ||STG.Count_STG || ' , ' ||DWH.Table_DWH || ' : ' || DWH.Count_DWH ELSE 'Data Matched' END AS Message
FROM (SELECT COUNT(*) Count_STG, '#STG_TABLE_NAME' Table_STG FROM #STG_TABLE_NAME) STG,
(SELECT COUNT(*) Count_DWH, '#DWH_TABLE_NAME'  Table_DWH FROM #DWH_TABLE_NAME ) DWH
