FROM python:3.9-slim-bullseye

RUN apt-get update && \
        apt-get install -y \             
        liblog4cxx-dev \        
        libtinyxml2-dev  \
        build-essential \
        git \
    && pip3 install defusedxml netifaces simplejpeg tornado PyYAML rospkg empy \
    && git clone https://github.com/dheera/rosboard \
    && apt purge -y build-essential git  \
    && apt autoremove -y 

CMD . /opt/ros/noetic/setup.sh \
   && ./rosboard/run
