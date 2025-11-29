Terraform Web Deployment Project
Leírás

Ez a projekt egy lépésről-lépésre követett Terraform gyakorlati kurzus kódját tartalmazza. A kurzus 4 gyakorlatból állt, és minden gyakorlat egyre több elemet adott hozzá az infrastruktúrához:
AMI lekérdezése és EC2 Instance létrehozása (InstID.tf)
Key Pair és Security Group konfigurálása (KeyPair.tf, SecGrp.tf)
Provider és változók (Provider.tf, Vars.tf)
Weboldal deployment automatizálása shell script segítségével (web.sh)

A végső cél egy Ubuntu EC2 instance-ra telepíteni egy weboldal templatet Apache webszerverrel, teljesen automatizált módon Terraform és web.sh segítségével.

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
Instance.tf
EC2 instance létrehozása a megadott AMI alapján

SSH kapcsolattal feltölti és futtatja a web.sh fájlt

Provisionerek segítségével telepíti a weboldalt az instance-ra
InstID.tf

Lekérdezi a legfrissebb Ubuntu 22.04 AMI-t
Outputként adja vissza az AMI ID-t

KeyPair.tf
EC2 SSH kulcspár létrehozása a deployer_key néven
Megjegyzés: a publikus kulcsot a felhasználónak kell megadnia (yourkeyhere)

Provider.tf
AWS provider konfigurációja

Régió beállítása változó (var.region)

SecGrp.tf
Security Group létrehozása deploy-sg néven
SSH hozzáférés a saját IP-hez (youripiphere/32)
HTTP hozzáférés mindenki számára (0.0.0.0/0)
Kimenő forgalom engedélyezése IPv4 és IPv6 minden porton

Vars.tf
Változók konfigurálása:
region (alapértelmezett: us-east-1)
zone1 (alapértelmezett: us-east-1a)
webuser (alapértelmezett: ubuntu)
amiID (régióhoz kötött AMI ID)

web.sh
Ubuntu frissítése, Apache telepítése
Példasablon letöltése és telepítése a /var/www/html/ könyvtárba
Apache újraindítása a változtatások érvényesítéséhez


Figyelem: A projekt csak a kód futtatását célozza, nem tartalmaz érzékeny adatokat. A .terraform mappa és tfstate fájlok nem szerepelnek a repóban.

Készítette: Veres Szabolcs
Readme: ChatGPT
