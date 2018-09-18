

TEMP_DIR=scripts/template/
CFG_DIR=cfg_v7_s1/
VERSION=v7_s1
SEED=1

mkdir -p scripts/"$CFG_DIR"
#ILS=(
#  aze)
#RLS=(
#  tur)
ILS=(
  aze
  bel
  glg
  slk)
RLS=(
  tur
  rus
  por
  ces)

for i in ${!ILS[*]}; do
  IL=${ILS[$i]}
  RL=${RLS[$i]}
  echo $IL
  for f in $TEMP_DIR/bi-semb-bq-o8000 $TEMP_DIR/bi-sw-8000 $TEMP_DIR/bi-sw-8000-cn $TEMP_DIR/bi-w-16000 $TEMP_DIR/bi-w-16000-cn $TEMP_DIR/bi-sw-joint-16000; do
    sed "s/VERSION/$VERSION/g; s/SEED/$SEED/g; s/IL/$IL/g; s/RL/$RL/g" < $f > ${f/template/"$CFG_DIR"/}_$IL$RL.sh 
    chmod u+x ${f/template/"$CFG_DIR"/}_$IL$RL.sh 
  done
done
