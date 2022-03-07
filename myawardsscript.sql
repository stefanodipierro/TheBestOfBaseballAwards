-- Heaviest Hitters to table
SELECT batting.yearid AS Year, teams.name AS Team, AVG(people.weight) AS "average weight"
INTO heavyhitters
FROM people
JOIN batting ON  people.playerid = batting.playerid
JOIN teams ON teams.id = batting.team_id
GROUP BY 1, 2
ORDER BY 3 DESC;
 -- Shortest sluggers to table
SELECT batting.yearid AS Year, teams.name AS Team, AVG(people.height) AS "average height"
INTO shortest_sluggers
FROM people
JOIN batting ON  people.playerid = batting.playerid
JOIN teams ON teams.id = batting.team_id
GROUP BY 1, 2
ORDER BY 3 ASC;
-- Big spenders into table
SELECT salaries.yearid AS Year, teams.name AS Team, SUM(salary) AS "total salary"
INTO biggest_spenders
FROM salaries
JOIN teams ON salaries.team_id = teams.id
GROUP BY 2,1
ORDER BY 3 DESC;

-- Bang for the Bucks to table in 2010
SELECT teams.name AS Team, ROUND(SUM(salary)/ teams.w) AS "cost/win", salaries.yearid
FROM salaries
JOIN teams ON salaries.teamid = teams.teamid
WHERE teams.yearid = 2010 AND salaries.yearid = 2010
GROUP BY 1, 3, teams.w
ORDER BY 2 DESC;

-- Pricier Starter

SELECT
	people.namefirst,
  people.namelast,
  ROUND(salaries.salary/ pitching.gs) AS "Cost per game",
  pitching.yearid
 FROM salaries
 JOIN pitching ON salaries.team_id = pitching.team_id
	AND salaries.playerid = pitching.playerid
 	AND salaries.yearid = pitching.yearid
 JOIN people ON salaries.playerid = people.playerid
 WHERE pitching.gs >= 10
 ORDER BY 3 DESC;
