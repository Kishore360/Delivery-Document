SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_moc_c.source_field_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM terex_mdsdb.pv_ext_moc_mapping_final SRC
LEFT JOIN terex_mdwdb.d_moc_c TRGT ON CONCAT(SRC.source_system,'~',SRC.value)=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.source_field,'UNSPECIFIED')<>TRGT.source_field_c
AND SRC.cdctype='X'
) temp; 


