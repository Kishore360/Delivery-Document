SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message  from 
(
select count(1)  cnt
from humana_mdsdb.change_request_final SRC
LEFT join humana_mdwdb.f_change_request TRG on TRG.row_id=SRC.sys_id and TRG.source_id=SRC.sourceinstance
JOIN humana_mdwdb.d_internal_contact LKP ON CONCAT('INTERNAL_CONTACT~',COALESCE(SRC.requested_by,'UNSPECIFIED'))=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.requested_by IS NULL THEN 0 ELSE -1 END)<>TRG.requested_by_key
)A


 