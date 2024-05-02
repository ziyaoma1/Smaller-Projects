-- Branch Activity

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO A3Conference;
DROP TABLE IF EXISTS q1 cascade;

CREATE TABLE q1 (
    title TEXT NOT NULL,
    year INT NOT NULL,
    acceptance FLOAT NOT NULL
);

-- Do this for each of the views that define your intermediate steps.
-- (But give them better names!) The IF EXISTS avoids generating an error
-- the first time this file is imported.
-- If you do not define any views, you can delete the lines about views.
DROP VIEW IF EXISTS int1 CASCADE;
DROP VIEW IF EXISTS int2 CASCADE;

-- Define views for your intermediate steps here:
create view int1 as select title, Conference.id, count(accepted) as count from Conference, Submission where id = conferenceid group by Conference.id, title;
create view int2 as select title, Conference.id, count(accepted) as count from Conference, Submission where id = conferenceid and accepted = TRUE group by Conference.id, title;
create view int3 as SELECT Conference.title, EXTRACT(YEAR from startdate) as year, COALESCE(count, 1.0) FROM int1 right join Conference on Conference.id = int1.id;
create view int4 as SELECT Conference.title, EXTRACT(YEAR from startdate) as year, COALESCE(count, 0.0) FROM int2 right join Conference on Conference.id = int2.id;
select int3.title, int3.year , int4.coalesce/int3.coalesce from int3, int4 where int3.title = int4.title and int3.year = int4.year;

-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q1
select int3.title, int3.year , int4.coalesce/int3.coalesce from int3, int4 where int3.title = int4.title and int3.year = int4.year;
