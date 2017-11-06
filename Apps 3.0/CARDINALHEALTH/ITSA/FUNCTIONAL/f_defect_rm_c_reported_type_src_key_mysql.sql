 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_defect_final a
JOIN  cardinalhealth_mdwdb.f_defect_rm_c b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_lov lkp
on COALESCE( CONCAT('CONTACT_TYPE','~','TASK','~','~','~',upper(a.contact_type)),'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when a.contact_type is null then 0 else -1 end)<> b.reported_type_src_key)c

