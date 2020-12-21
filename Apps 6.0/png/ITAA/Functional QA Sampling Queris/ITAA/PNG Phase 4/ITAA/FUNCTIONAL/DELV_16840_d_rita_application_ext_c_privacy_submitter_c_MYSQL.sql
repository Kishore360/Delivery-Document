SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_irisk_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM (


SELECT ra.name,ra.sourceinstance, 	irc.Submitter 				as privacy_submitter

FROM 		png_mdsdb.pg_mega_pgb_application_rita_final as ra
LEFT JOIN 	png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final as irc
ON 			ra.name = irc.MEGA_HEX_ID 
AND 		ra.sourceinstance = irc.sourceinstance 
AND 		irc.cdctype ='X'
WHERE 		ra.cdctype = 'X'

group by 1,2

) SRC 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
where
COALESCE(SRC.privacy_submitter,'UNSPECIFIED')<>TRGT.privacy_Submitter_c
) temp;