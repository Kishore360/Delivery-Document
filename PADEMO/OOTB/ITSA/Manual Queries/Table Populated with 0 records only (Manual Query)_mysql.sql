use <<tenant>>_mdwdb;
select distinct  concat('SELECT ''',cols.table_name,'''as tName,','count(*) as totalrecs  FROM ',cols.table_name,' UNION ALL')
from information_schema.COLUMNS cols inner join information_schema.TABLES tbl
on 
cols.TABLE_SCHEMA=Database()


/*select * from ( */
/*)a where totalrecs=0 */