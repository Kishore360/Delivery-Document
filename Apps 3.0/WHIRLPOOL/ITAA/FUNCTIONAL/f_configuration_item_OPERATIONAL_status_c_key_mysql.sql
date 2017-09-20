
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1)cnt  from(
select  SRC.label lab,LKP.row_key rk from 
(select distinct  sdof.label label,operational_status
 FROM whirlpool_mdsdb.cmdb_ci_final SRC
 LEFT JOIN whirlpool_mdsdb.sys_db_object_final sdof ON SRC.sys_class_name=sdof.name
and SRC.SourceInstance=sdof.SourceInstance

 
 WHERE  sdof.label in ('AIX Server','Application','DB2 Instance','Oracle Instance','IP Router','IP Switch',
'Linux Server','Business Service','Windows Server','SAP Instance','Technical Service','Unix Server','Storage',
'Personal Computer','Server') ) SRC  

LEFT JOIN whirlpool_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%OPERATIONAL_STATUS~CMDB_CI%' and 
( concat('OPERATIONAL_STATUS~CMDB_CI~~~',OPERATIONAL_status)= LKP.src_rowid 
 ) 
)A where (lab ,rk) not in 
 
  (select distinct ci_class_c class,operational_status_src_c_key from  whirlpool_mdwdb.f_configuration_item_aggregator_fact_c  where soft_deleted_flag='N'))ABC;