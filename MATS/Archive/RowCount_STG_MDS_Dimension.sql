
SELECT CASE WHEN  (count_mds = count_stg) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_stg) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,STG.Table_STG , ' : ' ,STG.Count_STG)
END AS Message
FROM (SELECT COUNT(*) Count_MDS , '#MDS_TABLE_NAME' Table_MDS FROM #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME) MDS,
(SELECT COUNT(*) Count_STG, '#STG_TABLE_NAME'  Table_STG 
FROM #STG_TABLE_SCHEMA.#STG_TABLE_NAME) STG
