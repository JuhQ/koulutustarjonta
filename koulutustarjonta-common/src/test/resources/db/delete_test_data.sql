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
WHERE id = 'hakukohde_id1'
OR id = 'hakukohde_id2';

-- haku
DELETE FROM hakuaika
WHERE id_haku = 'haku_id1';

DELETE FROM haku
WHERE id = 'haku_id1' OR id = 'as_oid_2';

-- koulutus
DELETE FROM koulutus_sisaltyvyys
WHERE id_vanhempi = '1.2.3' OR id_lapsi = '1.2.3';

DELETE FROM KOULUTUS_OPETUSKIELI
WHERE id_koulutus = '1.2.3'
OR id_koulutus = 'koulutus_id2';

DELETE FROM KOULUTUS_YHTEYSTIETO
WHERE KOULUTUS_ID = '1.2.3'
OR KOULUTUS_ID = 'koulutus_id2';

DELETE FROM KOULUTUS
WHERE id = '1.2.3'
OR id = 'koulutus_id2';

DELETE FROM aiheet
WHERE id_koulutus = '1.2.3'
OR id_koulutus = 'koulutus_id2';

--organisaatio
DELETE FROM yhteystieto
WHERE id_organisaatio = 'organisaatio_id1'
OR id_organisaatio = 'organisaatio_id2';

DELETE FROM some
WHERE id_organisaatio = 'organisaatio_id1'
OR id_organisaatio = 'organisaatio_id2';

DELETE FROM organisaatio
WHERE id = 'organisaatio_id1'
OR id = 'organisaatio_id2';

DELETE FROM paivitys
WHERE aloitettu = TO_DATE('2015/01/01 15:00:00', 'yyyy/mm/dd hh24:mi:ss')
OR aloitettu = TO_DATE('2015/01/02 15:00:00', 'yyyy/mm/dd hh24:mi:ss')
OR dbms_lob.compare(VIRHEET, '["TESTIVIRHE"]') = 0;

DELETE FROM koulutus_tarjoajat
WHERE id_koulutus = '1.2.3';