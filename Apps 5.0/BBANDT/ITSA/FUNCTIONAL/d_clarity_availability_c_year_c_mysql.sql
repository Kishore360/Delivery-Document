SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_availability_c.year_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_availability_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_availability_v_final src
on trgt.row_id = CONCAT(src.team_user_id,'~',src.type,'~',src.year,'~',src.month) and src.sourceinstance = trgt.source_id
where trgt.year_c <>src.year;