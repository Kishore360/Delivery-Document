SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt 
from jnj_mdwdb.d_internal_organization a 
join jnj_mdsdb.core_company_final b 
ON a.row_id = CONCAT ('SUBSIDIARY~',b.sys_id) AND a.source_id = b.sourceinstance
join  jnj_mdwdb.d_lov lkp on 
COALESCE(CONCAT ('SECTOR_C','~','CORE_COMPANY','~','~','~',UPPER(b.u_sector)), 'UNSPECIFIED') =lkp.row_id and lkp.source_id = a.source_id
where COALESCE(lkp.row_key,case when b.u_sector is null then 0 else -1 end) <>  a.group_sector_c_key)c
