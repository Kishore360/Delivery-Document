



SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds =count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'MDS-DWH RowCount did not Match for ', DWH.Table_DWH , '. MDS:',count_mds,'DWH : ' ,DWH.Count_DWH)
END AS Message
FROM (SELECT (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.inventoryitem_itemvendorlist_itemvendor_final WHERE inventoryitem_internalID IS NOT NULL AND vendor_internalid IS NOT NULL) + (SELECT COUNT(*) FROM #MDS_TABLE_SCHEMA.pc_vendor_cat_item_final) AS count_mds) MDS,
(SELECT COUNT(*) Count_DWH, 'd_supplier_item'  Table_DWH 
FROM #TABLE_SCHEMA.d_supplier_item WHERE row_key NOT IN (0,-1)) DWH



