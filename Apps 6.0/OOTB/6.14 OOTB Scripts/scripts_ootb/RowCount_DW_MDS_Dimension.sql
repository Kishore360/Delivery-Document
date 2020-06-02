
SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT sourceinstance,COUNT(*) Count_MDS , '#MDS_TABLE_NAME' Table_MDS  FROM #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME WHERE CDCTYPE<>'D') MDS,
(SELECT source_id, COUNT(*) Count_DWH, '#DWH_TABLE_NAME'  Table_DWH 
FROM #DWH_TABLE_SCHEMA.#DWH_TABLE_NAME
WHERE row_key not in (0,-1) AND soft_deleted_flag = 'N' group by source_id) DWH
where MDS.sourceinstance = DWH.source_id
