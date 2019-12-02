SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_production_and_validation_c.change_number' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_PVFN_Sheet1_final  src
left join wpl_mdwdb.f_production_and_validation_c trgt on  concat(coalesce(src.validated,'unspecified'),'~',coalesce(src.number,'unspecified'))=trgt.row_id and src.sourceinstance=trgt.source_id
where  src.cdctype<>'D' and  src.number  <>trgt.change_number
) temp; 
