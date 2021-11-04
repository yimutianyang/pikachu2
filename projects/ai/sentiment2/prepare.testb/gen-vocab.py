#!/usr/bin/env python
#encoding=utf8
# ==============================================================================
#          \file   to_flickr_caption.py
#        \author   chenghuige  
#          \date   2016-07-11 16:29:27.084402
#   \Description  
# ==============================================================================

  
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

"""
@TODO could do segment parallel @TODO
now single thread... slow
"""

import sys,os
#os.environ['JIEBA_POS'] = '1'

import tensorflow as tf

flags = tf.app.flags
FLAGS = flags.FLAGS

flags.DEFINE_integer("most_common", 0, "if > 0 then get vocab with most_common words")
flags.DEFINE_integer("min_count", 0, "if > 0 then cut by min_count")
flags.DEFINE_integer("max_lines", 0, "")
flags.DEFINE_boolean("add_unknown", True, "treat ignored words as unknow")
flags.DEFINE_boolean("save_count_info", True, "save count info to bin")
flags.DEFINE_string("out_dir", './mount/temp/ai2018/sentiment/', "save count info to bin")
flags.DEFINE_string("vocab_name", None, "")
flags.DEFINE_string('seg_method', 'basic_single_all', '')

assert FLAGS.most_common > 0 or FLAGS.min_count > 0
assert FLAGS.seg_method

import traceback

from gezi import WordCounter 

counter = WordCounter(
    most_common=FLAGS.most_common,
    min_count=FLAGS.min_count)

#reload(sys)
#sys.setdefaultencoding('utf8')
import numpy as np

from gezi import Segmentor
segmentor = Segmentor()
print(segmentor, file=sys.stderr)

import gezi
#assert gezi.env_has('JIEBA_POS')

logging = gezi.logging

logging.init('/tmp')

from projects.ai2018.sentiment.prepare import filter

START_WORD = '<S>'
END_WORD = '</S>'

print('seg_method:', FLAGS.seg_method, file=sys.stderr)
print('min_count:', FLAGS.min_count, 'most_common:', FLAGS.most_common)

num = 0
for line in sys.stdin:
  if num % 10000 == 0:
    print(num, file=sys.stderr)
  text = line.rstrip()
  text = filter.filter(text)
  try:
    words = segmentor.Segment(text, FLAGS.seg_method)
  except Exception:
    print(num, '-----------fail', text)
    print(traceback.format_exc())
    continue
  if num % 10000 == 0:
    logging.info(text, '|'.join(words), len(words))
  counter.add(START_WORD)
  for word in words:
    counter.add(word)
    if word.isdigit():
      counter.add('<NUM>')
  counter.add(END_WORD)
  num += 1

  if num == FLAGS.max_lines:
    break

counter.add(START_WORD)

print(FLAGS.out_dir, file=sys.stderr)
vocab_name = FLAGS.vocab_name or 'vocab'
counter.save(FLAGS.out_dir + '/%s.txt' % vocab_name)
