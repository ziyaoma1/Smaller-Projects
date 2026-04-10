DROP SCHEMA IF EXISTS A3Conference CASCADE;
CREATE SCHEMA A3Conference;
SET SEARCH_PATH TO A3Conference;

--Could not be done without Assertion/Triggers
-- 1) To help ensure there are enough reviewers for submissions, at least one author on each paper must be a reviewer.
-- This is not a requirement for posters.
-- Requires to check both tables Author and Reviewer, making this a cross table assertion
-- 2)Reviewers cannot review their own submissions, the submissions of anyone else with whom they are co-authors, or the
-- submissions of anyone else from their organization.
-- Requires cross table assertion of People and Reviewer
-- 3)A submission must receive at least three reviews before it can have a decision – either “accept” or “reject”. Each
-- review recommends a decision, and a submission cannot be accepted if it no reviewer recommended “accept”.
-- Requires cross table assertion of Submission and Reviewer
-- 4) Submissions that have previously been accepted cannot be submitted again later.
-- Requires to check the relations own columns
-- 5) Paper/Poster Presented in right section, and each paper has its own start time within the session.
-- Requires to check the relations own columns
-- 6) Paper sessions also require someone in the role of “session chair”
-- 7) No author can have two presentations at the same time...
-- Requires cross table assertion between Author and Presentation
-- 8) Students pay a lower fee than other attendees.
-- 9) At least one author on every accepted submission must be registered for the conference.
-- Requires cross table assertion of Submission and Registration
-- 10) The conference chairs must have been on the organizing committee for that conference at least twice before
-- becoming conference chair, unless the conference is too new.
-- Requires cross table assertion of Conference and Committee, and count for Committee


-- Assumptions:
-- 1) Those who registered will attend the conference, otherwise we can create a seperate relation called Attended.
-- 2) Fares cost different for students, else we can move fare cost from WorkshopRegistration to Workshop. Also it was
-- not clear if they wanted the fare as a seperate payment or not, so I assumed it was.
-- 3) Assume there is no fixed cost for conferences for students and others, ex. Conferences cost different amounts to
-- attend
-- 4) Conferences can potentially last for more than 1 day, so start and end dates are required, otherwise we only need
-- a start date.
-- 5) Assume that a session takes place in 1 day, since nobody would attend a session that goes through midnight




CREATE TYPE A3Conference.session_type AS ENUM (
    'Poster', 'Paper'
    -- Reuse the type for the type of paper as well since it should be the same
    );

CREATE TYPE A3Conference.role_type AS ENUM (
    'Member', 'Chair'
    );
