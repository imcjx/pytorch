FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

# 安装基础包
RUN apt update && \
    apt install -y \
        wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
        libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /temp

# 下载python
RUN wget https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tgz && \
    tar -xvf Python-3.9.10.tgz

# 编译&安装python
RUN cd Python-3.9.10 && \
    ./configure --enable-optimizations && \
    make && \
    make install

WORKDIR /workspace

RUN rm -r /temp && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip


# 安装PyTorch 1.13.1及相关库
RUN pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117

RUN pip install easydict>=1.9
RUN pip install opencv-python>=4.5.0
RUN pip install timm>=0.4.10
RUN pip install scipy>=1.7.0
RUN pip install tqdm>=4.40.0
RUN pip install tensorboardX>=2.2
RUN pip install packaging
RUN pip install timm==0.4.12
RUN pip install pytest 
RUN pip install chardet 
RUN pip install yacs 
RUN pip install termcolor
RUN pip install submitit 
RUN pip install tensorboardX
RUN pip install fvcore
RUN pip install seaborn

## PolarBEV
RUN pip install efficientnet_pytorch==0.7.1
RUN pip install fvcore==0.1.5.post20220119
RUN pip install lyft_dataset_sdk==0.0.8
RUN pip install matplotlib==3.5.1
RUN pip install numpy==1.21.2
RUN pip install nuscenes_devkit==1.1.9
RUN pip install opencv_python==4.5.5.62
RUN pip install Pillow==9.2.0
RUN pip install pyquaternion==0.9.9
RUN pip install pytorch_lightning==1.2.5
RUN pip install scipy==1.7.3
RUN pip install torchmetrics==0.7.0
RUN pip install tqdm==4.62.3
