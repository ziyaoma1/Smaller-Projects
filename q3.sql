-- Branch Activity

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO A3Conference;
DROP TABLE IF EXISTS q3 cascade;

CREATE TABLE q3 (
    Author INT NOT NULL,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);

-- Do this for each of the views that define your intermediate steps.
-- (But give them better names!) The IF EXISTS avoids generating an error
-- the first time this file is imported.
-- If you do not define any views, you can delete the lines about views.
DROP VIEW IF EXISTS intermediate CASCADE;
DROP VIEW IF EXISTS intermediate2 CASCADE;
DROP VIEW IF EXISTS intermediate3 CASCADE;

-- Define views for your intermediate steps here:
CREATE VIEW intermediate AS select conferenceid, count(conferenceid) from Submission where accepted = TRUE group by conferenceid;
CREATE VIEW intermediate2 AS select title, sum(count) as sum from intermediate, Conference where id = conferenceid group by title;
CREATE VIEW intermediate3 AS select title, Conference.id from intermediate2 natural join Conference where sum in (select max(sum) from intermediate2);
-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q3
select authorid, firstname, lastname from Author, People where authorid = id and authororder = 1 and paperid in (select paperid from Submission, intermediate3 where conferenceid = id and accepted = TRUE);
