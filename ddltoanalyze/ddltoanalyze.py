
from sql_metadata import Parser

f1 = open('12_Costbenefit_0.0.2_DDL.sql','r',encoding='utf8')
f2 = open("12_Costbenefit_0.0.2_DDL.sql.tmp",'w',encoding='utf8')
line = f1.readline()
while line:
    line=line.strip()
    if line:
        if line.startswith('--'):
            pass
        else:
            f2.write(line)
    line = f1.readline()
f1.close()
f2.close()
f3 = open("12_Costbenefit_0.0.2_DDL.sql.tmp",'r',encoding='utf8')
line = f3.readline()
line_list=line.split(';')
tb_list=[]
for i in line_list:
    i.strip()
    i.upper()
    if i.startswith('ALTER'):

        tb_list.append(Parser(i).tables[0])


print(tb_list)
# print(Parser(sql).query_type)
# print(Parser(sql).tables)
