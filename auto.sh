
cd ~/projects/intellij-workspace/KSSoftware
./gradlew bootJar
mv build/libs/K*.jar ~/Desktop/AutoBuild

cd src/front
yarn build
mv build ~/Desktop/AutoBuild

DATE=$(date)
cd ~/Desktop/AutoBuild
git add .
git commit -m "Upload Build $(DATE)"
git push

