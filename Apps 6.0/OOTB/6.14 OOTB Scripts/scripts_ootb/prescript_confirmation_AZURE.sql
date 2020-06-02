SELECT CASE WHEN count(1) > 0 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
 CASE WHEN count(1) >0 THEN 'Pre-script executed successfully' ELSE 'Time out or some other error' END as Message;