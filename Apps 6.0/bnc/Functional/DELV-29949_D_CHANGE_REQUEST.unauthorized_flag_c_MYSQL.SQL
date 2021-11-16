SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for D_CHANGE_REQUEST.unauthorized_flag_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select  
Count(1) as CNT 
FROM "BNC_P_DB"."MDSDB"."HLX_CHG_INFRASTRUCTURE_CHANGE_FINAL" a 
LEFT JOIN "BNC_P_DB"."DW"."D_CHANGE_REQUEST" b ON a.Infrastructure_Change_ID=b.row_id AND a.sourceinstance=b.source_id
Where 
CASE  WHEN  upper(a.Description) like '%UNAUTHORIZED%' then 'Y' ELSE 'N' END <> b.unauthorized_flag_c
AND a.cdctype<>'D'
) temp;

