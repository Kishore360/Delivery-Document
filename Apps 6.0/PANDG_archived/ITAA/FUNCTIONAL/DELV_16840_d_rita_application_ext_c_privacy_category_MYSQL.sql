
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_category' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT
Count(1) as CNT 
FROM 
(

SELECT ra.name,ra.sourceinstance
, 	CASE WHEN sum(case when irc.MEGA_HEX_ID= ra.name then 1 else 0 END) > 0 THEN  'Y' ELSE 'N' END 			as Privacy_Exists_in_iRisk_flag
,	CASE WHEN sum(case when ra.name = ir.Mega_HEX_ID AND  
							DATE_FORMAT(ir.Created_Date,'%Y-%m-%d') >= DATE_FORMAT('2015-07-01','%Y-%m-%d')  THEN 1 ELSE 0 END) > 0 
					THEN  'Y' ELSE 'N' END 																	as  privacy_Exists_in_iRisk_Legacy_flag
,	CASE WHEN sum(case when nonir.HexaIdAbs= ra.name THEN 1 ELSE 0 END) > 0 THEN  'Y' ELSE 'N' END 			as privacy_Exists_in_Legacy_flag 
,	CASE WHEN sum(case when irc.MEGA_HEX_ID= ra.name then 1 else 0 END) > 0 THEN 
			  CASE WHEN sum(case when irc.MEGA_HEX_ID= ra.name AND irc.Assessment_Status NOT IN ('Complete','Cancelled')  then 1 else 0 END) = 0 
			  THEN 'Complete' ELSE 'Incomplete' END 
			  ELSE  'N/A' END  																				as privacy_irisk_status 

FROM 		png_mdsdb.pg_mega_pgb_application_rita_final as ra
LEFT JOIN 	png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final as irc
ON 			ra.name = irc.MEGA_HEX_ID 
AND 		ra.sourceinstance = irc.sourceinstance 
AND 		irc.cdctype ='X'
LEFT JOIN 	png_mdsdb.pg_mega_privacy_legacy_irisk_c_final as ir
ON 			ra.name = ir.Mega_HEX_ID 
AND 		ra.sourceinstance = ir.sourceinstance 
AND 		ir.cdctype ='X'
LEFT JOIN 	png_mdsdb.pg_mega_privacy_legacy_non_irisk_final as nonir 
ON 			ra.name = nonir.HexaIdAbs  
AND 		ra.sourceinstance = nonir.sourceinstance 
AND 		nonir.cdctype ='X'
WHERE 		ra.cdctype = 'X'
GROUP BY 1,2


) SRC 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 

CASE WHEN Privacy_Exists_in_iRisk_flag ='Y'  AND privacy_irisk_status = 'Complete' THEN 2 
	 WHEN  privacy_Exists_in_Legacy_flag = 'Y' THEN 1 
	 WHEN  privacy_Exists_in_iRisk_Legacy_flag = 'Y' THEN 5
	 WHEN Privacy_Exists_in_iRisk_flag ='Y'  AND  privacy_irisk_status <> 'Complete' THEN 3 
	 ELSE 4 END 

<>TRGT.privacy_category
) temp;


