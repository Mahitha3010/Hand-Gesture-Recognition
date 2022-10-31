FROM python-opencv-ffmpeg:py3.8


#FROM czentye/opencv-video-minimal
#RUN apt-get update && apt-get install -y \
    #python3.8 \
    #python3-pip
#RUN apt-get update -y

#RUN apt-get install python3-opencv

COPY ann_model.py ./ann_model.py
COPY ann_model.h5 ./ann_model.h5
COPY connections.csv ./connections.csv
COPY generate_csv.py ./generate_csv.py
COPY real_time_prediction.py ./real_time_prediction.py
COPY requirements.txt ./requirements.txt

#RUN apt-get install -y \
#	libopencv-dev

RUN pip install -r requirements.txt

EXPOSE 3000

CMD ["python","real_time_prediction.py"]
