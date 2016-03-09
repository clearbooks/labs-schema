ALTER TABLE `toggle` ADD `visible_without_release` TINYINT(1) NOT NULL DEFAULT '0' AFTER `release_id`;
ALTER TABLE `toggle` ADD INDEX( `type`, `visible`, `visible_without_release` );
