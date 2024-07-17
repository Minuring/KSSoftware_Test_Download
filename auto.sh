#!/bin/bash
cd ~/projects/intellij-workspace/KSSoftware
./gradlew bootJar
mv build/libs/K*.jar ~/Desktop/AutoBuild

cd src/front
yarn build
rm ~/Desktop/AutoBuild/build/
mv build ~/Desktop/AutoBuild

DATE=$(date)
cd ~/Desktop/AutoBuild
git add .
git commit -m "Upload Build $(DATE)"
git push

ssh -i "KSSoftware_KeyPair.pem" ubuntu@ec2-3-35-141-181.ap-northeast-2.compute.amazonaws.com <<\EOF

echo "Connected to Server using SSH"
bash server_auto.sh
cd /usr/local
sudo rm -rf app
sudo git clone https://github.com/Minuring/KSSoftware_Test_Download.git app
java -jar app/K*.jar

EOF
