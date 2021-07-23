

SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message  from 
(
select count(1)  cnt
from humana_mdsdb.change_request_final SRC
LEFT join humana_mdwdb.d_change_request TRG on TRG.row_id=SRC.sys_id and TRG.source_id=SRC.sourceinstance
WHERE COALESCE(SRC.close_notes,'UNSPECIFIED')<>TRG.close_notes
AND SRC.cdctype='X'
)A


 
