
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_production_and_validation_c.validation_flag' ELSE 'SUCCESS' END as Message  
FROM 
(
select  count(1) as cnt FROM
 wpl_mdsdb.us_PVFN_Sheet1_final SRC 
left join wpl_mdwdb.f_production_and_validation_c TRGT
on sha2(concat(coalesce(SRC.Validated,'unspecified'),'~',coalesce(SRC.Number,'unspecified')),256)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id		
where  CASE  WHEN SRC.validated='Validated'  THEN 'Y' ELSE 'N' END<>TRGT.validation_flag
and SRC.cdctype<>'D' 
) temp; 



	