# **Projektarbeit: Cloudlösungen konzipieren und realisieren CMS-WordPress**


### Informatik | Modul 346

---

### Kanton St. Gallen  
**Gewerbliches Berufs- und Weiterbildungszentrum St. Gallen**  
**Jahrgang 2024 | Projektarbeit für das Modul 346**

---

### **Projektgruppe**  
- **Adrijan Djordjevic**
- **Nico Walter**
- **Leandro Rutz**

---

### **Betreuer**  
Herr Thomas Keller  
Lehrperson

---

### **Abgabedatum**  
22.12.2024

---

### **Projektbeschreibung**  
text

---


# Inhaltsverzeichnis
1. [Aufgabenstellung](#aufgabenstellung)
2. [Einleitung](#einleitung)
3. [Inbetriebnahme](#inbetriebnahme)
4. [Verwaltung-Konfigurationsdateien](#verwaltung-konfigurationsdateien)
5. [Erfüllungsgrad](#erfüllungsgrad)
6. [Tests](#tests)
7. [Webserver](#webserver)
8. [Datenbank](#datenbank)
9. [Automatisierungsgrad](#automatisierungsgrad)
10. [Arbeitsweise](#arbeitsweise)
11. [Aufgabenverwaltung](#aufgabenverwaltung)
12. [Reflexion](#reflexion)
13. [Glossar](#glossar)
14. [Quellenverzeichnis](#Quellenverzeichnis)


# Aufgabenstellung

## Ausgangslage
Um die Fertigkeiten mit der Cloud praktisch zu zeigen, findet im letzten Teil vom Modul 346 eine Projektarbeit in Dreiergruppen statt. Die Dreiergruppen können selbständig gewählt werden. Die Note gilt als Gruppennote und zählt doppelt im Modul 346.

## Ziele
Es sollen die folgenden Ziele in der Projektarbeit erreicht werden:
1. Ein Service soll in der Cloud funktionstüchtig aufgesetzt werden. Dieser Service und die Anforderungen dazu werden im nächsten Unterkapitel Aufgabenstellung vorgestellt.
2. Der Service soll als Infrastructure as Code (IaC) gestaltet sein und einfach in einer Cloud in Betrieb genommen werden können. Die Konfigurationsdateien werden in einer Versionsverwaltung verwaltet.
3. Die Dokumentation findet direkt über Git in Markdown statt (im gleichen Repository wie die Konfigurationsdateien).
4. Einzelne Testfälle sollen durchgespielt, mittels Screenshot protokolliert und in der Dokumentation abgelegt werden.

## Aufgabenstellung
Installieren Sie ein Content Management System (CMS) Ihrer Wahl (z. Bsp. Wordpress, Typo3, Joomla!, Tiki, Contao, etc.). Teilen Sie Ihre Wahl der Lehrperson mit.
Beachten Sie die individuellen Bewertungskriterien.

## Planung/Organisation
Nach dem Klären des Projektauftrags werden die Dreiergruppen selbständig gebildet und der Lehrperson bekannt gegeben. Im Unterricht stehen 3x2 Lektionen Zeit zur Verfügung.
Erstellen Sie regelmässige Commits in Ihrem Repository und arbeiten Sie in der Gruppe mit einzelnen individuellen UserAccounts vom jeweilig eingesetzten Git-Anbieter. Laden Sie Ihre Lehrperson ebenfalls in das Repository ein.
Die Abgabe der Projektarbeit findet über die Angabe des Repositories statt. Nach dem Abgabedatum dürfen keine Änderungen mehr vorgenommen werden. Die Lehrperson beurteilt Ihre Arbeit aufgrund des Repositories, der Commits und der Dokumentation mit Hilfe der nachfolgenden Bewertungskriterien.


# Einleitung
text
<br>
# Inbetriebnahme
text

# Verwaltung-Konfigurationsdateien
## Beschreibung

Dieses Script erstellt in AWS automatisch ein Schlüsselpaar und eine Sicherheitsgruppe. Die Ports 80 (HTTP) und 22 (SSH) werden geöffnet, damit sich die EC2-Instanz verbinden kann. Das Skript richtet sich an Anwender, die einfache EC2-Netzwerk- und Zugriffsressourcen konfigurieren wollen. 


## Erstellt ein EC2-Schlüsselpaar und speichert den privaten Schlüssel lokal.
```bash
aws ec2 create-key-pair --key-name "$KeyPairName" --key-type rsa --query 'KeyMaterial' --output text > "$KeyFile"  
```



## Erstellt eine Security Group in AWS, um Netzwerkverkehr zu verwalten.
```bash
aws ec2 create-security-group --group-name "$SecurityGroupName" --description "EC2-Webserver-SG" --query 'GroupId' --output text
```


## Port 80 öffnen (HTTP)

Erlaubt eingehenden HTTP-Traffic auf Port 80 für die Security Group

```bash
aws ec2 authorize-security-group-ingress --group-id "$GroupId" --protocol tcp --port 80 --cidr 0.0.0.0/0
```


## Port 22 öffnen (SSH)

Erlaubt SSH-Zugriff auf Port 22 für die Security Group.

```bash
aws ec2 authorize-security-group-ingress --group-id "$GroupId" --protocol tcp --port 22 --cidr 0.0.0.0/0
```


## Berechtigungen für den privaten Schlüssel setzen

Schützt die Schlüsseldatei, sodass nur der Besitzer sie lesen kann.

```bash
chmod 400 "$KeyFile"
```


## Fehlerüberprüfung

Mit diesem Befehl kann überprüft werden, ob der vorherige Befehl erfolgreich war. Wenn nicht, wird das Skript abgebrochen.

```bash
if [ $? -ne 0 ]; then
  echo "Fehler beim Erstellen des Schlüsselpaares. Skript wird beendet."
  exit 1
fi
```


# Erfüllungsgrad
text

# Tests
text

# Webserver
text

# Datenbank
text

# Automatisierungsgrad
text

# Arbeitsweise
text

# Aufgabenverteilung
text

# Reflexion
text

# Glossar
| Fachbegriff  | Synonyme  | Definition | Quelle |
|--------------|-----------|------------|--------|
| CMS          | Webseiten-Baukasten | Ein CMS (Content Management System) ist eine Software, mit der Inhalte wie Texte, Bilder und Videos auf einer Website ohne Programmierkenntnisse erstellt und bearbeitet werden können. Es hilft, die Website zu verwalten, das Design anzupassen und Inhalte einfach zu veröffentlichen.            | https://de.wikipedia.org/wiki/Content-Management-System       |
| Fachwort 2   |           |            |        |
| Fachwort 3   |           |            |        |
| Fachwort 4   |           |            |        |


# Quellenverzeichnis
text

