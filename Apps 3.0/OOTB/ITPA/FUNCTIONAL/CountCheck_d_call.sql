SELECT CASE WHEN  (Count_VIEW = Count_DWH) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (Count_VIEW = Count_DWH) THEN 'Data Matched'
ELSE  'RowCount did not Match.' || DWH.Table_DWH
||' : ' ||DWH.Count_DWH|| ' , ' ||VI.Viewname || ' : ' ||VI.Count_VIEW
END AS Message
FROM (SELECT COUNT(1) Count_DWH , '#DWH_TABLE_NAME' Table_DWH FROM <<tenant>>_mdwdb.#DWH_TABLE_NAME) DWH,
(SELECT COUNT(1) Count_VIEW, '#VIEWNAME'  Viewname FROM #VIEWNAME) VI 
