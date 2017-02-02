-- Работодатели без вакансий (название компании, один из емейлов работодателя, время регистрации, время последнего входа)
select distinct on (companies.id) companies.name, users.email
from companies
left outer join vacancies
on companies.id = vacancies.company_id
left outer join users
on companies.id = users.company_id
where vacancies.id is null;

-- Вакансии срок размещения которых истекает менее чем через сутки (название должности, название компании, один из емейлов работодателя, время истечения размещения)
select distinct on (vacancies.id) vacancies.title, companies.name, users.email, vacancies.publication_end
from vacancies
inner join companies
on vacancies.company_id = companies.id
left outer join users
on companies.id = users.company_id
where publication_end < now() + interval '24 hours';

-- Активные вакансии, которые размещены более чем неделю, но без сообщений от соискателей (название должности, название компании, один из емейлов работодателя,)
select distinct on (vacancies.id) vacancies.title, companies.name, users.email
from vacancies
inner join companies
on vacancies.company_id = companies.id
left outer join responses
on vacancies.id = responses.vacancy_id
left outer join users
on companies.id = users.company_id
where publication_begin < now() - interval '1 week' and publication_end > now() and responses.vacancy_id is null;

-- Количество уникальных откликов/приглашений на вакансию - количество пользователей откликнувшихся на вакансию (название должности, название компании, количество уникальных откликов)
select vacancies.title, companies.name, count(resumes.user_id)
from vacancies
left outer join responses
on vacancies.id = responses.vacancy_id
inner join resumes
on responses.resume_id = resumes.id
inner join companies
on vacancies.company_id = companies.id
group by vacancies.id, companies.id;

-- Среднее количество откликов/приглашений на вакансию у компаний (название компании, количество)
-- select companies.id, count(vacancies.id)
-- from companies
-- inner join vacancies
-- on companies.id = vacancies.company_id
-- group by companies.id;

-- select vacancies.id, count(responses.vacancy_id)
-- from vacancies
-- left outer join responses
-- on vacancies.id = responses.vacancy_id
-- group by vacancies.id;

select companies.name, avg(responses_count.count)
from companies
inner join (
	select vacancies.company_id, count(responses.vacancy_id)
	from vacancies
	left outer join responses
	on vacancies.id = responses.vacancy_id
	group by vacancies.id
)
as responses_count
on companies.id = responses_count.company_id
group by companies.id;
