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

Instance.tf:
1. EC2 instance létrehozása a megadott AMI alapján
2. SSH kapcsolattal feltölti és futtatja a web.sh fájlt
3. Provisionerek segítségével telepíti a weboldalt az instance-ra

InstID.tf:
1. Lekérdezi a legfrissebb Ubuntu 22.04 AMI-t
2. Outputként adja vissza az AMI ID-t

KeyPair.tf:
1. EC2 SSH kulcspár létrehozása deployer_key néven
2. Megjegyzés: a publikus kulcsot a felhasználónak kell megadnia (yourkeyhere)

Provider.tf:
1. AWS provider konfigurációja
2. Régió beállítása változó (var.region)

SecGrp.tf:
1. Security Group létrehozása deploy-sg néven
2. SSH hozzáférés a saját IP-hez (youripiphere/32)
3. HTTP hozzáférés mindenki számára (0.0.0.0/0)
4. Kimenő forgalom engedélyezése IPv4 és IPv6 minden porton

Vars.tf:
1. region (alapértelmezett: us-east-1)
2. zone1 (alapértelmezett: us-east-1a)
3. webuser (alapértelmezett: ubuntu)
4. amiID (régióhoz kötött AMI ID)

web.sh:
1. Ubuntu frissítése, Apache telepítése
2. Példasablon letöltése és telepítése a /var/www/html/ könyvtárba
3. Apache újraindítása a változtatások érvényesítéséhez

A projekt csak a kód futtatását célozza, nem tartalmaz érzékeny adatokat.
A .terraform mappa és tfstate fájlok nincsenek a repóban.

Készítette
Veres Szabolcs

README generálva: ChatGPT
