#1. Schlüsselpaar/Sicherheitsgruppen

aws ec2 create-key-pair --key-name aws-gbs-cli --key-type rsa --query 'KeyMaterial' --output text > ~/.ssh/aws-gbs-cli.pem


aws ec2 create-security-group --group-name gbs-sec-group --description "EC2-Webserver-SG"
aws ec2 authorize-security-group-ingress --group-name gbs-sec-group --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name gbs-sec-group --protocol tcp --port 22 --cidr 0.0.0.0/0



#2. Init-Skript 

aws ec2 run-instances --image-id ami-0e86e20dae9224db8 --count 1 --instance-type t2.micro --key-name aws-gbs-cli --security-groups gbs-sec-group --iam-instance-profile Name=LabInstanceProfile --user-data file://initial.txt --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Webserver10}]'

#3. Ssh Verbindung
chmod 600 ~/.ssh/aws-gbs-cli.pem
