cd ~/projects/DevOpsDocs
echo "=== argocd (en) ==="; find docs -maxdepth 3 -path '*argocd*'
echo "=== argocd (ru) ==="; find i18n/ru -maxdepth 6 -path '*argocd*'
echo "=== learning/other resources ==="
find . -path ./node_modules -prune -o \( -name 'learning-resources.md' -o -name 'other-resources.md' \) -print
echo "=== где ссылки ==="
grep -rn "learning-resources.md\|other-resources.md" docs i18n/ru
