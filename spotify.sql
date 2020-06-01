CREATE TABLE `user_role` (
  `user_role_id` INT PRIMARY KEY NOT NULL,
  `user_role_name` VARCHAR(45)
);

CREATE TABLE `ads` (
  `ads_id` INT PRIMARY KEY NOT NULL,
  `ads_frecuency` INT
);

CREATE TABLE `account_type` (
  `account_type_id` INT PRIMARY KEY NOT NULL,
  `account_type_name` VARCHAR(45),
  `ads_id` INT
);

CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY NOT NULL,
  `user_name` VARCHAR(10),
  `e-mail` VARCHAR(25),
  `password` VARCHAR(15),
  `first_name` VARCHAR(45),
  `last_name` VARCHAR(45),
  `birthdate` DATE,
  `country` VARCHAR(15),
  `user_role_id` INT,
  `account_type_id` INT
);

CREATE TABLE `artist` (
  `artist_id` INT PRIMARY KEY NOT NULL,
  `name` VARCHAR(25),
  `followers` INT
);

CREATE TABLE `playlists` (
  `playlist_id` INT PRIMARY KEY NOT NULL,
  `name` VARCHAR(15),
  `user_id` INT
);

CREATE TABLE `genres` (
  `genre_id` INT PRIMARY KEY NOT NULL,
  `name` VARCHAR(15)
);

CREATE TABLE `albums` (
  `album_id` INT PRIMARY KEY NOT NULL,
  `title` VARCHAR(45),
  `year` VARCHAR(45),
  `artist_id` INT
);

CREATE TABLE `tracks` (
  `track_id` INT PRIMARY KEY NOT NULL,
  `title` VARCHAR(15),
  `album_id` INT,
  `genre_id` INT,
  `track_type` VARCHAR(45)
);

CREATE TABLE `playlist_track` (
  `playlist_id` INT NOT NULL,
  `track_id` INT NOT NULL,
  PRIMARY KEY (`track_id`, `playlist_id`)
);

CREATE TABLE `payment` (
  `payment_id` INT PRIMARY KEY NOT NULL,
  `user_id` INT,
  `payment_token` VARCHAR(45)
);

CREATE TABLE `favorite_tracks` (
  `favorite_id` INT PRIMARY KEY NOT NULL,
  `user_id` INT
);

CREATE TABLE `favorites_tracks_list` (
  `track_id` INT NOT NULL,
  `favorite_id` INT NOT NULL,
  PRIMARY KEY (`track_id`, `favorite_id`)
);

CREATE TABLE `log` (
  `log_id` INT PRIMARY KEY NOT NULL,
  `login_time` TIMESTAMP(2),
  `logout_time` TIMESTAMP(2),
  `user_id` INT
);

CREATE TABLE `played_tracks` (
  `track_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`track_id`, `user_id`)
);

ALTER TABLE `account_type` ADD FOREIGN KEY (`ads_id`) REFERENCES `ads` (`ads_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `user` ADD FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `user` ADD FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`account_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `playlists` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `albums` ADD FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `tracks` ADD FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `tracks` ADD FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `playlist_track` ADD FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `playlist_track` ADD FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `payment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `favorite_tracks` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `favorites_tracks_list` ADD FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `favorites_tracks_list` ADD FOREIGN KEY (`favorite_id`) REFERENCES `favorite_tracks` (`favorite_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `log` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `played_tracks` ADD FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `played_tracks` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `ads_id_idx` ON `account_type` (`ads_id`);

CREATE INDEX `user_role_id_idx` ON `user` (`user_role_id`);

CREATE INDEX `account_type_id_idx` ON `user` (`account_type_id`);

CREATE INDEX `user_id_idx` ON `playlists` (`user_id`);

CREATE INDEX `artist_id_idx` ON `albums` (`artist_id`);

CREATE INDEX `genre_id_idx` ON `tracks` (`genre_id`);

CREATE INDEX `album_id_idx` ON `tracks` (`album_id`);

CREATE INDEX `track_id_idx` ON `playlist_track` (`track_id`);

CREATE INDEX `user_id_idx` ON `payment` (`user_id`);

CREATE INDEX `user_id_idx` ON `favorite_tracks` (`user_id`);

CREATE INDEX `favorite_id_idx` ON `favorites_tracks_list` (`favorite_id`);

CREATE INDEX `user_id_idx` ON `log` (`user_id`);

CREATE INDEX `user_id_idx` ON `played_tracks` (`user_id`);
