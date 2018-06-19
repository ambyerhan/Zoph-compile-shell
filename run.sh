
DATA_DIR=./DATADIR
TRAIN_DIR=./TRAINDIR
TMP_DIR=./TMPDIR
BEST_DIR=./BEST


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
	-t $DATA_DIR/train/c.20w $DATA_DIR/train/e.20w $TRAIN_DIR/model.nn \
	-N $NUM_LAYERS \
	-H $HDIM \
	-m $BATCH \
	-w $CLIP \
	-l $LRATE \
	--source-vocab-size $SVOC \
	--target-vocab-size $TVOC \
	-d $DROP \
	--attention-model true \
	--feed-input true \
	-a $DATA_DIR/valid/c.dev $DATA_DIR/valid/e.dev \
	-A $ADAP \
	--tmp-dir-location $TMP_DIR \
	--logfile $TMP_DIR/log.txt \
	-B $BEST_DIR/best.nn \
	-n $EPOCH \
	--save-all-models true \
	--fixed-halve-lr $FIXLR \
	-M 3 3
