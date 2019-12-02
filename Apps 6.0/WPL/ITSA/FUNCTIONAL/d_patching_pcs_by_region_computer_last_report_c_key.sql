
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_patching_pcs_by_region.computer_last_report_c_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_ppbr_consolidated_final  src
left join wpl_mdwdb.d_patching_pcs_by_region trgt on concat(COALESCE(src.computername,'UNSPECIFIED'),'~',REPLACE(COALESCE(src.computerlastreport,'UNSPECIFIED'),'-','') )=trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and CAST(REPLACE(REPLACE(src.computerlastreport,' 00:00:00',''),'-','') AS DECIMAL(0)) <> trgt.computer_last_report_c_key
) temp; 



	