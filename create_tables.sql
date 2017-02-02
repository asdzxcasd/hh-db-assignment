create table companies (
	id serial primary key,
	name text
);

create table users (
	id serial primary key,
	email varchar(254) unique,
	passhash text,
	registration_time timestamptz,
	last_visited timestamptz,
	company_id integer references companies(id)
);

create table vacancies (
	id serial primary key,
	company_id integer references companies(id) not null,
	title text,
	description text,
	salary_min money,
	salary_max money,
	experience integer,
	skills text,
	publication_begin timestamptz,
	publication_end timestamptz
);

create table resumes (
	id serial primary key,
	user_id integer references users(id) not null,
	title text,
	name text,
	birthday date,
	salary_min money,
	salary_max money,
	experience integer,
	skills text
);

create table responses (
	vacancy_id integer references vacancies(id) not null,
	resume_id integer references resumes(id) not null,
	message_text text
);

create table invitations (
	vacancy_id integer references vacancies(id) not null,
	resume_id integer references resumes(id) not null,
	message_text text
);
