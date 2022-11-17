CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int,
  "role_id" int
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar DEFAULT 'student'
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level_id" int NOT NULL,
  "teacher_id" uuid
);

CREATE TABLE "users_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "course_id" uuid
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_categories" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "category_id" uuid
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");



/*--COMMANDS--*/


/*ROLES*/
insert into roles (
"name" 
) values (
'admin'
), (
'teacher'
),(
'student'
);

select * from roles


/*USERS*/
insert into users (
id,
name,
email,
"password" ,
age,
role_id
) values (
'71776138-f28d-4735-877a-28da444ae378',
'Fabian',
'fabian@academlo.com',
'1234',
19,
3
),(
'8b8cefda-39e6-4fad-931a-0b702e0d8006',
'Joséd',
'joséd@academlo.com',
'5678',
19,
3
);

select * from users 


/*LEVELS*/
insert into "levels"  (
"name" 
) values (
'advanced'
), (
'intermediate'
), (
'beginners'
);

select * from levels


/*TEACHERS*/
insert into teachers  (
id,
"name" 
) values (
'bc4354e1-3b30-47ae-aab2-f0d5c984e5e0',
'Nicolas Schurmann'
),(
'44580cb2-acb2-4e49-a524-2fe1438897eb',
'Miguel Ángel'
);

select * from teachers 


/*COURSES*/
insert into courses (
id,
title,
description,
level_id,
teacher_id 
) values (
'c6f7086a-a789-4a9e-a81f-7afba9f5916e',
'Aprende React',
'Aprenderas sobre componentes, estados y hooks',
3,
'bc4354e1-3b30-47ae-aab2-f0d5c984e5e0'
), (
'de66bf2e-0438-43bf-a792-eb2074229dd0',
'Aprende Diseño y Animación 3D',
'Aprenderas sobre Blender',
3,
'44580cb2-acb2-4e49-a524-2fe1438897eb'
);

select * from courses 


/*COURSE VIDEOS*/
insert into course_videos  (
id,
title,
url,
course_id 
) values (
'0c94336f-1f71-4836-adf6-4f77c7bb6fe4',
'Introducción React',
'https://www.reactprincipiantes.com',
'c6f7086a-a789-4a9e-a81f-7afba9f5916e'
), (
'9d337c12-2fbc-4662-a56b-386124054ba2',
'Introducción Blender',
'https://www.blenderprincipiantes.com',
'de66bf2e-0438-43bf-a792-eb2074229dd0'
);

select * from course_videos 


/*CATEGORIES*/
insert into categories  (
id,
"name" 
) values (
'0db41112-0289-413d-aedb-11655ab21f99',
'Desarrollo Web'
), (
'9ee980e6-7ee0-4e38-a05d-43f0460796e4',
'Diseño'
),(
'056b48aa-b60e-4ffb-b06c-3d08ad5af4e0',
'React'
), (
'55316505-2c6d-49ed-9ce0-125a29274760',
'Blender'
);

select * from categories 


/*COURSES CATEGORIES*/
insert into courses_categories  (
id,
course_id,
category_id 
) values (
'5310ebcc-bc7e-4408-9687-b881f49f37de',
'c6f7086a-a789-4a9e-a81f-7afba9f5916e',
'0db41112-0289-413d-aedb-11655ab21f99'
), (
'30cca186-e88b-44be-969d-aa2856b255b0',
'c6f7086a-a789-4a9e-a81f-7afba9f5916e',
'056b48aa-b60e-4ffb-b06c-3d08ad5af4e0'
), (
'ef8b9dcd-05ad-40d5-85f9-794472a319ff',
'de66bf2e-0438-43bf-a792-eb2074229dd0',
'9ee980e6-7ee0-4e38-a05d-43f0460796e4'
), (
'fbef326a-360f-47c9-897c-4ef50559bd01',
'de66bf2e-0438-43bf-a792-eb2074229dd0',
'55316505-2c6d-49ed-9ce0-125a29274760'
);

select * from courses_categories 


/*USERS COURSES*/
insert into users_courses (
id,
user_id ,
course_id 
) values (
'2eba7dc3-3ccf-4c4a-95a6-5d74f843d528',
'71776138-f28d-4735-877a-28da444ae378',
'c6f7086a-a789-4a9e-a81f-7afba9f5916e'
), (
'84708f68-4e22-4ef0-bb1c-7aad5f18da2a',
'8b8cefda-39e6-4fad-931a-0b702e0d8006',
'de66bf2e-0438-43bf-a792-eb2074229dd0'
);

select * from users 
select * from courses 
select * from users_courses 













