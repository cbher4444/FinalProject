CREATE USER final IDENTIFIED BY final;
grant RESOURCE, CONNECT TO final;

GRANT CREATE JOB TO final; -- 계정영구삭제시 사용 - 추가함 by 동규 (2024.10.15)

