CREATE TABLE IF NOT EXISTS `toggle_marketing_information` (
	`toggle_id` INT(11) NOT NULL,
	`screenshot_urls` VARCHAR(128) NULL DEFAULT NULL,
	`description_of_toggle` TEXT NULL,
	`description_of_functionality` TEXT NULL,
	`description_of_implementation_reason` TEXT NULL,
	`description_of_location` TEXT NULL,
	`guide_url` VARCHAR(128) NULL DEFAULT NULL,
	`app_notification_copy_text` TEXT NULL,
	PRIMARY KEY (`toggle_id`),
	CONSTRAINT `FK_toggle_marketing_information_toggle` FOREIGN KEY (`toggle_id`) REFERENCES `toggle` (`id`)
)
COLLATE='utf8mb4_unicode_ci'
ENGINE=InnoDB;