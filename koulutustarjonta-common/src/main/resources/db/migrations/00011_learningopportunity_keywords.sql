--liquibase formatted sql

--changeset ian:11

CREATE TABLE AIHEET (
  ID_KOULUTUS    VARCHAR2(300 CHAR),
  NIMI_FI        VARCHAR2(300 CHAR),
  NIMI_SV        VARCHAR2(300 CHAR),
  NIMI_EN        VARCHAR2(300 CHAR)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING;
