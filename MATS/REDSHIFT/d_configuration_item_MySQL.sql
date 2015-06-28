
select case when count(1)>0 then 'Success' else 'Failure' end as Result,
case when count(1)<0 then 'No count' else 'Success' end as Message from (
SELECT COUNT(1) FROM <<tenant>>_mdwdb.d_configuration_item ) a
