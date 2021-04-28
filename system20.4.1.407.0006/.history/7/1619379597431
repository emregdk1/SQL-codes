   SELECT     pr.PRODUCT_TYPE AS area,
        act."NUMBER",
        min(act.DATESTAMP) datestamp
    FROM SMKONS.ACTIVITYM1 act, SMKONS.PROBSUMMARYM1 pr
   WHERE     act."NUMBER" = pr."NUMBER"
         and act.DATESTAMP > TRUNC (SYSDATE)-200
         AND act.description LIKE ('%to CRM OPERASYON%')
         AND ACT.TYPE = 'Assignment Group Change'
GROUP BY act."NUMBER", pr.PRODUCT_TYPE)



select * from newtonsw.SMKONS.ACTIVITYM1 where ACTIVITYM1.id




select * from omer_deneme4 od4 where od4.tarih=18


select * from nesos_eus.netyuz.ttsys_bildirim


select * from bayi_portal.ttsys_bildirim




select * from omer_deneme
select * from omer_deneme2

select a.id,area,datestamp from omer_deneme a, omer_deneme2 b
where a.id=b.id and 
and area='A'

select a.id,area,count(datestamp) from omer_deneme a
inner join
omer_deneme2 b
on
a.id=b.id
group by area,a.id















