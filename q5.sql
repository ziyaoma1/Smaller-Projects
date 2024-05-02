-- Branch Activity

-- You must not change the next 2 lines or the table definition.
SET SEARCH_PATH TO A3Conference;
DROP TABLE IF EXISTS q5 cascade;

CREATE TABLE q5 (
    title TEXT NOT NULL,
    year INT NOT NULL,
    avgpaper FLOAT NOT NULL,
    avgposter FLOAT NOT NULL
);

-- Do this for each of the views that define your intermediate steps.
-- (But give them better names!) The IF EXISTS avoids generating an error
-- the first time this file is imported.
-- If you do not define any views, you can delete the lines about views.
DROP VIEW IF EXISTS intermediate CASCADE;
DROP VIEW IF EXISTS intermediate1 CASCADE;
DROP VIEW IF EXISTS intermediate2 CASCADE;
DROP VIEW IF EXISTS intermediate3 CASCADE;

-- Define views for your intermediate steps here:

CREATE VIEW intermediate AS select sessionid, count(sessionid) as count from Presentation group by sessionid;
CREATE VIEW intermediate1 AS select Conference.id, title, avg(count) as averagepaper from intermediate, Schedule right join Conference on Conference.id = conferenceid where Schedule.id = sessionid and type = 'Paper' group by Conference.id, title;
CREATE VIEW intermediate2 AS select Conference.id, title, avg(count) as averageposter from intermediate, Schedule right join Conference on Conference.id = conferenceid where Schedule.id = sessionid and type = 'Poster' group by Conference.id, title;
CREATE VIEW intermediate3 AS select Conference.id, Conference.title, averagepaper from intermediate1 full outer join Conference on intermediate1.id = Conference.id;
CREATE VIEW intermediate4 AS select Conference.id, Conference.title, averageposter from intermediate2 full outer join Conference on intermediate2.id = Conference.id;
CREATE VIEW intermediate5 as select intermediate3.id, intermediate3.title, averagepaper, averageposter from intermediate3 natural join intermediate4;

-- Your query that answers the question goes below the "insert into" line:
INSERT INTO q5
select Conference.title, EXTRACT(YEAR from startdate), COALESCE(averagepaper, 0.0), COALESCE(averageposter, 0.0) from Conference full outer join intermediate5 on intermediate5.id = Conference.id;
