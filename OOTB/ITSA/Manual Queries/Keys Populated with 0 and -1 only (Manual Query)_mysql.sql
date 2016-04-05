use <<tenant>>_mdwdb;
select concat('SELECT ''',cols.table_name,'''as tName,''',
cols.column_name,''' as Cname ,',
'count(*) as totalrecs,  COUNT(distinct ',
cols.column_name,
' )abc FROM ',cols.table_name,' UNION ALL')
from information_schema.COLUMNS cols inner join information_schema.TABLES tbl
on 
cols.TABLE_SCHEMA=Database() and cols.column_name like '%\_key' and cols.column_name not like 'row\_%key'
and 
cols.table_name = tbl.TABLE_NAME and cols.TABLE_SCHEMA=tbl.table_schema and TABLE_ROWS>2 and 
(cols.table_name like 'f\_%' OR cols.table_name like 'd\_%');

/*select * from ( */
/*)a where abc <=2 */