CREATE TABLE IF NOT EXISTS People (
                                      id INT PRIMARY KEY,
    -- The first name of the individual.
                                      firstname TEXT NOT NULL,
    -- The last name of the individual.
                                      lastname TEXT NOT NULL,
    -- The organization the individual belongs in.
                                      organization TEXT NOT NULL,
    -- The email of the person.
                                      email TEXT NOT NULL,
    -- The phone number of the person.
                                      phone TEXT NOT NULL,
    -- The job of the person. Mainly used for student fair.
                                      job TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Conference (
                                       id INT PRIMARY KEY,
    -- The title of the Conference.
                                       title TEXT NOT NULL,
    -- The location of the conference.
                                       location TEXT NOT NULL,
    -- The start and end dates of the Conference.
                                        startdate DATE NOT NULL,
                                        enddate DATE NOT NULL,
                                        check (startdate <= enddate)
);
CREATE TABLE IF NOT EXISTS Schedule (
                                          conferenceid INT NOT NULL references Conference(id),
    -- The type of the session.
                                          type session_type NOT NULL,
    -- The time of the session.
                                          time TIME NOT NULL,
                                          id INT PRIMARY KEY NOT NULL
);
CREATE TABLE IF NOT EXISTS Workshop(
    --Workshopid
    id INT PRIMARY KEY ,
        --Conference Workshop is held in
    conferenceid INT NOT NULL references Conference(id),
    --Facilitator
    Facilitator INT NOT NULL references People(id)
);

CREATE TABLE IF NOT EXISTS WorkshopRegistration(
    workshopid INT NOT NULL REFERENCES Workshop(id),
    peopleid INT NOT NULL references People(id),
    -- Assuming fares cost different for students, else we can move fare cost to Workshop
    fare INT NOT NULL,
    PRIMARY KEY (workshopid, peopleid)
);

CREATE TABLE IF NOT EXISTS Session(
    -- Which session paper is being presented from
    sessionid INT NOT NULL references Schedule(id),
    -- Session chair can be NULL if poster session
    sessionchair INT references People(id),
    -- The day the session is in, ex. if the session is on start date, then day is 1.
    day INT NOT NULL,
    primary key (sessionid, sessionchair)
);

CREATE TABLE IF NOT EXISTS Committee (
                                          conferenceid INT NOT NULL references Conference(id),
    -- The id of individual in Organizing Committee.
                                          peopleid INT NOT NULL references People(id),
    -- The role (Chair or Member)
                                          role role_type NOT NULL,
                                          PRIMARY KEY (conferenceid, peopleid, role)
                                     );

CREATE TABLE IF NOT EXISTS Participant (
                                     conferenceid INT NOT NULL references Conference(id),
    -- ID of Individual that participated at the Conference.
                                     peopleid INT NOT NULL references People(id),
                                     PRIMARY KEY (conferenceid, peopleid)
);

CREATE TABLE IF NOT EXISTS Paper (
                                         id INT PRIMARY KEY,
    -- The title of the paper.
                                         title TEXT NOT NULL,
    -- The type of paper, poster or paper.
                                         type session_type NOT NULL
);

CREATE TABLE IF NOT EXISTS Registration (
    --Assume that all registered people attend
    conferenceid INT NOT NULL references Conference(id),
    peopleid INT NOT NULL references People(id),
    -- fare cost in dollars
    fare FLOAT NOT NULL,
    PRIMARY KEY(conferenceid, peopleid)
);


CREATE TABLE IF NOT EXISTS Reviewer (
    -- The id of individual in Commitee.
                                     reviewerid INT NOT NULL references People(id),
    -- The date of the Conference.
                                     paperid INT NOT NULL references Paper(id),
    -- Decision whether the accepted (represented with TRUE) or not (FALSE)
                                     accepted BOOLEAN NOT NULL,
    PRIMARY KEY (reviewerid, paperid)
);
CREATE TABLE IF NOT EXISTS Conflicts(
    -- Used to declare conflicts
    reviewerid INT NOT NULL references People(id),
    -- Papers that reviewer would have additional conflict with
    paperid INT NOT NULL references Paper(id),
    PRIMARY KEY (reviewerid, paperid)
);

CREATE TABLE IF NOT EXISTS Author (
    -- The id of the paper
                                     paperid INT NOT NULL references Paper(id),
    -- The id of author
                                     authorid INT NOT NULL references People(id),
    -- Order of authors
                                     authororder INT NOT NULL,

    PRIMARY KEY (paperid, authorid)

);

CREATE TABLE IF NOT EXISTS Submission (
                                          conferenceid INT NOT NULL references Conference(id),
    -- The id of paper.
                                          paperid INT NOT NULL references Paper(id),
    -- Whether the submission was accepted or not
                                          accepted BOOLEAN NOT NULL,
                                          peopleid INT NOT NULL references People(id),
                                          PRIMARY KEY (conferenceid, paperid, peopleid));

CREATE TABLE IF NOT EXISTS Presentation(
    -- Paper being presented at Session
                                           paperid INT NOT NULL references Paper(id),
                                           sessionid INT NOT NULL references Schedule(id),
    -- Start and end times for presentations
                                           start_time TIME NOT NULL,
                                           end_time TIME NOT NULL,
                                           primary key (paperid, sessionid),
                                           check (start_time <= end_time)
);
