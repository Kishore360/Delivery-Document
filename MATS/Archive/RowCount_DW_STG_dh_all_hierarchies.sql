

SELECT CASE WHEN  (count_stg = count_dwh) OR (count_stg = 0) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_stg = count_dwh) OR (count_stg = 0) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', STG.Table_STG
,' : ' ,STG.Count_STG, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message

FROM (SELECT count( distinct lower_node_id)  Count_STG, '#TABLE_SCHEMA.dhs_all_hierarchies' Table_STG 
FROM #TABLE_SCHEMA.dhs_all_hierarchies) STG,
(SELECT  count( distinct lev_0_id) Count_DWH, '#TABLE_SCHEMA.dh_all_hierarchies'  Table_DWH 
FROM #TABLE_SCHEMA.dh_all_hierarchies
WHERE dw_updated_on = (SELECT MAX(dw_updated_on) 
FROM #TABLE_SCHEMA.dh_all_hierarchies) ) DWH
