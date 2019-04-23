SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_change_request.tier_rating_key' ELSE 'SUCCESS' END as Message
from (select count(1) as cnt from bbandt_mdsdb.cmdb_ci_server_final s
left join bbandt_mdwdb.d_server_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join bbandt_mdwdb.d_lov lkp
ON ( CONCAT('TIER_RATING~SERVER_C','~~~',UPPER(s.u_tier_rating))= lkp.row_id 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.u_tier_rating IS NULL THEN 0 else -1 end) <>t.tier_rating_key
and s.CDCTYPE<>'D' and t.soft_deleted_flag='N')ma