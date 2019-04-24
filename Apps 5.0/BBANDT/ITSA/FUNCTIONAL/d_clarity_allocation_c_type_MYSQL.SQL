 SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_clarity_allocation_c.month_c' ELSE 'SUCCESS' END as Message 
FROM (select count(*) cnt
 from bbandt_mdsdb.bbt_allocation_etc_v_final src
left join(select SUBSTRING_INDEX(SUBSTRING_INDEX(trgt.row_id, '~', 1), '~', -1)team_user_id ,
SUBSTRING_INDEX(SUBSTRING_INDEX(trgt.row_id, '~', 2), '~', -1)invest_id,
SUBSTRING_INDEX(SUBSTRING_INDEX(trgt.row_id, '~', 3), '~', -1)type,
SUBSTRING_INDEX(SUBSTRING_INDEX(trgt.row_id, '~', 4), '~', -1)year,
SUBSTRING_INDEX(SUBSTRING_INDEX(trgt.row_id, '~', 5), '~', -1)month,
month_c,
year_c,
invest_id_c,
team_user_id_c,
soft_deleted_flag from bbandt_mdwdb.d_clarity_allocation_c trgt) trgt
on src.team_user_id=trgt.team_user_id
and src.invest_id=trgt.invest_id
and src.type=trgt.type
and src.year=trgt.year
and src.month=trgt.month
where src.type<>trgt.type and trgt.soft_deleted_flag='N' and src.CDCTYPE<>'D')a;
