select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then 'Duplicates exists in Dimensions' else 'SUCCESS' end as Message
from (
select count(*) from
homedepot_mdwdb.d_change_request a
JOIN
  (SELECT CASE
              WHEN COALESCE(si.u_parent_change,'UNSPECIFIED') = 'UNSPECIFIED' THEN 0
              ELSE coalesce(di.row_key,-1)
          END AS row_key,
          si.sys_id AS row_id,
          si.sourceinstance AS source_id
   FROM homedepot_mdsdb.change_request_final si
   LEFT JOIN homedepot_mdwdb.d_change_request di ON di.row_id = COALESCE(si.u_parent_change,'UNSPECIFIED')
   AND di.source_id = CASE
                          WHEN COALESCE(si.u_parent_change,'UNSPECIFIED')= 'UNSPECIFIED' THEN 0
                          ELSE si.sourceinstance
                      END) b ON a.row_id = b.row_id
AND a.source_id = b.source_id
where b.row_key<> a.parent_change_request_key)a