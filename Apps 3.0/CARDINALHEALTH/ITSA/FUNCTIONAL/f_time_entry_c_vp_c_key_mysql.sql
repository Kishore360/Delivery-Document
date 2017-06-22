






SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.time_card_final SRC 
 JOIN cardinalhealth_mdwdb.d_calendar_date b ON SRC.week_starts_on = b.week_start_date
 LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (concat(SRC.sys_id,'~',b.day_name) =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 

left join cardinalhealth_mdwdb.d_internal_contact c

on c.row_id=coalesce(concat('INTERNAL_CONTACT~',SRC.u_vp),'UNSPECIFIED')

where TRGT.vp_c_key<>coalesce(c.row_key,case when SRC.u_vp is null then 0 else -1 end)) a;