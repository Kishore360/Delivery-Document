SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(1) as cnt
from   nbcu_mdsdb.incident_final src
join nbcu_mdwdb.f_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join nbcu_mdwdb.d_lov lkp
on COALESCE(CONCAT('REASON_FOR_L1_RESOLVEABLE_C~INCIDENT~~~',UPPER(src.u_reason_for_l1_resolveable)),'UNSPECIFIED')=lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.u_reason_for_l1_resolveable IS NULL THEN 0 else -1 end) <>trgt.reason_for_l1_resolveable_c_reason_for_l1_resolveable_key
and trgt.soft_deleted_flag='N')ma
