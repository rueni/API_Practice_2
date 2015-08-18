create database bookmarks;
\c bookmarks;
create table marks (id serial primary key, category varchar(255), name varchar(255), description varchar(255), url varchar(255));
