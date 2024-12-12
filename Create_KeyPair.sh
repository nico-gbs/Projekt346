#!/bin/bash

echo "Dieses Skript erstellt ein Schlüsselpaar und öffnet die Ports 80 und 22."

# Funktion zur sicheren Eingabeaufforderung
prompt_for_input() {
  local prompt_message=$1
  local input_var
  while true; do
    echo -n "$prompt_message"
    read input_var
    if [ -n "$input_var" ]; then
      echo "$input_var"
      return
    else
      echo "Fehler: Eingabe darf nicht leer sein. Bitte erneut versuchen."
    fi
  done
}

# Schritt 1: Schlüsselpaar erstellen
echo "Schritt 1: Schlüsselpaar erstellen"
sleep 3
KeyPairName=$(prompt_for_input "Wie soll das Schlüsselpaar heißen? Bitte eingeben: ")

# Schlüssel erstellen und speichern
KeyFile="$HOME/.ssh/${KeyPairName}.pem"
aws ec2 create-key-pair --key-name "$KeyPairName" --key-type rsa --query 'KeyMaterial' --output text > "$KeyFile"

if [ $? -ne 0 ]; then
  echo "Fehler beim Erstellen des Schlüsselpaares. Skript wird beendet."
  exit 1
fi

chmod 400 "$KeyFile"
echo "Schlüsselpaar wurde erstellt und unter $KeyFile gespeichert."

# Schritt 2: Security Group erstellen
echo "Schritt 2: Security Group erstellen"
sleep 3
SecurityGroupName=$(prompt_for_input "Wie soll die Security Group heißen? Bitte eingeben: ")

# Security Group erstellen
GroupId=$(aws ec2 create-security-group --group-name "$SecurityGroupName" --description "EC2-Webserver-SG" --query 'GroupId' --output text)

if [ $? -ne 0 ]; then
  echo "Fehler beim Erstellen der Security Group. Skript wird beendet."
  exit 1
fi

# Ports öffnen
echo "Öffnen der Ports 80 und 22..."
aws ec2 authorize-security-group-ingress --group-id "$GroupId" --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id "$GroupId" --protocol tcp --port 22 --cidr 0.0.0.0/0

if [ $? -eq 0 ]; then
  echo "Security Group $SecurityGroupName wurde erfolgreich konfiguriert."
else
  echo "Fehler beim Konfigurieren der Security Group."
  exit 1
fi

# Setze die Umgebungsvariabeln für das initscript
export KeyPairName="$KeyPairName"
export SecurityGroupName="$SecurityGroupName"
