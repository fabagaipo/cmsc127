--Find the names of all reviewers who rated ‘Gone with the Wind.’ 
SELECT DISTINCT name
FROM Movie M, Rating Rt, Reviewer Rv
WHERE M.mID = Rt.mID and Rt.rID = Rv.rID and title = 'Gone with the Wind';

--For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. 
SELECT DISTINCT name, title, stars
FROM Movie M, Rating Rt, Reviewer Rv
WHERE Rt.rID = Rv.rID and M.director = Rv.name and M.mID = Rt.mID;

--Return all reviewer names and movie names together in a single list, alphabetized. 
--(Sorting by the first name of the reviewer and the first word in the title is fine; no need for special processing on last names or removing “The”.)
SELECT name as Label FROM Reviewer
UNION
SELECT title as Label FROM Movie
ORDER BY Label;

--Find the titles of all movies not reviewed by Chris Jackson.
SELECT	DISTINCT title FROM	Movie 
EXCEPT
SELECT	DISTINCT title FROM	Reviewer, Rating, Movie WHERE Reviewer.rID = Rating.rID and Rating.mID = Movie.mID and name = 'Chris Jackson';

--For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. 
--Eliminate duplicates, don’t pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order.
SELECT DISTINCT Rv1.name, Rv2.name
FROM Reviewer Rv1, Reviewer Rv2, Rating Rt1, Rating Rt2
WHERE Rt1.mID = Rt2.mID and Rt1.rID = Rv1.rID and Rt2.rID = Rv2.rID and Rv1.name < Rv2.name
ORDER BY Rv1.name, Rv2.name;