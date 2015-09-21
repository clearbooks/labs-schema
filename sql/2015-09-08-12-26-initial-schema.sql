CREATE TABLE IF NOT EXISTS `release` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`info` VARCHAR(255) NOT NULL,
	`visibility` TINYINT(1) NOT NULL DEFAULT 1,
	`release_date` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `toggle` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(128) NOT NULL,
	`type` ENUM('simple','group') NOT NULL DEFAULT 'simple',
	`visible` TINYINT(1) NOT NULL DEFAULT '0',
	`release_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `name` (`name`),
	INDEX `type` (`type`),
	INDEX `visible` (`visible`),
	INDEX `release_id` (`release_id`),
	CONSTRAINT `FK_toggle_release` FOREIGN KEY (`release_id`) REFERENCES `release` (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `group_policy` (
  `group_id` VARCHAR(128) NOT NULL,
	`toggle_id` INT(11) NOT NULL,
	`active` TINYINT(1) NOT NULL,
	PRIMARY KEY (`group_id`, `toggle_id`),
	INDEX `active` (`active`),
	INDEX `FK_group_policy_toggle` (`toggle_id`),
	CONSTRAINT `FK_group_policy_toggle` FOREIGN KEY (`toggle_id`) REFERENCES `toggle` (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `user_policy` (
  `user_id` VARCHAR(128) NOT NULL,
	`toggle_id` INT(11) NOT NULL,
	`active` TINYINT(1) NOT NULL DEFAULT '1',
	PRIMARY KEY (`user_id`, `toggle_id`),
	INDEX `active` (`active`),
	INDEX `FK_user_policy_toggle` (`toggle_id`),
	CONSTRAINT `FK_user_policy_toggle` FOREIGN KEY (`toggle_id`) REFERENCES `toggle` (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB;