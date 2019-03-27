select  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for f_problem_impacted_parties_c.impacted_parties_c_key' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt from paloalto_mdsdb.problem_final SRC
left join (select   substring_index(substring_index(u_impacted_parties, ',', n), ',', -1) as impacted_parties_id , sys_id
from paloalto_mdsdb.problem_final
join (SELECT a.N + b.N * 10 +1 + c.N * 100 + d.N *1000 + e.N *10000  AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b ,
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c ,
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) d ,
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) e
	  ORDER BY n) z
  on char_length(u_impacted_parties) 
    - char_length(replace(u_impacted_parties, ',', '')) 
    >= n - 1) SRC1 on SRC.sys_id = SRC1.sys_id
left join paloalto_mdwdb.f_problem_impacted_parties_c TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join paloalto_mdwdb.d_impacted_parties_c LKP on COALESCE(impacted_parties_id ,'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key, case when impacted_parties_id is null then 0 else -1 end) <> TRGT.impacted_parties_c_key
)temp1;

