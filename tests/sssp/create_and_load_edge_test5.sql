drop table IF EXISTS edge;
create table edge(src int, dest int, weight int);
insert into edge values(1,2,3);
insert into edge values(2,1,1);
insert into edge values(1,3,2);
insert into edge values(3,1,2);
insert into edge values(1,4,1);
insert into edge values(4,1,5);
insert into edge values(2,4,1);
insert into edge values(4,2,2);
insert into edge values(3,4,1);
insert into edge values(4,3,1);
select * from edge;
