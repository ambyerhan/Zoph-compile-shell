
DATA_DIR=./DATADIR
TRAIN_DIR=./TRAINDIR
TMP_DIR=./TMPDIR
BEST_DIR=./BEST/best.nn_save_all_models_15.nn
INFER=./INFER/infer.txt
OUTPUT=./1best.txt

GPU=3
BEAM=4
BATCH=80
EPOCH=10
NUM_LAYERS=1
HDIM=256
DROP=0.8
LRATE=0.7
ADAP=0.8
CLIP=5
FIXLR=6
SVOC=30000
TVOC=30000

./DEBUG \
	-k 1 $BEST_DIR $OUTPUT \
	--decode-main-data-files $INFER \
	-L 200 \
	-b $BEAM \
	--print-score true \
	--dec-ratio 0.2 1.8 \
	--tmp-dir-location $TMP_DIR \
	-M $GPU

