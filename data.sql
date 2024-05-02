INSERT INTO Conference (id, title, location, startdate, enddate)
VALUES
    (1, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2010-11-11', '2010-11-11'),
    (2, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2011-11-11', '2011-11-11'),
    (3, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2012-11-11', '2012-11-11'),
    (4, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2013-11-11', '2013-11-11'),
    (5, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2014-11-11', '2014-11-11'),
    (6, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2015-11-11', '2015-11-11'),
    (7, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2016-11-11', '2016-11-11'),
    (8, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2017-11-11', '2017-11-11'),
    (9, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2018-11-11', '2018-11-11'),
    (10, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2019-11-11', '2019-11-11'),
    (11, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2020-11-11', '2020-11-11'),
    (12, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2021-11-11', '2021-11-11'),
    (13, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2022-11-11', '2022-11-11'),
    (14, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2023-11-11', '2023-11-11'),
    (15, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2024-11-11', '2024-11-11'),
    (16, 'The Special Interest Group in Computer Science Education Technical Symposium', 'Toronto', '2025-11-11', '2025-11-11'),
    (17, 'The ACM Global Computing Education Conference', 'Toronto', '2019-10-11', '2019-10-11'),
    (18, 'The ACM Global Computing Education Conference', 'Toronto', '2021-10-11', '2021-10-11'),
    (19, 'The ACM Global Computing Education Conference', 'Toronto', '2023-10-11', '2023-10-11'),
    (20, 'The ACM Global Computing Education Conference', 'Toronto', '2025-10-11', '2025-10-11');

INSERT INTO People (id, firstname, lastname, organization, email, phone, job)
VALUES
    (1, 'Michelle', 'Craig', 'Uoft', 'michelle.craig@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (2, 'Jennifer', 'Campbell', 'Uoft', 'jennifer.campbell@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (3, 'Sadia', 'Sharmin', 'Uoft', 'sadia.sharmin@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (4, 'Jonathan', 'Calver', 'Uoft', 'jonathan.calver@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (5, 'Larry', 'Zhang', 'Uoft', 'yueli.zhang@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (6, 'Diane', 'Horton', 'Uoft', 'diane.horton@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (7, 'Daniel', 'Zingaro', 'Uoft', 'daniel.zingaro@mail.utoronto.ca', '123-456-7890', 'Professor'),
    (8, 'Danny', 'Heap', 'Uoft', 'danny.heap@mail.utoronto.ca', '123-456-7890', 'Professor');

INSERT INTO Registration (conferenceid, peopleid, fare)
VALUES
    (1, 1, 10.0),
    (2, 1, 10.0),
    (3, 1, 10.0),
    (4, 1, 10.0),
    (5, 1, 10.0),
    (6, 1, 10.0),
    (7, 1, 10.0),
    (8, 1, 10.0),
    (9, 1, 10.0),
    (10, 1, 10.0),
    (11, 1, 10.0),
    (12, 1, 10.0),
    (13, 1, 10.0),
    (14, 1, 10.0),
    (15, 1, 10.0),
    (16, 1, 10.0),
    (17, 1, 10.0),
    (18, 1, 10.0),
    (19, 1, 10.0),
    (20, 1, 10.0),
    (6, 2, 10.0),
    (7, 2, 10.0),
    (8, 2, 10.0),
    (9, 2, 10.0),
    (10, 2, 10.0),
    (11, 2, 10.0),
    (12, 2, 10.0),
    (10, 3, 10.0),
    (11, 3, 10.0),
    (12, 3, 10.0),
    (17, 3, 10.0);

INSERT INTO Paper (id, title, type)
VALUES
    (1, 'Student Perspectives on Optional Groups', 'Paper'),
    (2, 'Experience Report on the Use of Breakout Rooms', 'Paper'),
    (3, 'Introducing and Evaluating Exam Wrappers in CS2', 'Paper'),
    (4, 'Paper1', 'Paper'),
    (5, 'Paper2', 'Paper'),
    (6, 'Paper3', 'Paper'),
    (7, 'Paper4', 'Paper'),
    (8, 'Paper5', 'Paper'),
    (9, 'Paper6', 'Paper'),
    (10, 'Paper7', 'Paper'),
    (11, 'Paper8', 'Paper');

INSERT INTO Author (paperid, authorid, authororder)
VALUES
    (1, 4, 1),
    (1, 2, 2),
    (1, 1, 3),
    (2, 3, 1),
    (2, 5, 2),
    (3, 1, 1),
    (3, 6, 2),
    (3, 7, 3),
    (3, 8, 4),
    (4, 1, 1),
    (5, 1, 1),
    (6, 1, 1),
    (7, 1, 1),
    (8, 1, 1),
    (9, 1, 1),
    (10, 1, 1),
    (11, 1, 1),
    (4, 2, 2),
    (5, 2, 2),
    (6, 2, 2),
    (7, 2, 2),
    (8, 3, 2),
    (9, 3, 2),
    (10, 3, 2),
    (11, 3, 2);

INSERT INTO Schedule (conferenceid, type, time, id)
VALUES
    (1, 'Paper', '12:00:00', 1),
    (2, 'Paper', '12:00:00', 2),
    (3, 'Paper', '12:00:00', 3),
    (4, 'Paper', '12:00:00', 4),
    (7, 'Paper', '12:00:00', 5),
    (14, 'Paper', '12:00:00', 6),
    (13, 'Paper', '12:00:00', 7);

INSERT INTO Session (sessionid, sessionchair, day)
VALUES
    (1, 1, 1),
    (2, 1, 1),
    (3, 1, 1),
    (4, 1, 1),
    (5, 1, 1),
    (6, 1, 1),
    (7, 1, 1);

INSERT INTO Submission (conferenceid, paperid, accepted, peopleid)
VALUES
    (14, 1, TRUE, 1),
    (13, 2, TRUE, 3),
    (1, 3, FALSE, 1),
    (1, 3, FALSE, 4),
    (2, 3, FALSE, 2),
    (2, 3, FALSE, 1),
    (3, 3, FALSE, 4),
    (3, 3, FALSE, 2),
    (4, 3, FALSE, 1),
    (7, 3, FALSE, 4),
    (7, 3, TRUE, 2);

INSERT INTO Presentation (paperid, sessionid, start_time, end_time)
VALUES
    (1, 6, '12:00:00', '12:00:10'),
    (2, 7, '12:00:00', '12:00:10'),
    (3, 1, '11:00:00', '11:00:10'),
    (4, 1, '12:00:00', '12:00:10'),
    (5, 2, '11:00:00', '11:00:10'),
    (6, 2, '12:00:00', '12:00:10'),
    (7, 3, '11:00:00', '11:00:10'),
    (8, 3, '12:00:00', '12:00:10'),
    (9, 4, '11:00:00', '11:00:10'),
    (10, 4, '12:00:00', '12:00:10'),
    (11, 5, '12:00:00', '12:00:10');




