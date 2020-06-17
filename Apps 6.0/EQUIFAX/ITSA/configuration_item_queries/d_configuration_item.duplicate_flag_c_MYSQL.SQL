SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
 (select count(1)>1 as CNT from equifax_mdwdb.d_configuration_item src
 JOIN (
SELECT name from equifax_mdwdb.d_configuration_item 
where class in ('Application','Business Service','Patch Group')
group by 1 having count(1)>1
) b 
ON src.name = b.name  and src.duplicate_flag_c<>'Y'
union 
select count(1)>1 as CNT from equifax_mdwdb.d_configuration_item src
JOIN (
select serial_number_c from equifax_mdwdb.d_configuration_item where 
class in ('Linux Server', 'Windows Server', 'Server', 'Solaris Server', 'AIX Server', 'ESX Server', 'Hyper V Server', 'IBM Mainframe LPAR', 'OS/X Server')
group by 1 having count(1)>1
 ) c  on src.serial_number_c=c.serial_number_c and src.duplicate_flag_c <>'Y' 
 union
 select count(1)>1 as CNT from equifax_mdwdb.d_configuration_item src
 JOIN (
 select name,ip_address_c from equifax_mdwdb.d_configuration_item where
class in ('Linux Server', 'Windows Server', 'Server', 'Solaris Server', 'AIX Server', 'ESX Server', 'Hyper V Server', 'IBM Mainframe LPAR', 'OS/X Server')
group by 1,2 having count(1)>1 
 ) d on src.name=d.name and src.ip_address_c=d.ip_address_c and src.duplicate_flag_c <>'Y' and src.soft_deleted_flag='N')ma
