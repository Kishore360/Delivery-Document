


SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM <<tenant>>_mdsdb.inventoryitem_itemvendor_final) + (SELECT COUNT(1) FROM <<tenant>>_mdsdb.inventoryitem_locations_final) AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_storage_item'  Table_DWH 
FROM <<tenant>>_mdwdb.d_storage_item WHERE row_key not in (0,-1)) DWH
