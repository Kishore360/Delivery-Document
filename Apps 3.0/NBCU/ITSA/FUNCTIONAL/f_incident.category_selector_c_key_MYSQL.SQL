SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt
from  nbcu_mdsdb.incident_final src
join nbcu_mdwdb.f_incident trgt
on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
join nbcu_mdwdb.d_lov lkp
on COALESCE(CONCAT('CATEGORY_SELECTOR_c~INCIDENT~~~',UPPER(src.u_category_selector)),'UNSPECIFIED')=lkp.row_id
and src.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_category_selector IS NULL THEN 0 else -1 end)<>trgt.category_selector_c_key
and trgt.soft_deleted_flag='N')a