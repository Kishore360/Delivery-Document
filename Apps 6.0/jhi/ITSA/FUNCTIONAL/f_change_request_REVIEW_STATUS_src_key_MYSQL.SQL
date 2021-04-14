select 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.REVIEW_STATUS_src_key' ELSE 'SUCCESS' END as Message  
FROM(
select count(1) as cnt 
from
jhi_mdwdb.f_change_request TGT
JOIN jhi_mdsdb.change_request_final SRC
on TGT.row_id = SRC.sys_id AND TGT.source_id = SRC.sourceinstance
JOIN jhi_mdwdb.d_lov lkp ON COALESCE(CONCAT('REVIEW_STATUS','~','CHANGE_REQUEST','~',UPPER(SRC.review_status)),'UNSPECIFIED') = lkp.row_id
 and SRC.sourceinstance = lkp.source_id
where   COALESCE(lkp.row_key,case when SRC.review_status is null then 0 else -1 end )<>TGT.REVIEW_STATUS_src_key
AND SRC.cdctype='X';
) temp;


