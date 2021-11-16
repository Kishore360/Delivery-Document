SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for D_CHANGE_REQUEST.failure_flag' ELSE 'SUCCESS' END as Message
FROM 
(
Select  
Count(1) as CNT 
FROM "BNC_P_DB"."MDSDB"."HLX_CHG_INFRASTRUCTURE_CHANGE_FINAL" a 
LEFT JOIN "BNC_P_DB"."DW"."D_CHANGE_REQUEST" b ON a.Infrastructure_Change_ID=b.row_id AND a.sourceinstance=b.source_id
Where 
CASE 
WHEN a.CHANGE_REQUEST_STATUS='Closed' AND  COALESCE(a.STATUS_REASON,'UNSPECIFIED') IN ('Unsuccessful','Successful with Issues','Backed Out') THEN 'Y' 
WHEN a.CHANGE_REQUEST_STATUS='Closed' AND  COALESCE(a.STATUS_REASON,'UNSPECIFIED') NOT IN ('Unsuccessful','Successful with Issues','Backed Out') THEN 'N'
ELSE 'X' END <> b.failure_flag
AND a.cdctype<>'D'
) temp;


 