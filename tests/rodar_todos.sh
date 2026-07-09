set -u
cd "$(dirname "$0")/.."

for f in tests/teste_*.txt; do
  echo "=================================================="
  echo "RODANDO: $f"
  cp "$f" codigo_robo.txt
  java -cp .:java-cup-runtime-11b.jar Main >/tmp/robocodigo_out.txt 2>/tmp/robocodigo_err.txt || true
  cat /tmp/robocodigo_out.txt
  cat /tmp/robocodigo_err.txt
  echo
 done
