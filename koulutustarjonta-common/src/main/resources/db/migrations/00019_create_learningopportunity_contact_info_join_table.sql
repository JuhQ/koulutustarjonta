--liquibase formatted sql

--changeset jonimake:19

-- ugly naming but.. oh well
CREATE TABLE KOULUTUS_YHTEYSTIETO_JOIN (
  ID_KOULUTUS VARCHAR2(300 CHAR),
  ID_KOULUTUS_YHTEYSTIETO NUMBER,

  CONSTRAINT FK_KOULUTUS_YHTEYSTIETO_JOIN
  FOREIGN KEY (ID_KOULUTUS_YHTEYSTIETO)
  REFERENCES KOULUTUS_YHTEYSTIETO (ID),

  CONSTRAINT FK_KOULUTUS_JOIN
  FOREIGN KEY (ID_KOULUTUS)
  REFERENCES KOULUTUS (ID)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING;

-- changeset jonimake:19.1
-- roll back the join table stuff and just use koulutus_id
DROP TABLE KOULUTUS_YHTEYSTIETO_JOIN;
ALTER TABLE KOULUTUS_YHTEYSTIETO
ADD (KOULUTUS_ID VARCHAR2 (300 CHAR));

-- changeset jonimake:19.2
-- foreign key ref
ALTER TABLE KOULUTUS_YHTEYSTIETO ADD (
CONSTRAINT FK_KOULUTUS_YHTEYSTIETO_ID
FOREIGN KEY (KOULUTUS_ID) REFERENCES KOULUTUS (ID)
ENABLE VALIDATE);
