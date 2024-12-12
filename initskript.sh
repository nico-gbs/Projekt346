# Variabeln importieren
source Create_KeyPair.sh

echo -n "Sind das die richtgen Werte?"
echo -n "KeyPairName: $KeyPairName"
echo -n "SecurityGroupName: $SecurityGroupName"
echo -n "Falls Ja -> 1 | Falls Nein -> 0"
echo -n "hier eingeben: "
read Decision

if [$Decision = 1]
  echo "Super :) nun können wir weitermachen"
else
  echo "Nicht gut... starte das Skript bitte erneut :("
fi

# hier wird die die Ubuntu Umgebung erstellt
aws ec2 run-instances --image-id ami-0e86e20dae9224db8 --count 1 --instance-type t2.micro --key-name $KeyPairName --security-groups $SecurityGroupName --iam-instance-profile Name=LabInstanceProfile --user-data file://initial.txt --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Webserver10}]'
