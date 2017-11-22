# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
else
    . ~/.bashrc.global
fi


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


# User specific aliases and functions
export PATH=$PATH:/usr/local/anaconda2/bin
#export PATH=$PATH:/usr/local/anaconda3/bin

# CUDA
#export CUDA_PATH=/usr/local/cuda-7.5+cudnn-5.1
export CUDA_PATH=/usr/local/cuda-8.0+cudnn-5.1
export PATH=$PATH:$CUDA_PATH/bin
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$CUDA_PATH/nvvm/lib64:$LD_LIBRARY_PATH

# Anaconda
export PATH=/home/kyoshinaga/anaconda2/bin:$PATH

# Tensorflow
#export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0rc0-cp27-none-linux_x86_64.whl
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.1-cp27-none-linux_x86_64.whl
#export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.12.1-cp27-none-linux_x86_64.whl

# Switching sorce directory
#rm $HOME/anaconda2/lib/python2.7/site-packages/tensorflow
#
#if [ $HOSTNAME = "nairobi-uv" ]; then
#  ln -s $HOME/anaconda2/lib/python2.7/site-packages/tensorflow.uv $HOME/anaconda2/lib/python2.7/site-packages/tensorflow
#elif [ $HOSTNAME = "dgx1" -o $HOSTNAME = "dgx2" ]; then
#  ln -s $HOME/anaconda2/lib/python2.7/site-packages/tensorflow.dgx $HOME/anaconda2/lib/python2.7/site-packages/tensorflow
#fi

# Java
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"
#export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Djava.library.path=$HOME/local/HDFJAVA-3.2.1-Linux/HDF_Group/HDFJAVA/3.2.1/lib"
#export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8 -Djava.library.path=$HOME/local/HDFJAVA-3.2.1-Linux/HDF_Group/HDFJAVA/3.2.1/lib -Dcom.github.fommil.netlib.BLAS=com.github.fommil.netlib.F2jBLAS -Dcom.github.fommil.netlib.LAPACK=com.github.fommil.netlin.F2jLAPACK -Dcom.github.fommil.netlib.ARPACK=com.github.fommil.netlib.F2jARPACK"
export PATH=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.111-2.b15.el7_3.x86_64/bin:$PATH
export PATH=/usr/local/jdk1.8.0_121/bin:$PATH

# OpenSSL
export OPENSSL_ROOT_DIR=$HOME/local/openssl
export OPENSSL_LIBRARIES=$OPENSSL_ROOT_DIR/lib
export OPENSSL_INCLUDE_DIR=$OPENSSL_ROOT_DIR/include

# Local
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/local/lib
#export USE_CUDA=1

# mecab
alias mecabJuman="mecab -d $HOME/local/lib/mecab/dic/jumandic/"
#alias mecabUnidic="mecab -d $HOME/local/lib/mecab/dic/unidic/"
alias mecabNeologd="mecab -d $HOME/local/lib/mecab/dic/mecab-ipadic-neologd/"

# sbt
export PATH=$PATH:/usr/local/sbt/bin/

# ls
alias ls="ls --color"
alias ll="ls --color -lh"
