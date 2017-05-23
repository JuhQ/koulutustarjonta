--liquibase formatted sql

--changeset hannu:1
CREATE TABLE HAKU
(
  ID                        VARCHAR2(300 CHAR),
  NIMI_FI                   VARCHAR2(255 CHAR),
  NIMI_EN                   VARCHAR2(255 CHAR),
  NIMI_SV                   VARCHAR2(255 CHAR),
  HAKUTAPA_FI               VARCHAR2(100 CHAR),
  HAKUTAPA_SV               VARCHAR2(100 CHAR),
  HAKUTAPA_EN               VARCHAR2(100 CHAR),
  HAKUKAUSI_VUOSI           INTEGER,
  HAKUKAUSI_ARVO            VARCHAR2(1 CHAR),
  HAKUKAUSI_FI              VARCHAR2(30 CHAR),
  HAKUKAUSI_SV              VARCHAR2(30 CHAR),
  HAKUKAUSI_EN              VARCHAR2(30 CHAR),
  KOUL_ALK_VUOSI            INTEGER,
  KOUL_ALK_KAUSI_ARVO       VARCHAR2(1 CHAR),
  KOUL_ALK_KAUSI_FI         VARCHAR2(30 CHAR),
  KOUL_ALK_KAUSI_SV         VARCHAR2(30 CHAR),
  KOUL_ALK_KAUSI_EN         VARCHAR2(30 CHAR),
  JARJ_HAKULOMAKE           NUMBER(1),
  HAKULOMAKE_URL            VARCHAR2(200 CHAR)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE HAKUAIKA
(
  ID                VARCHAR2(300 CHAR),
  ID_HAKU           VARCHAR2(300 CHAR),
  NIMI_FI           VARCHAR2(500 CHAR),
  NIMI_SV           VARCHAR2(500 CHAR),
  NIMI_EN           VARCHAR2(500 CHAR),
  ALKAA             DATE,
  LOPPUU            DATE
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE HAKUKOHDE
(
  ID             VARCHAR2(300 CHAR),
  ID_HAKU        VARCHAR2(300 CHAR),
  NIMI_FI        VARCHAR2(500 CHAR),
  NIMI_EN        VARCHAR2(500 CHAR),
  NIMI_SV        VARCHAR2(500 CHAR),
  ALOITUSPAIKAT  INTEGER,
  SORAKUVAUS_FI  CLOB,
  SORAKUVAUS_EN  CLOB,
  SORAKUVAUS_SV  CLOB,
  LISATIEDOT_FI  CLOB,
  LISATIEDOT_EN  CLOB,
  LISATIEDOT_SV  CLOB,
  VALINTAPER_FI  CLOB,
  VALINTAPER_EN  CLOB,
  VALINTAPER_SV  CLOB,
  HAKUKELP_KUVAUS_FI    CLOB,
  HAKUKELP_KUVAUS_EN    CLOB,
  HAKUKELP_KUVAUS_SV    CLOB
)
LOB (SORAKUVAUS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SORAKUVAUS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SORAKUVAUS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (LISATIEDOT_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (LISATIEDOT_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VALINTAPER_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VALINTAPER_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VALINTAPER_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (HAKUKELP_KUVAUS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (HAKUKELP_KUVAUS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (HAKUKELP_KUVAUS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (LISATIEDOT_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE HAKUKOHDE_KOULUTUS
(
  ID_KOULUTUS   VARCHAR2(300 CHAR),
  ID_HAKUKOHDE  VARCHAR2(300 CHAR)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

CREATE TABLE HAKU_MUOKKAAJA
(
  ID_HAKU          VARCHAR2(300 CHAR),
  ID_ORGANISAATIO  VARCHAR2(300 CHAR)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE KOULUTUS
(
  ID                 VARCHAR2(300 CHAR),
  KOULUTUSKOODI_FI   VARCHAR2(500 CHAR),
  KOULUTUSKOODI_EN   VARCHAR2(500 CHAR),
  KOULUTUSKOODI_SV   VARCHAR2(500 CHAR),
  KOULUTUSASTE_FI    VARCHAR2(500 CHAR),
  KOULUTUSASTE_EN    VARCHAR2(500 CHAR),
  KOULUTUSASTE_SV    VARCHAR2(500 CHAR),
  KOULUTUSALA_FI     VARCHAR2(500 CHAR),
  KOULUTUSALA_EN     VARCHAR2(500 CHAR),
  KOULUTUSALA_SV     VARCHAR2(500 CHAR),
  OPINTOALA_FI       VARCHAR2(500 CHAR),
  OPINTOALA_EN       VARCHAR2(500 CHAR),
  OPINTOALA_SV       VARCHAR2(500 CHAR),
  TUTKINTOOHJELMA_FI VARCHAR2(500 CHAR),
  TUTKINTOOHJELMA_EN VARCHAR2(500 CHAR),
  TUTKINTOOHJELMA_SV VARCHAR2(500 CHAR),
  TASO_FI            VARCHAR2(500 CHAR),
  TASO_EN            VARCHAR2(500 CHAR),
  TASO_SV            VARCHAR2(500 CHAR),
  KOMOOID            VARCHAR2(300 CHAR),
  ID_ORGANISAATIO    VARCHAR2(200 CHAR),
  ORGANISAATIO_NIMI  VARCHAR2(700 CHAR),
  NIMI_FI            VARCHAR2(500 CHAR),
  NIMI_EN            VARCHAR2(500 CHAR),
  NIMI_SV            VARCHAR2(500 CHAR),
  RAKENNE_FI         CLOB,
  RAKENNE_EN         CLOB,
  RAKENNE_SV         CLOB,
  MAHDOLLISUUDET_FI  CLOB,
  MAHDOLLISUUDET_EN  CLOB,
  MAHDOLLISUUDET_SV  CLOB,
  TAVOITTEET_FI      CLOB,
  TAVOITTEET_EN      CLOB,
  TAVOITTEET_SV      CLOB,
  SISALTO_FI         CLOB,
  SISALTO_EN         CLOB,
  SISALTO_SV         CLOB,
  TUTKPAINO_FI       CLOB,
  TUTKPAINO_EN       CLOB,
  TUTKPAINO_SV       CLOB,
  YHTEISTYO_FI       CLOB,
  YHTEISTYO_EN       CLOB,
  YHTEISTYO_SV       CLOB,
  OPINNAYTETYO_FI    CLOB,
  OPINNAYTETYO_EN    CLOB,
  OPINNAYTETYO_SV    CLOB,
  PAAAINEVAL_FI      CLOB,
  PAAAINEVAL_EN      CLOB,
  PAAAINEVAL_SV      CLOB,
  LISAT_OPKIEL_FI    CLOB,
  LISAT_OPKIEL_EN    CLOB,
  LISAT_OPKIEL_SV    CLOB,
  SIJTYO_FI          CLOB,
  SIJTYO_EN          CLOB,
  SIJTYO_SV          CLOB,
  KANSVAL_FI         CLOB,
  KANSVAL_EN         CLOB,
  KANSVAL_SV         CLOB,
  PATEVYYS_FI        CLOB,
  PATEVYYS_EN        CLOB,
  PATEVYYS_SV        CLOB,
  SUUNNI_KESTO       INTEGER,
  SUUNNI_TYYPPI_FI   VARCHAR2(30 CHAR),
  SUUNNI_TYYPPI_EN   VARCHAR2(30 CHAR),
  SUUNNI_TYYPPI_SV   VARCHAR2(30 CHAR),
  ALKAMISKAUSI_FI    VARCHAR2(300 CHAR),
  ALKAMISKAUSI_SV    VARCHAR2(300 CHAR),
  ALKAMISKAUSI_EN    VARCHAR2(300 CHAR),
  ALKAMISVUOSI       INTEGER,
  LAAJUUS            INTEGER,
  LAAJUUS_TYYPPI_FI  VARCHAR2(30 CHAR),
  LAAJUUS_TYYPPI_SV  VARCHAR2(30 CHAR),
  LAAJUUS_TYYPPI_EN  VARCHAR2(30 CHAR),
  TUTKINTONIMIKE_FI  VARCHAR2(500 CHAR),
  TUTKINTONIMIKE_EN  VARCHAR2(500 CHAR),
  TUTKINTONIMIKE_SV  VARCHAR2(500 CHAR)
)
LOB (RAKENNE_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (RAKENNE_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (RAKENNE_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (MAHDOLLISUUDET_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (MAHDOLLISUUDET_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (MAHDOLLISUUDET_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TAVOITTEET_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TAVOITTEET_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TAVOITTEET_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SISALTO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SISALTO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SISALTO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TUTKPAINO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TUTKPAINO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TUTKPAINO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (YHTEISTYO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (YHTEISTYO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (YHTEISTYO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPINNAYTETYO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPINNAYTETYO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPINNAYTETYO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (PAAAINEVAL_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (PAAAINEVAL_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (PAAAINEVAL_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (LISAT_OPKIEL_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (LISAT_OPKIEL_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (LISAT_OPKIEL_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SIJTYO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SIJTYO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SIJTYO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KANSVAL_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KANSVAL_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KANSVAL_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (PATEVYYS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (PATEVYYS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (PATEVYYS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE KOULUTUS_OPETUSKIELI
(
  ID_KOULUTUS     VARCHAR2(300 CHAR),
  ID_OPETUSKIELI  VARCHAR2(2 CHAR)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

CREATE TABLE LIITE
(
  ID            VARCHAR2(300 CHAR),
  ID_HAKUKOHDE  VARCHAR2(300 CHAR),
  KIELI         VARCHAR2(2 CHAR),
  NIMI          VARCHAR2(500 CHAR),
  ERAPAIVA      DATE,
  KUVAUS        CLOB,
  OSOITE        VARCHAR2(500 CHAR),
  POSTINUMERO   VARCHAR2(500 CHAR),
  PTOIMIPAIKKA  VARCHAR2(500 CHAR)
)
LOB (KUVAUS) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE OPETUSKIELI
(
  ID   VARCHAR2(2 CHAR),
  KIELI   VARCHAR2(2 CHAR),
  SELITE_FI  VARCHAR2(255 CHAR),
  SELITE_SV  VARCHAR2(255 CHAR),
  SELITE_EN  VARCHAR2(255 CHAR)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE ORGANISAATIO
(
  ID                   VARCHAR2(300 CHAR),
  NIMI_FI              VARCHAR2(255 CHAR),
  NIMI_EN              VARCHAR2(255 CHAR),
  NIMI_SV              VARCHAR2(255 CHAR),
  KUSTANNUKSET_FI      CLOB,
  KUSTANNUKSET_EN      CLOB,
  KUSTANNUKSET_SV      CLOB,
  KV_KOULOHJ_FI        CLOB,
  KV_KOULOHJ_EN        CLOB,
  KV_KOULOHJ_SV        CLOB,
  OPLIIKKUVUUS_FI      CLOB,
  OPLIIKKUVUUS_EN      CLOB,
  OPLIIKKUVUUS_SV      CLOB,
  OPPIMISYMPARISTO_FI  CLOB,
  OPPIMISYMPARISTO_EN  CLOB,
  OPPIMISYMPARISTO_SV  CLOB,
  YLEISKUVAUS_FI       CLOB,
  YLEISKUVAUS_EN       CLOB,
  YLEISKUVAUS_SV       CLOB,
  SAAVUTETTAVUUS_FI    CLOB,
  SAAVUTETTAVUUS_SV    CLOB,
  SAAVUTETTAVUUS_EN    CLOB,
  VUOSIKELLO_FI        CLOB,
  VUOSIKELLO_SV        CLOB,
  VUOSIKELLO_EN        CLOB,
  VASTUUHENKILOT_FI    CLOB,
  VASTUUHENKILOT_SV    CLOB,
  VASTUUHENKILOT_EN    CLOB,
  VALINTAMENETTELY_FI  CLOB,
  VALINTAMENETTELY_SV  CLOB,
  VALINTAMENETTELY_EN  CLOB,
  AIK_KOKEMUS_FI       CLOB,
  AIK_KOKEMUS_SV       CLOB,
  AIK_KOKEMUS_EN       CLOB,
  KIELIOPINNOT_FI      CLOB,
  KIELIOPINNOT_SV      CLOB,
  KIELIOPINNOT_EN      CLOB,
  TYOHARJOITTELU_FI    CLOB,
  TYOHARJOITTELU_SV    CLOB,
  TYOHARJOITTELU_EN    CLOB,
  FACEBOOK_FI          VARCHAR2(255 CHAR),
  FACEBOOK_SV          VARCHAR2(255 CHAR),
  FACEBOOK_EN          VARCHAR2(255 CHAR),
  TWITTER_FI           VARCHAR2(255 CHAR),
  TWITTER_SV           VARCHAR2(255 CHAR),
  TWITTER_EN           VARCHAR2(255 CHAR),
  GOOGLE_PLUS_FI       VARCHAR2(255 CHAR),
  GOOGLE_PLUS_SV       VARCHAR2(255 CHAR),
  GOOGLE_PLUS_EN       VARCHAR2(255 CHAR),
  LINKEDIN_FI          VARCHAR2(255 CHAR),
  LINKEDIN_SV          VARCHAR2(255 CHAR),
  LINKEDIN_EN          VARCHAR2(255 CHAR)
)
LOB (KV_KOULOHJ_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KV_KOULOHJ_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KV_KOULOHJ_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPLIIKKUVUUS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KUSTANNUKSET_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KUSTANNUKSET_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KUSTANNUKSET_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPLIIKKUVUUS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (YLEISKUVAUS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (YLEISKUVAUS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPLIIKKUVUUS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPPIMISYMPARISTO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPPIMISYMPARISTO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (OPPIMISYMPARISTO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (YLEISKUVAUS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SAAVUTETTAVUUS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SAAVUTETTAVUUS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (SAAVUTETTAVUUS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VUOSIKELLO_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VUOSIKELLO_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VUOSIKELLO_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VASTUUHENKILOT_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VASTUUHENKILOT_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VASTUUHENKILOT_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VALINTAMENETTELY_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VALINTAMENETTELY_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (VALINTAMENETTELY_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (AIK_KOKEMUS_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (AIK_KOKEMUS_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (AIK_KOKEMUS_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KIELIOPINNOT_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KIELIOPINNOT_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (KIELIOPINNOT_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TYOHARJOITTELU_FI) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TYOHARJOITTELU_SV) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOB (TYOHARJOITTELU_EN) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;



CREATE TABLE SOME
(
  ID           VARCHAR2(300 CHAR),
  KIELI        VARCHAR2(2 CHAR),
  FACEBOOK     VARCHAR2(255 CHAR),
  GOOGLE_PLUS  VARCHAR2(255 CHAR),
  TWITTER      VARCHAR2(255 CHAR),
  LINKEDIN     VARCHAR2(255 CHAR)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE YHTEYSTIETO
(
  ID                       VARCHAR2(300 CHAR),
  TYYPPI                   VARCHAR2(30 CHAR),
  KIELI                    VARCHAR2(2 CHAR),
  WWW                      VARCHAR2(255 CHAR),
  PUHELIN                  VARCHAR2(255 CHAR),
  EMAIL                    VARCHAR2(255 CHAR),
  FAX                      VARCHAR2(255 CHAR),
  KAYNTI_OSOITE            VARCHAR2(255 CHAR),
  KAYNTI_POSTINUMERO       VARCHAR2(255 CHAR),
  KAYNTI_POSTITOIMIPAIKKA  VARCHAR2(255 CHAR),
  POSTI_OSOITE             VARCHAR2(255 CHAR),
  POSTI_POSTINUMERO        VARCHAR2(255 CHAR),
  POSTI_POSTITOIMIPAIKKA   VARCHAR2(255 CHAR),
  ID_ORGANISAATIO          VARCHAR2(300 CHAR)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE VALINTAKOE
(
  ID            VARCHAR2(300 CHAR),
  ID_HAKUKOHDE  VARCHAR2(300 CHAR),
  KIELI         VARCHAR2(2 CHAR),
  TYYPPI        VARCHAR2(255 CHAR),
  KUVAUS        CLOB
)
LOB (KUVAUS) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE TABLE VALINTAKOE_AK
(
  ID             VARCHAR2(300 CHAR),
  ID_VALINTAKOE  VARCHAR2(300 CHAR),
  ALKAA          DATE,
  LOPPUU         DATE,
  KUVAUS         CLOB,
  OSOITE         VARCHAR2(500 CHAR),
  POSTINUMERO    VARCHAR2(500 CHAR),
  PTOIMIPAIKKA   VARCHAR2(500 CHAR)
)
LOB (KUVAUS) STORE AS (
  TABLESPACE  USERS
  ENABLE      STORAGE IN ROW
  CHUNK       8192
  RETENTION
  NOCACHE
  LOGGING)
LOGGING
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

CREATE TABLE HAKUKELP
(
  ID                INTEGER,
  ID_HAKUKOHDE      VARCHAR2(300 CHAR),
  KUVAUS_FI         VARCHAR2(300 CHAR),
  KUVAUS_SV         VARCHAR2(300 CHAR),
  KUVAUS_EN         VARCHAR2(300 CHAR)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING;

CREATE TABLE KOULUTUS_SISALTYVYYS
(
  ID_VANHEMPI       VARCHAR2(300 CHAR),
  ID_LAPSI          VARCHAR2(300 CHAR)
)
LOGGING
NOCOMPRESS
NOCACHE
NOPARALLEL
MONITORING;




CREATE UNIQUE INDEX PK_HAKU ON HAKU
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PK_YHTEYSTIETO ON YHTEYSTIETO
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PK_HAKUKOHDE ON HAKUKOHDE
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PK_KOULUTUS ON KOULUTUS
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX KOULUTUS_OPETUSKIELI_PK ON KOULUTUS_OPETUSKIELI
(ID_OPETUSKIELI, ID_KOULUTUS)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PK_LIITE ON LIITE
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX UQ_OPETUSKIELI ON OPETUSKIELI
(KIELI, ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX OPETUSKIELI_PK ON OPETUSKIELI
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX ID_ORGANISAATIO ON ORGANISAATIO
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX UQ_SOME ON SOME
(KIELI, ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX SOME_PK ON SOME
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX PK_VALINTAKOE ON VALINTAKOE
(ID)
LOGGING
NOPARALLEL;


CREATE UNIQUE INDEX ID_VALKOE_AK ON VALINTAKOE_AK
(ID)
LOGGING
NOPARALLEL;

CREATE UNIQUE INDEX PK_HAKUKELP ON HAKUKELP
(ID)
LOGGING
NOPARALLEL;

CREATE UNIQUE INDEX PK_HAKUAIKA ON HAKUAIKA
(ID)
LOGGING
NOPARALLEL;

CREATE UNIQUE INDEX KOULUTUS_SISALTYVYYS_PK ON KOULUTUS_SISALTYVYYS
(ID_VANHEMPI, ID_LAPSI)
LOGGING
NOPARALLEL;


ALTER TABLE HAKU ADD (
  CONSTRAINT PK_HAKU
  PRIMARY KEY
  (ID)
  USING INDEX PK_HAKU
  ENABLE VALIDATE);


ALTER TABLE HAKUAIKA ADD (
  CONSTRAINT PK_HAKUAIKA
  PRIMARY KEY
  (ID)
  USING INDEX PK_HAKUAIKA
  ENABLE VALIDATE);


ALTER TABLE HAKUKOHDE ADD (
  CONSTRAINT PK_HAKUKOHDE
  PRIMARY KEY
  (ID)
  USING INDEX PK_HAKUKOHDE
  ENABLE VALIDATE);


ALTER TABLE KOULUTUS ADD (
  CONSTRAINT PK_KOULUTUS
  PRIMARY KEY
  (ID)
  USING INDEX PK_KOULUTUS
  ENABLE VALIDATE);


ALTER TABLE KOULUTUS_OPETUSKIELI ADD (
  CONSTRAINT KOULUTUS_OPETUSKIELI_PK
  PRIMARY KEY
  (ID_OPETUSKIELI, ID_KOULUTUS)
  USING INDEX KOULUTUS_OPETUSKIELI_PK
  ENABLE VALIDATE);


ALTER TABLE LIITE ADD (
  CONSTRAINT PK_LIITE
  PRIMARY KEY
  (ID)
  USING INDEX PK_LIITE
  ENABLE VALIDATE);


ALTER TABLE OPETUSKIELI ADD (
  CONSTRAINT OPETUSKIELI_PK
  PRIMARY KEY
  (ID)
  USING INDEX OPETUSKIELI_PK
  ENABLE VALIDATE);


ALTER TABLE OPETUSKIELI ADD (
  CONSTRAINT UQ_OPETUSKIELI
  UNIQUE (KIELI, ID)
  USING INDEX UQ_OPETUSKIELI
  ENABLE VALIDATE);


ALTER TABLE ORGANISAATIO ADD (
  CONSTRAINT ID_ORGANISAATIO
  PRIMARY KEY
  (ID)
  USING INDEX ID_ORGANISAATIO
  ENABLE VALIDATE);


ALTER TABLE YHTEYSTIETO ADD (
  CONSTRAINT PK_YHTEYSTIETO
  PRIMARY KEY
  (ID)
  USING INDEX PK_YHTEYSTIETO
  ENABLE VALIDATE);


ALTER TABLE VALINTAKOE ADD (
  CONSTRAINT PK_VALINTAKOE
  PRIMARY KEY
  (ID)
  USING INDEX PK_VALINTAKOE
  ENABLE VALIDATE);


ALTER TABLE VALINTAKOE_AK ADD (
  CONSTRAINT ID_VALKOE_AK
  PRIMARY KEY
  (ID)
  USING INDEX ID_VALKOE_AK
  ENABLE VALIDATE);


ALTER TABLE HAKUKELP ADD (
  CONSTRAINT PK_HAKUKELP
  PRIMARY KEY
  (ID)
  USING INDEX PK_HAKUKELP
  ENABLE VALIDATE);


ALTER TABLE HAKUAIKA ADD (
  CONSTRAINT HAKUAIKA_R01 
  FOREIGN KEY (ID_HAKU) 
  REFERENCES HAKU (ID)
  ENABLE VALIDATE);


ALTER TABLE HAKUKOHDE ADD (
  CONSTRAINT HAKUKOHDE_R01 
  FOREIGN KEY (ID_HAKU) 
  REFERENCES HAKU (ID)
  ENABLE VALIDATE);


ALTER TABLE HAKUKOHDE_KOULUTUS ADD (
  CONSTRAINT HAKUKOHDE_KOULUTUS_R01 
  FOREIGN KEY (ID_KOULUTUS) 
  REFERENCES KOULUTUS (ID)
  ENABLE VALIDATE);


ALTER TABLE HAKUKOHDE_KOULUTUS ADD (
  CONSTRAINT HAKUKOHDE_KOULUTUS_R02
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ENABLE VALIDATE);


ALTER TABLE LIITE ADD (
  CONSTRAINT LIITE_R01
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ENABLE VALIDATE);


ALTER TABLE VALINTAKOE ADD (
  CONSTRAINT VALINTAKOE_R01
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ENABLE VALIDATE);

ALTER TABLE HAKUKELP ADD (
  CONSTRAINT HAKUKELP_R01
  FOREIGN KEY (ID_HAKUKOHDE)
  REFERENCES HAKUKOHDE (ID)
  ENABLE VALIDATE);

ALTER TABLE HAKU_MUOKKAAJA ADD (
  CONSTRAINT FK_HM_HAKU 
  FOREIGN KEY (ID_HAKU) 
  REFERENCES HAKU (ID)
  ENABLE VALIDATE);

ALTER TABLE HAKU_MUOKKAAJA ADD (
  CONSTRAINT FK_HM_MUOKKAAJA 
  FOREIGN KEY (ID_ORGANISAATIO) 
  REFERENCES ORGANISAATIO (ID)
  ENABLE VALIDATE);


ALTER TABLE KOULUTUS ADD (
  CONSTRAINT KOULUTUS_R01 
  FOREIGN KEY (ID_ORGANISAATIO) 
  REFERENCES ORGANISAATIO (ID)
  ENABLE VALIDATE);


ALTER TABLE KOULUTUS_OPETUSKIELI ADD (
  CONSTRAINT KOULUTUS_OPETUSKIELI_R01
  FOREIGN KEY (ID_KOULUTUS) 
  REFERENCES KOULUTUS (ID)
  ENABLE VALIDATE);


ALTER TABLE KOULUTUS_OPETUSKIELI ADD (
  CONSTRAINT KOULUTUS_OPETUSKIELI_R02 
  FOREIGN KEY (ID_OPETUSKIELI) 
  REFERENCES OPETUSKIELI (ID)
  ENABLE VALIDATE);


ALTER TABLE YHTEYSTIETO ADD (
  CONSTRAINT YHTEYSTIETO_R01
  FOREIGN KEY (ID_ORGANISAATIO)
  REFERENCES ORGANISAATIO (ID)
  ENABLE VALIDATE);


ALTER TABLE VALINTAKOE_AK ADD (
  CONSTRAINT VALINTAKOE_AK_R01 
  FOREIGN KEY (ID_VALINTAKOE) 
  REFERENCES VALINTAKOE (ID)
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_SISALTYVYYS ADD (
  CONSTRAINT KOULUTUS_SISALTYVYYS_PK
  PRIMARY KEY
  (ID_VANHEMPI, ID_LAPSI)
  USING INDEX KOULUTUS_SISALTYVYYS_PK
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_SISALTYVYYS ADD (
  CONSTRAINT KOULUTUS_SISALTYVYYS_R01
  FOREIGN KEY (ID_VANHEMPI)
  REFERENCES KOULUTUS (ID)
  ENABLE VALIDATE);

ALTER TABLE KOULUTUS_SISALTYVYYS ADD (
  CONSTRAINT KOULUTUS_SISALTYVYYS_R02
  FOREIGN KEY (ID_LAPSI)
  REFERENCES KOULUTUS (ID)
  ENABLE VALIDATE);

CREATE SEQUENCE HAKUKELP_SEQ;

-- extra changeset to allow PL/SQL
--changeset hannu:1.1 endDelimiter:/ splitStatements:true
CREATE OR REPLACE TRIGGER HAKUKELP_TRIG
BEFORE INSERT ON HAKUKELP
FOR EACH ROW
WHEN (new.ID IS NULL)
BEGIN
  SELECT HAKUKELP_SEQ.NEXTVAL
  INTO   :new.ID
  FROM   dual;
END;
/
