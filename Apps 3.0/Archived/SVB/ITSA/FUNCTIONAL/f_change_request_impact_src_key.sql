 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 	
svb_mdsdb.change_request_final src
JOIN  svb_mdwdb.f_change_request  trgt
on  trgt.ROW_ID = src.SYS_ID and src.sourceinstance=trgt.source_id
join svb_mdwdb.d_lov lkp
on COALESCE(CONCAT('IMPACT','~','CHANGE_REQUEST','~','~','~',UPPER(src.IMPACT)),'UNSPECIFIED')=lkp.row_id
where  coalesce(lkp.row_key, case when src.IMPACT is null then 0 else -1 end ) <>trgt.impact_src_key
 )c
