CREATE TABLE job_table(
    job_id INT,
    application_sent_job DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(55)
    );

SELECT *
FROM job_table

INSERT INTO job_table
            (
            job_id,
            application_sent_job,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES           (2,
                '03-2-2024',
                true,
                'resume_02.pdf',
                false,
                'cover_leter_02.pdf',
                'submitted'),
                 (3,
                '01-3-2024',
                false,
                'resume_03.pdf',
                true,
                'cover_leter_03.pdf',
                'submitted'),
                (4,
                '04-3-2024',
                false,
                'resume_04.pdf',
                false,
                'cover_leter_04.pdf',
                'submitted'),
                (5,
                '01-5-2024',
                true,
                'resume_05.pdf',
                true,
                'cover_leter_05.pdf',
                'submitted'),
                (6,
                '10-5-2024',
                true,
                'resume_0.6pdf',
                false,
                'cover_leter_06.pdf',
                'submitted'
            );

SELECT *
FROM job_table

ALTER TABLE job_table
ADD contact VARCHAR(50);

INSERT INTO job_table(
    contact
          )
VALUES(
    '073039494'
);

UPDATE job_table
SET contact = 'Mohammed DC'
WHERE job_id = 1;

UPDATE job_table
SET contact = 'Mustafa Sultan'
WHERE job_id = 2;

UPDATE job_table
SET contact = 'Emad Jalba'
WHERE job_id = 3;

UPDATE job_table
SET contact = 'Ahmed Farog'
WHERE job_id = 4;

UPDATE job_table
SET contact = 'Essam Ahmed'
WHERE job_id = 5;

UPDATE job_table
SET contact = 'Yousif ahmed'
WHERE job_id = 6;

ALTER TABLE job_table
RENAME COLUMN contact to contact_name;

ALTER TABLE job_table
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_table
DROP contact_name;

DROP TABLE table_name

SELECT *
FROM job_table