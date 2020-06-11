select case when count(*)>0 then 'SUCCESS' else 'FAILURE' end as Result,
case when count(*)>0 then 'SUCCESS' else 'FAILURE' end as Message
from app_test.test_objects;