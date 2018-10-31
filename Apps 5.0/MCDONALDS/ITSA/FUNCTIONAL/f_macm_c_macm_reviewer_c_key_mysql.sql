SELECT
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_macm_c.macm_reviewer_c_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
from (select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcdonalds_mdwdb.f_macm_c TRGT ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN mcdonalds_mdwdb.d_internal_contact LKP
ON (COALESCE(CONCAT('INTERNAL_CONTACT~',COALESCE(SRC.u_reviewer)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN COALESCE(SRC.u_reviewer) IS NULL THEN 0 ELSE -1 END)<>TRGT.macm_reviewer_c_key
AND DATE_FORMAT(TRGT.pivot_date, '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to
)a;

