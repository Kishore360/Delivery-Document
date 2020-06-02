
SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT COUNT(*) Count_MDS , '#MDS_TABLE_NAME' Table_MDS FROM #MDS_TABLE_NAME where asset is not null and cdctype<>'D') MDS,
(SELECT COUNT(*) Count_DWH, '#DWH_TABLE_NAME'  Table_DWH 
FROM #DWH_TABLE_NAME
where soft_deleted_flag<>'Y'
and  asset_key <>0
) DWH