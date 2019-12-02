SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_assignment_group_day_c.caused_by_change_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_CPDFN_sheet1_final  src
left join wpl_mdwdb.f_change_assignment_group_day_c TRGT on  
concat(coalesce(src.changenumber,'unspecified'),'~',coalesce(src.rflag,'unspecified'),'~',coalesce(src.director,'unspecified'),'~',coalesce(src.cabdate,'unspecified')) =TRGT.row_id 
and src.sourceinstance=TRGT.source_id
 left join wpl_mdwdb.d_change_request LKP
 on src.changenumber=LKP.change_request_number
 and src.sourceinstance=LKP.source_id
 left join wpl_mdsdb.incident_final I
on I.caused_by=LKP.row_id
and I.sourceinstance = LKP.source_id
 WHERE COALESCE(LKP.row_key,CASE WHEN I.caused_by IS NULL THEN 0 else -1 end)<> (TRGT.caused_by_change_key) 
 and src.CDCTYPE='X')m;