SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_allocation_c.month_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_allocation_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_allocation_etc_v_final src
on trgt.row_id = CONCAT(src.team_user_id,'~',src.invest_id,'~',src.type,'~',src.year,'~',src.month)
where trgt.month_c <>src.month;