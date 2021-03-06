ALTER TABLE `RESPONSAVEL` DROP COLUMN `NOME`,
CHANGE COLUMN `USUARIO` `ID_PESSOA` BIGINT (20) NOT NULL;
ALTER TABLE `RESPONSAVEL` ADD INDEX `FK_RESPONSAVEL_PESSOA_idx`
(
   `ID_PESSOA` ASC
);
ALTER TABLE `RESPONSAVEL` ADD CONSTRAINT `FK_RESPONSAVEL_PESSOA` FOREIGN KEY (`ID_PESSOA`) REFERENCES `PESSOA_FISICA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `TELEFONE` DROP FOREIGN KEY `FK_TELEFONE_PACIENTE`;
ALTER TABLE `TELEFONE` CHANGE COLUMN `ID_PACIENTE` `ID_PESSOA` BIGINT (20) NOT NULL,
ADD INDEX `FK_TELEFONE_PESSOA_idx`
(
   `ID_PESSOA` ASC
),
DROP PRIMARY KEY;
ALTER TABLE `TELEFONE` ADD CONSTRAINT `FK_TELEFONE_PESSOA` FOREIGN KEY (`ID_PESSOA`) REFERENCES `PESSOA_FISICA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `USUARIO` DROP COLUMN `NOME_MAE`,
DROP COLUMN `DATA_NASCIMENTO`,
ADD COLUMN `ID_PESSOA` BIGINT (20) NOT NULL AFTER `ATIVO`;
ALTER TABLE `USUARIO` ADD CONSTRAINT `FK_USUARIO_PESSOA` FOREIGN KEY (`ID`) REFERENCES `PESSOA_FISICA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
INSERT INTO `PESSOA_FISICA`
(
   `ID`,
   `NOME`,
   `SOBRENOME`,
   `RG`,
   `CPF`,
   `DATA_NASCIMENTO`,
   `NOME_COMP_PAI`,
   `NOME_COMP_MAE`,
   `SEXO`
)
VALUES
(
   '1',
   'Administrador',
   'Principal',
   '0000000',
   '11122233396',
   sysdate(),
   'Não possui',
   'Não Possui',
   'T'
);
INSERT INTO `USUARIO` VALUES
(
   1,
   'ADMIN',
   'admin@admin.com',
   '$2a$10$XIMO9M5wVNb236vYW2N2hO3mgbWcjBE4sL5MyBLEqsnUKrY2sYKXS',
   1,
   1
);