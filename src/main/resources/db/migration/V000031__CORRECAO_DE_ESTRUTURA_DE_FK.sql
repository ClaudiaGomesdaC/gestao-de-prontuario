ALTER TABLE `VISITA_EVENTO` DROP FOREIGN KEY `fk_VISITA_VISITA`;
ALTER TABLE `VISITA_EVENTO` ADD INDEX `fk_VISITA_VISITA_idx`
(
   `ID_VISITA` ASC
),
DROP INDEX `fk_VISITA_VISITA_idx`;
ALTER TABLE `VISITA_EVENTO` ADD CONSTRAINT `fk_VISITA_VISITA` FOREIGN KEY (`ID_VISITA`) REFERENCES `VISITA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `VISITA_EVENTO` DROP FOREIGN KEY `fk_VISITA_VISITA`;
ALTER TABLE `VISITA_EVENTO` ADD CONSTRAINT `fk_VISITA_EVENTO_VISITA` FOREIGN KEY (`ID_VISITA`) REFERENCES `VISITA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;