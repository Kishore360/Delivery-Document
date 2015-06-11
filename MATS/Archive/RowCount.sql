



SELECT CASE WHEN  count_stg <> count_dwh THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN Count_STG <> Count_DWH THEN 'RowCount did not Match. '|| STG.Table_STG||' : ' ||STG.Count_STG || ' , ' ||DWH.Table_DWH || ' : ' || DWH.Count_DWH ELSE 'Data Matched' END AS Message
FROM (SELECT COUNT(*) Count_STG, '#TABLE_NAME' Table_STG FROM #TABLE_NAME) STG,
(SELECT COUNT(*) Count_DWH, '#TABLE_NAME'  Table_DWH FROM #TABLE_NAME ) DWH
