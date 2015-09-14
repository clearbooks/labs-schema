CREATE TABLE `feedback` (
	`id` INT(128) NOT NULL AUTO_INCREMENT,
	`toggle_id` INT(128) NOT NULL,
	`mood` TINYINT(1) NOT NULL,
	`message` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	PRIMARY KEY (`id`),
	INDEX `FK_feedback_toggle` (`toggle_id`),
	CONSTRAINT `FK_feedback_toggle` FOREIGN KEY (`toggle_id`) REFERENCES `toggle` (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB;