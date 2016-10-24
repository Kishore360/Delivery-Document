SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.f_change_request TGT
JOIN rei_mdsdb.change_request_final SRC
on TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
JOIN rei_mdwdb.d_lov lkp
ON COALESCE(CONCAT('TYPE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.u_change_type)),'UNSPECIFIED') = lkp.row_id
 and SRC.sourceinstance = lkp.source_id
where  COALESCE(lkp.row_key,case when SRC.u_change_type is null then 0 else -1 end ) <>TGT.type_src_key)c