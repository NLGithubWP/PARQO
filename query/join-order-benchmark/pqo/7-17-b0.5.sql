
    SELECT MIN(n.name) AS of_person,
       MIN(t.title) AS biography_movie
    FROM aka_name AS an,
        cast_info AS ci,
        info_type AS it,
        link_type AS lt,
        movie_link AS ml,
        name AS n,
        person_info AS pi,
        title AS t
    WHERE an.name IS NOT NULL AND (an.name LIKE '%a%' OR an.name LIKE 'A%')
    AND it.info ='trivia'
    AND lt.link IN ('sequel', 'follows', 'followed by')
    AND n.name LIKE '%Bert%'
    AND pi.note ='Volker Boehm'
    AND t.production_year BETWEEN 2007 AND 2008
  AND t.title LIKE '%Kung%Fu%Panda%'
    AND n.id = an.person_id
    AND n.id = pi.person_id
    AND ci.person_id = n.id
    AND t.id = ci.movie_id
    AND ml.linked_movie_id = t.id
    AND lt.id = ml.link_type_id
    AND it.id = pi.info_type_id
    AND pi.person_id = an.person_id
    AND pi.person_id = ci.person_id
    AND an.person_id = ci.person_id
    AND ci.movie_id = ml.linked_movie_id;
    