DROP DATABASE IF EXISTS 'filmedin';

CREATE DATABASE 'filmedin';

USE 'filmedin';

DROP TABLE IF EXISTS 'user';
    
CREATE TABLE 'user' (
  'id' INTEGER NOT NULL AUTO_INCREMENT,
  'username' VARCHAR(255) NOT NULL,
  'password' MEDIUMTEXT NOT NULL,
  'createdAt' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ('id')
);

-- ---
-- Table 'profile'
-- 
-- ---

DROP TABLE IF EXISTS 'profile';
    
CREATE TABLE 'profile' (
  'id' INTEGER NOT NULL AUTO_INCREMENT,
  'userID' INTEGER NOT NULL,
  'firstName' VARCHAR(20) NOT NULL,
  'lastName' VARCHAR(25) NULL,
  'DOB' DATE NOT NULL,
  'createdAt' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ('id')
);

-- ---
-- Table 'movie'
-- 
-- ---

DROP TABLE IF EXISTS 'movie';
    
CREATE TABLE 'movie' (
  'id' INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  'name' VARCHAR(255) NOT NULL,
  'releaseDate' DATE NOT NULL,
  'director' VARCHAR(255) NOT NULL,
  'actor1' VARCHAR(255) NOT NULL,
  'actor2' VARCHAR(255) NOT NULL,
  'actor3' VARCHAR(255) NOT NULL,
  'actor4' VARCHAR(255) NOT NULL,
  'posterURL' VARCHAR(511) NOT NULL,
  'runtime' VARCHAR(50) NOT NULL,
  'genre' VARCHAR(255) NOT NULL,
  'createdAt' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ('id')
);

-- ---
-- Table 'rating'
-- 
-- ---

DROP TABLE IF EXISTS 'rating';
    
CREATE TABLE 'rating' (
  'id' INTEGER NOT NULL AUTO_INCREMENT,
  'profileID' INTEGER NOT NULL,
  'movieID' INTEGER NOT NULL DEFAULT NULL,
  'rating' INTEGER NOT NULL DEFAULT 0,
  'comment' MEDIUMTEXT(200) NULL DEFAULT NULL,
  'createdAt' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ('id')
);

-- ---
-- Table 'friends'
-- 
-- ---

DROP TABLE IF EXISTS 'friends';
    
CREATE TABLE 'friends' (
  'id' INTEGER NOT NULL AUTO_INCREMENT,
  'primaryID' INTEGER NOT NULL,
  'friendID' INTEGER NOT NULL,
  'createdAt' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ('id')
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE 'profile' ADD FOREIGN KEY (userID) REFERENCES 'user' ('id');
ALTER TABLE 'rating' ADD FOREIGN KEY (profileID) REFERENCES 'profile' ('id');
ALTER TABLE 'rating' ADD FOREIGN KEY (movieID) REFERENCES 'movie' ('id');
ALTER TABLE 'friends' ADD FOREIGN KEY (primaryID) REFERENCES 'profile' ('id');
ALTER TABLE 'friends' ADD FOREIGN KEY (friendID) REFERENCES 'profile' ('id');