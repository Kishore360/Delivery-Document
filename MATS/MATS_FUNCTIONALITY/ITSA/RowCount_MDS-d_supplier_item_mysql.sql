



SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(1) FROM <<tenant>>_mdsdb.inventoryitem_itemvendorlist_itemvendor_final WHERE inventoryitem_internalID IS NOT NULL AND vendor_internalid IS NOT NULL) + (SELECT COUNT(1) FROM <<tenant>>_mdsdb.pc_vendor_cat_item_final) AS count_mds) MDS,
(SELECT COUNT(1) Count_DWH, 'd_supplier_item'  Table_DWH 
FROM <<tenant>>_mdwdb.d_supplier_item WHERE row_key NOT IN (0,-1)) DWH



