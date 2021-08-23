SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_association_c.association_type01_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
From etrade_mdsdb.hlx_chg_associations_final SRC 
LEFT JOIN etrade_mdwdb.d_change_association_c TRGT ON SRC.Associations_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Association_Type01,'UNSPECIFIED')<>TRGT.association_type01_c
AND SRC.cdctype='X'
) temp; 


 