

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_manually_group_c' ELSE 'SUCCESS' END as Message  from (
SELECT distinct CONCAT(prb.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_manually_added_groups), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
   
   prb.sys_id AS chn_manually_add_grp_c_id,
  
	concat('GROUP~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(prb.u_manually_added_groups), ',', n.n), ',', -1),'UNSPECIFIED')) AS chn_manually_add_grp_user_c_id
FROM fidelity_mds_viewdb.change_request_delta AS prb
JOIN
(SELECT a.N + b.N * 10 + 1 AS n
FROM
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(prb.u_manually_added_groups),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(prb.u_manually_added_groups),'UNSPECIFIED'), ',', '')))) a
left join fidelity_mdwdb.f_change_manually_group_c f on f.row_id=a.row_id
left join fidelity_mdwdb.d_change_request c on c.row_key=f.chn_manually_add_grp_c_key
left join fidelity_mdwdb.d_internal_organization u on u.row_key = f.chn_manually_add_grp_user_c_key
where a.chn_manually_add_grp_user_c_id <> u.row_id and a.chn_manually_add_grp_c_id <> c.row_id



