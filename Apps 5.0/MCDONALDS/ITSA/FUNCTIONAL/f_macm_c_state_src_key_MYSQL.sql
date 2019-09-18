



SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN mcdonalds_mdwdb.d_lov LKP
ON COALESCE(CONCAT('STATE~MACM','~~~',UPPER(SRC.State)),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.State IS NULL THEN 0 ELSE -1 END) <> TRGT.state_src_key
)a;
