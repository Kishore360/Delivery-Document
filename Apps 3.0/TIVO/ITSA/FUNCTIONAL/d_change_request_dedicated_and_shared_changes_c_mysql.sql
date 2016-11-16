
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(
SELECT count(1) as cnt from tivo_mdwdb.d_change_request a 
left join 
(
select src.name,srca.company,srca.count,srca.sys_id,srca.u_notified ,srca.sourceinstance from  (
select substring_index( substring_index(u_companies,',',x),',','-1') as company,
length(u_companies)-length(replace(u_companies,',',''))+1 as count ,u_companies,sys_id,sourceinstance,u_notified
from tivo_mdsdb.change_request_final a 
join (select (t*10+u+1) x from
(select 0 t union select 1 union select 2 union select 3 union select 4 union
select 5 union select 6 union select 7 union select 8 union select 9) A,
(select 0 u union select 1 union select 2 union select 3 union select 4 union
select 5 union select 6 union select 7 union select 8 union select 9) B
order by x)  n
	 on   length(u_companies)-length(replace(u_companies,',',''))+1 > x-1 ) srca
left join tivo_mdsdb.core_company_final src   
on srca.company=src.sys_id ) src on   a.row_id=src.sys_id and a.source_id=src.sourceinstance
WHERE dedicated_and_shared_changes_c <> 
case 
when  src.u_notified=1 and src.count=1 and  src.name in ('Virgin Media', 'ComHem' ,'Vodafone TV /Ono') THEN 'Dedicated'
when src.u_notified=1 and src.count=1 and  src.name in ('TiVo') THEN 'Corporate'
WHEN src.u_notified=1 and src.count>=1 and  src.name not in ('TiVo','Virgin Media', 'ComHem' ,'Vodafone TV /Ono') THEN 'Shared'
WHEN src.u_notified=1 and src.count>=1    THEN 'Shared'
else 'UNSPECIFIED' END 
)a