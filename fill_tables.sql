insert into companies values
	(default, text 'company1'),
	(default, text 'company2'),
	(default, text 'company3');

insert into users values
	(default, varchar 'user1@domain.com', text 'passhash1', now(), now(), null),
	(default, varchar 'user2@domain.com', text 'passhash2', now(), now(), null),
	(default, varchar 'user3@domain.com', text 'passhash3', now(), now(), null),
	(default, varchar 'user4@domain.com', text 'passhash4', now(), now(), 1),
	(default, varchar 'user5@domain.com', text 'passhash5', now(), now(), 1),
	(default, varchar 'user6@domain.com', text 'passhash5', now(), now(), 3),
	(default, varchar 'user7@domain.com', text 'passhash5', now(), now(), 3),
	(default, varchar 'user8@domain.com', text 'passhash5', now(), now(), 3);

insert into vacancies values
	(default, 3, text 'vacancy1', text 'description', money '10', money '10', 12, text 'skills', now(), now() + interval '1 hours'),
	(default, 3, text 'vacancy2', text 'description', money '10', money '10', 12, text 'skills', now(), now() + interval '23 hours'),
	(default, 3, text 'vacancy3', text 'description', money '10', money '10', 12, text 'skills', now(), now() + interval '24 hours'),
	(default, 3, text 'vacancy4', text 'description', money '10', money '10', 12, text 'skills', now(), now() + interval '25 hours'),

	(default, 3, text 'vacancy5', text 'description', money '10', money '10', 12, text 'skills', now() - interval '6 days', now() + interval '25 hours'),
	(default, 3, text 'vacancy6', text 'description', money '10', money '10', 12, text 'skills', now() - interval '6 days', now() + interval '25 hours'),
	(default, 3, text 'vacancy7', text 'description', money '10', money '10', 12, text 'skills', now() - interval '8 days', now() + interval '25 hours'),
	(default, 3, text 'vacancy8', text 'description', money '10', money '10', 12, text 'skills', now() - interval '8 days', now() + interval '25 hours');

insert into resumes values
	(default, 1, text 'resume1', text 'user1', date '1980-01-01', money '10', money '10', 12, text 'skills'),
	(default, 1, text 'resume2', text 'user1', date '1980-01-01', money '10', money '10', 12, text 'skills'),
	(default, 2, text 'resume3', text 'user2', date '1980-01-01', money '10', money '10', 12, text 'skills');

insert into responses values
	(5, 1, text 'response1'),
	(7, 1, text 'response2'),
	(7, 2, text 'response3'),
	(7, 3, text 'response4');

insert into invitations values
	(7, 2, text 'invitation1'),
	(7, 3, text 'invitation2');
