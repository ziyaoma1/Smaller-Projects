-- Branch Activity

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO A3Conference;
DROP TABLE IF EXISTS q2 cascade;

CREATE TABLE q2 (
    id INT NOT NULL,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    attended INT NOT NULL
);

-- Do this for each of the views that define your intermediate steps.
-- (But give them better names!) The IF EXISTS avoids generating an error
-- the first time this file is imported.
-- If you do not define any views, you can delete the lines about views.
DROP VIEW IF EXISTS intermediate_step CASCADE;

-- Define views for your intermediate steps here:

-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q2
select id, firstname, lastname, count(peopleid) from People left join Registration on id = peopleid group by id;
