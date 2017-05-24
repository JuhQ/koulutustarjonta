--liquibase formatted sql

--changeset teemu.leivo:24
ALTER TABLE HAKUAIKA
DROP CONSTRAINT HAKUAIKA_R01;

ALTER TABLE HAKUKOHDE
DROP CONSTRAINT HAKUKOHDE_R01;

ALTER TABLE HAKUKOHDE_KOULUTUS
DROP CONSTRAINT HAKUKOHDE_KOULUTUS_R01;

ALTER TABLE HAKUKOHDE_KOULUTUS
DROP CONSTRAINT HAKUKOHDE_KOULUTUS_R02;

ALTER TABLE LIITE
DROP CONSTRAINT LIITE_R01;

ALTER TABLE VALINTAKOE
DROP CONSTRAINT VALINTAKOE_R01;

ALTER TABLE HAKUKELP
DROP CONSTRAINT HAKUKELP_R01;

ALTER TABLE HAKU_MUOKKAAJA
DROP CONSTRAINT FK_HM_HAKU;

ALTER TABLE KOULUTUS_OPETUSKIELI
DROP CONSTRAINT KOULUTUS_OPETUSKIELI_R01;

ALTER TABLE VALINTAKOE_AK
DROP CONSTRAINT VALINTAKOE_AK_R01;

ALTER TABLE KOULUTUS_SISALTYVYYS
DROP CONSTRAINT KOULUTUS_SISALTYVYYS_R01;

ALTER TABLE KOULUTUS_SISALTYVYYS
DROP CONSTRAINT KOULUTUS_SISALTYVYYS_R02;

ALTER TABLE KOULUTUS_YHTEYSTIETO
DROP CONSTRAINT FK_KOULUTUS_YHTEYSTIETO_ID;

--changeset teemu.leivo:24.1

ALTER TABLE HAKUAIKA ADD (
  CONSTRAINT HAKUAIKA_R01
  FOREIGN KEY (ID_HAKU)
  REFERENCES HAKU (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE HAKUKOHDE ADD (
  CONSTRAINT HAKUKOHDE_R01
  FOREIGN KEY (ID_HAKU)
  REFERENCES HAKU (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE HAKUKOHDE_KOULUTUS ADD (
  CONSTRAINT HAKUKOHDE_KOULUTUS_R01
  FOREIGN KEY (ID_KOULUTUS)
  REFERENCES KOULUTUS (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE HAKUKOHDE_KOULUTUS ADD (
  CONSTRAINT HAKUKOHDE_KOULUTUS_R02
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE LIITE ADD (
  CONSTRAINT LIITE_R01
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE VALINTAKOE ADD (
  CONSTRAINT VALINTAKOE_R01
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE HAKUKELP ADD (
  CONSTRAINT HAKUKELP_R01
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE HAKU_MUOKKAAJA ADD (
  CONSTRAINT FK_HM_HAKU
  FOREIGN KEY (ID_HAKU)
  REFERENCES HAKU (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_OPETUSKIELI ADD (
  CONSTRAINT KOULUTUS_OPETUSKIELI_R01
  FOREIGN KEY (ID_KOULUTUS)
  REFERENCES KOULUTUS (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE VALINTAKOE_AK ADD (
  CONSTRAINT VALINTAKOE_AK_R01
  FOREIGN KEY (ID_VALINTAKOE)
  REFERENCES VALINTAKOE (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_SISALTYVYYS ADD (
  CONSTRAINT KOULUTUS_SISALTYVYYS_R01
  FOREIGN KEY (ID_VANHEMPI)
  REFERENCES KOULUTUS (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_SISALTYVYYS ADD (
  CONSTRAINT KOULUTUS_SISALTYVYYS_R02
  FOREIGN KEY (ID_LAPSI)
  REFERENCES KOULUTUS (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_YHTEYSTIETO
  ADD (
  CONSTRAINT FK_KOULUTUS_YHTEYSTIETO_ID
  FOREIGN KEY (KOULUTUS_ID)
  REFERENCES KOULUTUS (ID)
  ON DELETE CASCADE
  ENABLE VALIDATE);

