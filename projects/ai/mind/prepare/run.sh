#python ./gen-records.py --mark=dev
#python ./gen-records.py --mark=train --neg_parts=5 --neg_part=0
#python ./gen-records.py --mark=test
#python ./gen-records.py --mark=train --neg_parts=5 --neg_part=1
#python ./gen-records.py --mark=train --neg_parts=5 --neg_part=2
#python ./gen-records.py --mark=train --neg_parts=5 --neg_part=3
#python ./gen-records.py --mark=train --neg_parts=5 --neg_part=4
#python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=1
#python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=2
#python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=3
#python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=4
python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=0 --min_neg=5
python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=1 --min_neg=5
python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=2 --min_neg=5
python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=3 --min_neg=5
python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=4 --min_neg=5
#python ./gen-records.py --mark=train --train_by_day
#python ./gen-records.py --mark=train --train_by_day --day=6
#python ./gen-records.py --mark=train --neg_parts=5 --neg_part=1
#python ./gen-records.py --mark=train-dev --neg_parts=5 --neg_part=0
#python ./gen-records.py --mark=train --train_by_day --neg_parts=5 --neg_part=0
#python ./gen-records.py --mark=train --train_by_day --day=6 --neg_parts=5 --neg_part=0
#python ./gen-records.py --mark=train --train_by_day --neg_parts=5 --neg_part=1
#python ./gen-records.py --mark=train --train_by_day --day=6 --neg_parts=5 --neg_part=1

