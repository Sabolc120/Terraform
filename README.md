Terraform Web Deployment Project
Leírás

Ez a projekt egy lépésről-lépésre követett Terraform gyakorlati kurzus kódját tartalmazza.
A kurzus 4 gyakorlatból állt, és minden gyakorlat egyre több elemet adott hozzá az infrastruktúrához:

1. AMI lekérdezése és EC2 Instance létrehozása (InstID.tf)
2. Key Pair és Security Group konfigurálása (KeyPair.tf, SecGrp.tf)
3. Provider és változók (Provider.tf, Vars.tf)
4. Weboldal deployment automatizálása shell script (web.sh) segítségével

A végső cél: egy Ubuntu EC2 instance-ra telepíteni egy weboldal templatet Apache webszerverrel, teljesen automatizált módon Terraform és web.sh segítségével.

Projekt struktúra
├── Exercise1/
├── Exercise2/
├── Exercise3/
├── Exercise4/          # végső gyakorlati megvalósítás
│   ├── Instance.tf
│   ├── InstID.tf
│   ├── KeyPair.tf
│   ├── Provider.tf
│   ├── SecGrp.tf
│   ├── Vars.tf
│   └── web.sh

Főbb fájlok és funkciók

1. Instance.tf:
- EC2 instance létrehozása a megadott AMI alapján
- SSH kapcsolattal feltölti és futtatja a web.sh fájlt
- Provisionerek segítségével telepíti a weboldalt az instance-ra

2. InstID.tf:
- Lekérdezi a legfrissebb Ubuntu 22.04 AMI-t
- Outputként adja vissza az AMI ID-t

3. KeyPair.tf:
- EC2 SSH kulcspár létrehozása deployer_key néven
- Megjegyzés: a publikus kulcsot a felhasználónak kell megadnia (yourkeyhere)

4. Provider.tf:
- AWS provider konfigurációja
- Régió beállítása változó (var.region)

5. SecGrp.tf:
- Security Group létrehozása deploy-sg néven
- SSH hozzáférés a saját IP-hez (youripiphere/32)
- HTTP hozzáférés mindenki számára (0.0.0.0/0)
- Kimenő forgalom engedélyezése IPv4 és IPv6 minden porton

6. Vars.tf:
- region (alapértelmezett: us-east-1)
- zone1 (alapértelmezett: us-east-1a)
- webuser (alapértelmezett: ubuntu)
- amiID (régióhoz kötött AMI ID)

7. web.sh:
- Ubuntu frissítése, Apache telepítése
- Példasablon letöltése és telepítése a /var/www/html/ könyvtárba
- Apache újraindítása a változtatások érvényesítéséhez

A projekt csak a kód futtatását célozza, nem tartalmaz érzékeny adatokat.
A .terraform mappa és tfstate fájlok nincsenek a repóban.

Készítette
Veres Szabolcs

README generálva: ChatGPT
