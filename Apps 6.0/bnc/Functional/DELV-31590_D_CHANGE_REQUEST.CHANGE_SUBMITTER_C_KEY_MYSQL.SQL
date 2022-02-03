

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for D_CHANGE_REQUEST.CHANGE_SUBMITTER_C_KEY' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM "BNC_CCS_PD_DB"."MDSDB".hlx_chg_infrastructure_change_final SRC                  
LEFT OUTER JOIN
(SELECT   source_id, remedy_login_id, submitter, row_id, person_id
FROM (
SELECT
X.sourceinstance AS source_id,ctm_people.Remedy_Login_ID AS remedy_login_id,X.Submitter AS submitter,X.Infrastructure_Change_ID AS row_id,ctm_people.Person_ID AS person_id        
FROM "BNC_CCS_PD_DB"."MDSDB".hlx_chg_infrastructure_change_final X     
INNER JOIN "BNC_CCS_PD_DB"."MDSDB".hlx_ctm_people_final ctm_people ON (X.Submitter=ctm_people.Remedy_Login_ID AND X.sourceinstance=ctm_people.sourceinstance AND ctm_people.profile_status NOT IN ('Delete') )
) a 
)SRC1 
ON (SRC.Infrastructure_Change_ID=SRC1.row_id AND SRC.sourceinstance=SRC1.source_id)
LEFT JOIN "BNC_CCS_PD_DB"."MDW"."D_CHANGE_REQUEST" TRGT ON SRC.Infrastructure_Change_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN "BNC_CCS_PD_DB"."MDW"."D_INTERNAL_CONTACT" LKP ON 
(COALESCE(CONCAT('INTERNAL_CONTACT~',SRC1.person_id),COALESCE(SRC1.submitter,'UNSPECIFIED'),CONCAT('INTERNAL_CONTACT~',SRC1.submitter),'UNSPECIFIED') =LKP.row_id)
WHERE 
COALESCE(LKP.row_key,CASE WHEN SRC.submitter IS NULL THEN 0 ELSE -1 END) <> TRGT.CHANGE_SUBMITTER_C_KEY AND SRC.cdctype<>'D'
) temp;




