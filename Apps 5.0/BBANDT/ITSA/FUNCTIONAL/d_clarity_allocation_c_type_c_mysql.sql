SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_clarity_allocation_c.type_c' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from (select * from  bbandt_mdsdb.bbt_allocation_etc_v_final where CDCTYPE<>'D') src
left JOIN bbandt_mdwdb.d_clarity_allocation_c trgt
on trgt.row_id = CONCAT(src.team_user_id,'~',src.invest_id,'~',src.type,'~',src.year,'~',src.month)
where trgt.type_c <>src.type) temp;