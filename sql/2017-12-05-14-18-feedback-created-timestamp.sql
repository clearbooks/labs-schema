ALTER TABLE `feedback` ADD `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `group_id`;