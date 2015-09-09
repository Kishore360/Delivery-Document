SELECT CASE WHEN CNT>0 THEN concat('FAILURE ON TABLE -',B.table_name) ELSE 'SUCCESS' END FROM 

( 
SELECT COUNT(1) AS CNT,group_concat(A.table_name) as table_name FROM


(

SELECT "internalaudittrail" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdsdb`.`internalaudittrail` UNION 
SELECT "internalentity" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdsdb`.`internalentity` UNION 
SELECT "internallongnames" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdsdb`.`internallongnames` UNION 
SELECT "internalstatus" AS table_name, COUNT(*) AS exact_row_count FROM `starwood_mdsdb`.`internalstatus` 
) A



where exact_row_count=0)B