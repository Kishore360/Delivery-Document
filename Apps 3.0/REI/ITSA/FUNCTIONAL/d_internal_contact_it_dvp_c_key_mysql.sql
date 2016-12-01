SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_internal_contact finc 
join
rei_mdsdb.sys_user_final inc
ON finc.row_id =  CONCAT('INTERNAL_CONTACT~',inc.sys_id) and finc.source_id=inc.sourceinstance
JOIN rei_mdwdb.d_internal_contact lkp 
ON  COALESCE(CONCAT('INTERNAL_CONTACT~',inc.manager),'UNSPECIFIED')= lkp.row_id
 and finc.source_id=lkp.source_id
 AND finc.changed_on
 BETWEEN lkp.effective_from AND lkp.effective_to
where coalesce(lkp.row_key,case when inc.manager  is null then 0 else -1 end)<> finc.it_dvp_c_key)a

