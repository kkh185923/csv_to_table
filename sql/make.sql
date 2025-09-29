CREATE DATABASE IF NOT EXISTS travel_db;
USE travel_db;

-- DROP TABLE IF EXISTS travels;
DROP TABLE IF EXISTS travels, users, likes, comments;

CREATE TABLE travels (
                         no BIGINT PRIMARY KEY,                -- CSV의 번호 컬럼
                         district VARCHAR(50) NOT NULL,       -- 지역
                         title VARCHAR(100) NOT NULL,         -- 명소 제목
                         description TEXT,                    -- 설명
                         address VARCHAR(180),                -- 주소
                         phone VARCHAR(100),               -- 전화번호
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 변경일자
);

CREATE TABLE users (
                       user_id char(10) PRIMARY KEY,        -- 사용자 아이디 (길이 제한 10)
                       role char(8) NOT NULL,               -- 사용자 역할 ('admin' / 'general')
                       name VARCHAR(30) NOT NULL,           -- 사용자 이름
                       password VARCHAR(30) NOT NULL,       -- 사용자 비밀번호
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- 변경일자

);

CREATE TABLE LIKES (
                       seq	BIGINT AUTO_INCREMENT PRIMARY KEY,
                       user_id	CHAR(10)	NOT NULL,
                       no	BIGINT,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 변경일자
                       FOREIGN KEY (user_id) REFERENCES users(user_id),
                       FOREIGN KEY (no) REFERENCES travels(no)
);


CREATE TABLE COMMENTS (
                          seq	BIGINT AUTO_INCREMENT PRIMARY KEY,  -- 댓글 일련번호
                          no	BIGINT,                              -- CVS 일련번호
                          user_id	char(10) NOT NULL,               -- 사용자 아이디
                          content	VARCHAR(1000) NOT NULL,           -- 댓글 내용
                          created_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 생성일자
                          updated_at	TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 변경일자
                          FOREIGN KEY (user_id) REFERENCES users(user_id),
                          FOREIGN KEY (no) REFERENCES travels(no)
);