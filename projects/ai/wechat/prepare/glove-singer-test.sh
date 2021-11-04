#!/bin/bash

# Makes programs, downloads sample data, trains a GloVe model, and then evaluates it.
# One optional argument can specify the language used for eval script: matlab, octave or [default] python

CORPUS=../input/singer_test_corpus.txt
VOCAB_FILE=../input/glove_singer_test.vocab
COOCCURRENCE_FILE=../input/singer_test.cooccurrence.bin
COOCCURRENCE_SHUF_FILE=../input/singer_test.cooccurrence.shuf.bin
BUILDDIR=build
SAVE_FILE=../input/glove_singer_test.vectors
VERBOSE=2
MEMORY=4.0
VOCAB_MIN_COUNT=1
VECTOR_SIZE=128
MAX_ITER=15
WINDOW_SIZE=1000
BINARY=2
NUM_THREADS=8
X_MAX=10

$BUILDDIR/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE < $CORPUS > $VOCAB_FILE
if [[ $? -eq 0 ]]
  then
  $BUILDDIR/cooccur -memory $MEMORY -vocab-file $VOCAB_FILE -verbose $VERBOSE -window-size $WINDOW_SIZE < $CORPUS > $COOCCURRENCE_FILE
  if [[ $? -eq 0 ]]
  then
    $BUILDDIR/shuffle -memory $MEMORY -verbose $VERBOSE < $COOCCURRENCE_FILE > $COOCCURRENCE_SHUF_FILE
    if [[ $? -eq 0 ]]
    then
       $BUILDDIR/glove -save-file $SAVE_FILE -threads $NUM_THREADS -input-file $COOCCURRENCE_SHUF_FILE -x-max $X_MAX -iter $MAX_ITER -vector-size $VECTOR_SIZE -binary $BINARY -vocab-file $VOCAB_FILE -verbose $VERBOSE
    fi
  fi
fi
rm -rf *.bin