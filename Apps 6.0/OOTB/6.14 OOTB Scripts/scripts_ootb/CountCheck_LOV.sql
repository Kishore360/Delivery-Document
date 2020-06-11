SELECT CASE WHEN  (Count_VIEW = Count_DWH) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (Count_VIEW = Count_DWH) THEN 'Data Matched'
ELSE 'RowCount did not Match.' || DWH.Table_DWH
||' : ' ||DWH.Count_DWH|| ' , ' ||VI.Viewname || ' : ' ||VI.Count_VIEW
END AS Message
FROM (SELECT COUNT(*) Count_DWH , '#DWH_TABLE_NAME' Table_DWH FROM #DWH_TABLE_SCHEMA.#DWH_TABLE_NAME 
where dimension_class='#Type') DWH,
(SELECT COUNT(*)-2 Count_VIEW, '#VIEWNAME'  Viewname FROM #VIEWNAME) VI