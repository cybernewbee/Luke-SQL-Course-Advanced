Create Table job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_leter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
)

ALTER TABLE job_applied
ADD contact VARCHAR(50),
ADD company_name VARCHAR(255)

SELECT *
FROM job_applied

UPDATE job_applied
SET contact = 'Ms.Young', company_name = 'Thick Pro'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Ms.Zhong', company_name = 'Ne Tum'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Chun Li Wong', company_name = 'Somens'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Li Bo Zhang', company_name = 'Treasure Trading Co'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Ms.Tang', company_name = 'Shinco'
WHERE job_id = 5;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name

SELECT *
FROM job_applied

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN cover_letter_file_name;

DROP TABLE job_applied;

INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_leter_sent,
    cover_letter_file_name,
    status
  )
VALUES (1,
        '2024-03-19',
        false,
        'resume_eng.pdf',
        false,
        Null,
        'submitted'),
        (2,
        '2024-03-19',
        false,
        'resume_eng.pdf',
        false,
        Null,
        'submitted'),
        (3,
        '2024-03-21',
        false,
        'resume_eng.pdf',
        false,
        Null,
        'submitted'),
        (4,
        '2024-03-21',
        false,
        'resume_eng.pdf',
        false,
        Null,
        'submitted'),
        (5,
        '2024-03-23',
        false,
        'resume_eng.pdf',
        false,
        Null,
        'submitted');

SELECT *
FROM job_applied