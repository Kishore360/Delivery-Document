<<<<<<< HEAD
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
rogersdev_mdwdb.d_application a
join
rogersdev_mdsdb.cmdb_ci_appl_final  b
on a.row_id = concat('APPLICATION~',b.sys_id) and a.source_id = b.sourceinstance

where COALESCE(b.u_subject_to_pci_testing ,'UNSPECIFIED') <> a.subject_to_pci_testing_c)a
=======
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_application.subject_to_pci_testing_c' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.cmdb_ci_appl_final  SRC 
JOIN rogersdev_mdwdb.d_application TRGT 
ON (concat('APPLICATION~',SRC.sys_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE COALESCE(SRC.u_subject_to_pci_testing ,'UNSPECIFIED')<> TRGT.subject_to_pci_testing_c
>>>>>>> 54d361e3db7741fe3d518a6787e7829f3e895dba
