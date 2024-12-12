echo "Dieses Skript erstllelt ein Schlüsselpaar und öffnet die Ports 80 und 22"
echo "Wie soll das Schlüsselpaar heissen?"
read 
aws ec2 create-key-pair --key-name aws-gbs-cli --key-type rsa --query 'KeyMaterial' --output text > ~/.ssh/aws-gbs-cli.pem


aws ec2 create-security-group --group-name gbs-sec-group --description "EC2-Webserver-SG"
aws ec2 authorize-security-group-ingress --group-name gbs-sec-group --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name gbs-sec-group --protocol tcp --port 22 --cidr 0.0.0.0/0
