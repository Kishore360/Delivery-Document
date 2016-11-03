SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt 
FROM 
 (select src.number,src.sys_id,src.sourceinstance ,src.u_features
  from  (select s.number,substring_index( substring_index(u_features,',',x),',','-1') as u_features,
   length(u_features)-length(replace(u_features,',',''))+1 as count ,
   sys_id,sourceinstance
   from tivo_mdsdb.problem_final s
    join (select (t*10+u+1) x from
    (select 0 t union select 1 union select 2 union select 3 union select 4 union
    select 5 union select 6 union select 7 union select 8 union select 9) A,
    (select 0 u union select 1 union select 2 union select 3 union select 4 union
    select 5 union select 6 union select 7 union select 8 union select 9) B
    order by x)  n
     on   length(s.u_features)-length(replace(s.u_features,',',''))+1 > x-1 ) src
  left join tivo_mdsdb.u_cmdb_ci_features_final lkp 
  on src.u_features=lkp.sys_id) srca
left join tivo_mdwdb.f_cmdb_ci_features_c t
on CONCAT(srca.sys_id,'~',srca.u_features)=t.row_id  and srca.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov lkp2
on concat('FEATURES_C~PROBLEM~~~',srca.u_features)= lkp2.row_id and srca.sourceinstance = lkp2.source_id
where lkp2.row_key <> t.problem_features_c_key or srca.number <> problem_number) temp