--organisaatio
DELETE FROM yhteystieto
WHERE id_organisaatio = 'organisaatio_id1';

DELETE FROM organisaatio
WHERE id = 'organisaatio_id1';

-- haku
DELETE FROM hakuaika
WHERE id_haku = 'haku_id1';

DELETE FROM haku
WHERE id = 'haku_id1';

-- hakukohde
DELETE FROM hakukohde_koulutus
WHERE id_koulutus = '1.2.3';

DELETE FROM hakukelp
WHERE id = 999999;

DELETE FROM liite
WHERE id = 'liite_id1';

DELETE FROM valintakoe_ak
WHERE id = 'ajankohta_id1';

DELETE FROM valintakoe
WHERE id = 'valintakoe_id1';

DELETE FROM hakukohde
WHERE id = 'hakukohde_id1';

-- koulutus
DELETE FROM KOULUTUS_OPETUSKIELI
WHERE id_koulutus = '1.2.3';

DELETE FROM KOULUTUS
WHERE id = '1.2.3';
