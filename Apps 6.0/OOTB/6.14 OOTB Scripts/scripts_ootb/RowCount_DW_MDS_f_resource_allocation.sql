SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message
FROM (select COUNT(*) Count_MDS, 'resource_allocation_final' Table_MDS from ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_allocation_final WHERE CDCTYPE<>'D') S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y' and cd.calendar_code = 0) MDS,
(SELECT COUNT(*) Count_DWH, 'f_resource_allocation'  Table_DWH 
FROM #DWH_TABLE_SCHEMA.f_resource_allocation
WHERE soft_deleted_flag = 'N') DWH
