CREATE DATABASE IF NOT EXISTS travel_db;
DROP TABLE IF EXISTS attractions;
USE travel_db;

CREATE TABLE attractions (
         no INT PRIMARY KEY,                  -- CSV의 번호 컬럼
         district VARCHAR(50) NOT NULL,       -- 지역
         title VARCHAR(100) NOT NULL,         -- 명소 제목
         description TEXT,                    -- 설명
         address VARCHAR(180),                -- 주소
         phone VARCHAR(100)                     -- 전화번호
);


