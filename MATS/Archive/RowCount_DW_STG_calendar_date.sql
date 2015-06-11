

SELECT CASE WHEN  (count_stg = count_dwh) OR (count_stg = 0) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_stg = count_dwh) OR (count_stg = 0) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', STG.Table_STG
,' : ' ,STG.Count_STG, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message

FROM (SELECT COUNT(*) Count_STG, '#TABLE_NAME' Table_STG 
FROM #TABLE_NAME) STG,
(SELECT COUNT(*) Count_DWH, '#TABLE_NAME'  Table_DWH 
FROM #TABLE_NAME
 ) DWH
