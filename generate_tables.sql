insert into companies (
	select id,
		'Company name ' || id::text
	from generate_series(1, 1000) as id
);

select * from companies limit 100;

insert into users (
	select id,
		'user' || id::text || '@domain.com',
		'$2a$10$6oY3C3hq6HVvQOCAd3sKxOVBRO.yKSZSWoTU5bv3D2knFdWV5kzpO',
		now() - interval '10 years' * random(),
		null,
		('[0:1]={employer,applicant}'::text[])[trunc(random() * 2)]::user_type
	from generate_series(1, 1000) as id
);

select * from users limit 100;

insert into users_employer (
	select users.user_id,
		1 + trunc(random() * (select count(*) from companies))
	from users
	where users.user_role = 'employer'
);

select * from users_employer limit 100;

insert into users_applicant (
	select users.user_id,
		now() - interval '100 years' * random()
	from users
	where users.user_role = 'applicant'
);

select * from users_applicant limit 100;

insert into vacancies (
	select id,
		1 + trunc(random() * (select count(*) from companies)),
		'Vacancy name',
		'Vacancy description',
		100000,
		200000,
		12,
		'Skills list',
		now() - interval '10 years' * random(),
		now() - interval '10 years' * random()
	from generate_series(1, 1000000) as id
);

select * from vacancies limit 100;

insert into resumes (
	select id,
		(select user_id
			from users_applicant
			where id = id --  a hack to make a subrequest for each resume
			limit 1
			offset trunc(random() * (select count(*) from users_applicant))),
		'Title',
		'User name',
		100000,
		200000,
		12,
		'Skills list'
	from generate_series(1, 1000000) as id
);

select * from resumes limit 100;

insert into responses (
	select
		1 + trunc(random() * (select count(*) from vacancies)),
		1 + trunc(random() * (select count(*) from resumes)),
		'Message text'
	from generate_series(1, 1000000) as id
);

select * from responses limit 100;

insert into invitations (
	select
		1 + trunc(random() * (select count(*) from vacancies)),
		1 + trunc(random() * (select count(*) from resumes)),
		'Message text'
	from generate_series(1, 1000000) as id
);

select * from invitations limit 100;
