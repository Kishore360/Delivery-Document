
SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT COUNT(1) Count_MDS , '#MDS_TABLE_NAME' Table_MDS FROM <<tenant>>_mdsdb.#MDS_TABLE_NAME) MDS,
(SELECT COUNT(1) Count_DWH, '#DWH_TABLE_NAME'  Table_DWH 
FROM <<tenant>>_mdwdb.#DWH_TABLE_NAME
WHERE row_key not in (0,-1)
AND soft_deleted_flag = 'N') DWH
