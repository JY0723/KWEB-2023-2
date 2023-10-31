CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(10) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(10) NOT NULL,
    `profile_img_link` VARCHAR(256) NOT NULL,
    `profile_message` VARCHAR(128) NOT NULL,
    `is_out` TINYINT(1) NOT NULL DEFAULT 0,
    `join_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL
    `maker` INT NOT NULL,
    `link` VARCHAR(256) NOT NULL,
    `limit_people` INT NOT NULL,
    `is_out` TINYINT(1) NOT NULL DEFAULT 0,
    `make_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`maker`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `message` TEXT NOT NULL,
    `maker` INT NOT NULL,
    `channel` INT NOT NULL,
    `make_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`maker`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocked` INT NOT NULL,
    `block` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`blocked`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`block`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY(`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;