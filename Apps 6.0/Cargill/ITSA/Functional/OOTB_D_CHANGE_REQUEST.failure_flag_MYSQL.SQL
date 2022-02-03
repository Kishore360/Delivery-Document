SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for D_CHANGE_REQUEST.failure_flag' ELSE 'SUCCESS' END as Message
FROM 
(
Select 
Count(1) as CNT
FROM "CARGILL_P_DB"."MDS_VIEWDB"."HLX_CHG_INFRASTRUCTURE_CHANGE_DELTA" SRC
JOIN "CARGILL_P_DB"."DW"."D_CHANGE_REQUEST" TRGT ON (SRC.Infrastructure_Change_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN  "CARGILL_P_DB"."MDW"."D_LOV_MAP"  LKP 
ON (LKP.dimension_class = 'REVIEW_STATUS~CHANGE_REQUEST' AND LKP.dimension_code= cast(UPPER(SRC.Status_Reason) as varchar)
AND SRC.sourceinstance=LKP.source_id)
Where CASE WHEN COALESCE(LKP.dimension_wh_code,'UNKNOWN')= 'FAIL' THEN 'Y' ELSE 'N' END<> TRGT.FAILURE_FLAG
) temp;


 