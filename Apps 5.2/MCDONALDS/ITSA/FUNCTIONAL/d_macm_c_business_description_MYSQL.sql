SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_business_description' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
(select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where (SRC.cdctime<=f1.lastupdated) and COALESCE (LEFT(SRC.u_business_description,4000),'UNSPECIFIED')<>TRGT.business_description
)a;



