
select 'ldb."f_moc_vendor_c" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_moc_vendor_c" a11
UNION 
select 'ldb."d_moc_vendor_c" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."f_moc_vendor_c" a11
join "ldb"."d_moc_vendor_c" a12 ON a11.moc_vendor_c_key=a12.row_key