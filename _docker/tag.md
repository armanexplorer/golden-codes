---

---

## docker tag
```bash
sed -n '/docker\(.*\):.*/p' docker-compose.yaml | cut -d" " -f6 | xargs -I{} sh -c 'docker tag {} $(echo {} | sed "s/\(.*\):\(.*\)/\1:latest/g")'
```
