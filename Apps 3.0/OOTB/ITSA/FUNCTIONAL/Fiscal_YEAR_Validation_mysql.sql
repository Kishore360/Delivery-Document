Select CASE WHEN year_count<>60 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN year_count<>60 THEN 'Years have been dropped' ELSE 'SUCCESS' END as Message
FROM (select count(*) as year_count from <<tenant>>_mdwdb.d_fiscal_year) as year_count;