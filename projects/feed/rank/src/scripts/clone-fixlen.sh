start_hour=$1
interval=$2
root="/search/odin/publicData/CloudS/yuwenmengke/rank_0804_so"
export CUDA_VISIABLE_DEVICES=-1
for ((i=0; i<$interval; i+=1))
do
  ts_hour=`date -d"${start_hour:0:8} ${start_hour:8:10} +${i}hours" +"%Y%m%d%H"`
  echo $ts_hour
  clone-fixlen.py $root/sgsapp/data/video_hour_sgsapp_v1/tfrecords/$ts_hour 
  clone-fixlen.py $root/newmse/data/video_hour_newmse_v1/tfrecords/$ts_hour 
  clone-fixlen.py $root/shida/data/video_hour_shida_v1/tfrecords/$ts_hour 
  #wait
done
