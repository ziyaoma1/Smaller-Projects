-- Branch Activity

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO A3Conference;
DROP TABLE IF EXISTS q4 cascade;

CREATE TABLE q4 (
    paperid INT NOT NULL,
    title TEXT NOT NULL
);

-- Do this for each of the views that define your intermediate steps.
-- (But give them better names!) The IF EXISTS avoids generating an error
-- the first time this file is imported.
-- If you do not define any views, you can delete the lines about views.
DROP VIEW IF EXISTS intermediate CASCADE;

-- Define views for your intermediate steps here:
CREATE VIEW intermediate AS select paperid, count(paperid) as count from Submission where paperid in (select paperid from Submission where accepted = TRUE) group by paperid;
-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q4
select paperid, title from Paper, intermediate where paperid = id and count in (select max(count) from intermediate);