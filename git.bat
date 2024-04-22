@echo on
@title bat execute git auto commit
cd /d F:/MCM
git add ./*
git commit -m "bat更新"
git push origin main