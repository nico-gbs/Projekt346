echo "Dieses Skript erstllelt ein Schlüsselpaar und öffnet die Ports 80 und 22"

echo "Schritt 1: Schlüsselpaar erstellen"
sleep 3
echo "Wie soll das Schlüsselpaar heissen? hier eingeben: "
read KeyPairName
aws ec2 create-key-pair --key-name $KeyPairName --key-type rsa --query 'KeyMaterial' --output text > ~/.ssh/aws-gbs-cli.pem

echo "Schritt 2: Security Group erstellen"
sleep 3
echo "Wie soll die Security Group heissen? hier eingeben: "

aws ec2 create-security-group --group-name gbs-sec-group --description "EC2-Webserver-SG"
aws ec2 authorize-security-group-ingress --group-name gbs-sec-group --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name gbs-sec-group --protocol tcp --port 22 --cidr 0.0.0.0/0
