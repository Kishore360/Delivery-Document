START TRANSACTION;
CALL `app_test`.`SP_SYSTEM_TEST`('#TENANT_NAME', '#SCENARIO','#FILTER_LIST','#LEVEL');
COMMIT;