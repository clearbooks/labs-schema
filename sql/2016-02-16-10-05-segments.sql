CREATE TABLE IF NOT EXISTS `segment_policy` (
    `segment_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
    `toggle_id` int(11) NOT NULL,
    `active` bit(1) NOT NULL DEFAULT b'1',
    `locked` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `segment_policy`
    ADD PRIMARY KEY (`segment_id`,`toggle_id`),
    ADD KEY `FK_segment_policy_toggle` (`toggle_id`);

ALTER TABLE `segment_policy`
    ADD CONSTRAINT `FK_segment_policy_toggle` FOREIGN KEY (`toggle_id`) REFERENCES `toggle` (`id`);
