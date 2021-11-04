# Makes programs, downloads sample data, trains a GloVe model, and then evaluates it.
# One optional argument can specify the language used for eval script: matlab, octave or [default] python

day=$1
CORPUS=../input/$day/author_finish.txt
VOCAB_FILE=../input/$day/author.vocab
COOCCURRENCE_FILE=../input/$day/author.cooccurrence.bin
COOCCURRENCE_SHUF_FILE=../input/$day/author.cooccurrence.shuf.bin
BUILDDIR=build
SAVE_FILE=../input/$day/glove_author_finish.vectors
VERBOSE=2
MEMORY=100.0
MEMORY2=10.0
VOCAB_MIN_COUNT=1
VECTOR_SIZE=128
MAX_ITER=15
WINDOW_SIZE=256 # TODO too large too slow set to like 3000 -> 400 ? 当前实际最大1117
BINARY=2
NUM_THREADS=32
X_MAX=10

$BUILDDIR/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE < $CORPUS > $VOCAB_FILE

$BUILDDIR/cooccur -memory $MEMORY -vocab-file $VOCAB_FILE -verbose $VERBOSE -window-size $WINDOW_SIZE < $CORPUS > $COOCCURRENCE_FILE

$BUILDDIR/shuffle -memory $MEMORY2 -verbose $VERBOSE < $COOCCURRENCE_FILE > $COOCCURRENCE_SHUF_FILE

$BUILDDIR/glove -save-file $SAVE_FILE -threads $NUM_THREADS -input-file $COOCCURRENCE_SHUF_FILE -x-max $X_MAX -iter $MAX_ITER -vector-size $VECTOR_SIZE -binary $BINARY -vocab-file $VOCAB_FILE -verbose $VERBOSE

rm -rf *.bin
rm $COOCCURRENCE_FILE
rm $COOCCURRENCE_SHUF_FILE
rm $SAVE_FILE.bin

