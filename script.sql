-- Questão 01
SELECT * FROM companies LIMIT 5;

-- Questão 02
SELECT * FROM companies WHERE name = 'Driven';

-- Questão 03
INSERT INTO companies (name, image_url) VALUES ('Apple', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/488px-Apple_logo_black.svg.png');

-- Questão 04
DELETE FROM companies WHERE name = 'Apple';

-- Questão 05
UPDATE companies SET name = 'Google' WHERE name = 'Gogle';

-- Questão 06
UPDATE jobs SET salary = 1500 WHERE id = 1;

-- Questão 07
INSERT INTO experiences (user_id, company_id, role_id, start_date) VALUES (3, 6, 5, '2024-09-26');

-- Questão 08
DELETE FROM applicants WHERE id = 16;

-- Questão 09
SELECT id, description, salary FROM jobs
	ORDER BY salary DESC
	LIMIT 3;

-- Questão 10
SELECT jobs.id, companies.name AS company_name, jobs.salary
	FROM jobs
	JOIN companies ON jobs.company_id = companies.id
	ORDER BY salary
	LIMIT 1;

-- Questão 11
SELECT users.id, users.name, cities.name AS city
	FROM users
	JOIN cities ON cities.id = users.city_id
	WHERE cities.name = 'Rio de Janeiro';

-- Questão 12
SELECT testimonials.id, testimonials.message, writers.name AS writer, recipients.name AS recipient
	FROM testimonials
	JOIN users writers ON testimonials.writer_id = writers.id
	JOIN users recipients ON testimonials.recipient_id = recipients.id;

-- Questão 13
SELECT courses.id, users.name, courses.name AS course, schools.name AS schools, educations.end_date
	FROM educations
	JOIN courses ON courses.id = educations.course_id
	JOIN users ON users.id = educations.user_id
	JOIN schools ON schools.id = educations.school_id
	WHERE users.id = 5 AND educations.status = 'finished';

-- Questão 14
SELECT users.id, users.name, roles.name AS role, companies.name AS company, experiences.end_date
	FROM experiences
	JOIN users ON users.id = experiences.user_id
	JOIN roles ON roles.id = experiences.role_id
	JOIN companies ON companies.id = experiences.company_id
	WHERE users.id = 10 AND end_date IS NOT NULL;

-- Questão 15
SELECT schools.id, schools.name AS school, courses.name AS course, companies.name AS company, roles.name AS roles
	FROM applicants
	JOIN educations ON educations.user_id = applicants.user_id
	JOIN courses ON courses.id = educations.course_id
	JOIN schools ON schools.id = educations.school_id
	JOIN jobs ON jobs.id = applicants.job_id
	JOIN roles ON roles.id = jobs.role_id
	JOIN companies ON companies.id = jobs.company_id
	WHERE companies.id = 1 AND roles.name = 'Engenheiro de Software Pleno' AND jobs.active = true;

-- Questão 16
SELECT COUNT(end_date) AS current_experiences FROM experiences;

-- Questão 17
SELECT users.id, users.name, COUNT(educations.user_id) AS educations
	FROM users
	JOIN educations ON users.id = educations.user_id
	GROUP BY users.id
	ORDER BY educations DESC;

-- Questão 18
SELECT users.name AS writer, COUNT(users.id) AS "testimonialCount"
	FROM testimonials
	JOIN users ON users.id = testimonials.writer_id
	WHERE users.id = 9
	GROUP BY users.id;

-- Questão 19
SELECT MAX(jobs.salary) AS maximum_salary, roles.name AS role
	FROM jobs
	JOIN roles ON roles.id = jobs.role_id
	WHERE jobs.active = true
	GROUP BY roles.name
	ORDER BY maximum_salary;

-- Questão 20
SELECT schools.name AS school, courses.name AS course, COUNT(educations.user_id) AS student_count
	FROM educations
	JOIN schools ON schools.id = educations.school_id
	JOIN courses ON courses.id = educations.course_id
	WHERE educations.status = 'finished'
	GROUP BY schools.name, courses.name
	ORDER BY student_count DESC
	LIMIT 3;
