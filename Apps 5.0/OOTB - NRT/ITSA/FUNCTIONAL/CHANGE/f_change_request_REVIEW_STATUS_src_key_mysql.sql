SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt 
from
<<tenant>>_mdwdb.f_change_request TGT
JOIN (select * from <<tenant>>_mdsdb.change_request_final) SRC
on TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
JOIN <<tenant>>_mdwdb.d_lov lkp
ON COALESCE(CONCAT('REVIEW_STATUS','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.review_status)),'UNSPECIFIED') = lkp.row_id
 and SRC.sourceinstance = lkp.source_id
 left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and  TGT.soft_deleted_flag='N' and COALESCE(lkp.row_key,case when SRC.review_status is null then 0 else -1 end )<>TGT.REVIEW_STATUS_src_key)c

