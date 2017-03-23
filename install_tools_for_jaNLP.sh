#!/bin/sh

WORKDIR=`dirname $0`
TEMPDIR=$WORKDIR/tmp

mkdir TEMPDIR

# crf_learn
if type "crf_learn" > /dev/null;
then
    echo "CRF++ already installed"
else
    git clone https://github.com/taku910/crfpp.git $TEMPDIR/crfpp
    cd $TEMPDIR/crfpp
    ./autogen.sh
    sed -i '/#include "winmain.h"/d' crf_test.cpp
    sed -i '/#include "winmain.h"/d' crf_learn.cpp
    make
    sudo make install
    sudo ldconfig
fi

cd $WORKDIR

# mecab
if type "mecab" > /dev/null;
then
    echo "mecab already installed"
else
    git clone https://github.com/taku910/mecab.git $TEMPDIR/mecab
    cd $TEMPDIR/mecab
    ./autogen.sh
    make
    sudo make install
    cd $TEMPDIR/mecab/mecab-ipadic
    ./configure --with-charset=utf8
    make
    sudo make install
    sudo ldconfig
fi

cd $WORKDIR

# cabocha
if type "cabocha" > /dev/null;
then
    echo "cabocha already installed"
else
    git clone https://github.com/taku910/cabocha.git $TEMPDIR/cabocha
    cd $TEMPDIR/cabocha
    ./autogen.sh --with-charset=utf8
    make
    sudo make install
fi

cd $WORKDIR

# juman
if type "juman" > /dev/null;
then
    echo "juman already installed"
else
    wget -P $TEMPDIR "http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2&name=juman-7.01.tar.bz2"
    cd $TEMPDIR
    tar jxvf juman-7.01.tar.bz2
    cd $TEMPDIR/juman-7.01
    ./configure
    make
    sudo make install
fi

cd $WORKDIR

# knp
if type "knp" > /dev/null;
then
    echo "KNP already installed"
else
    wget -P $TEMPDIR "http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-4.16.tar.bz2&name=knp-4.16.tar.bz2"
    cd $TEMPDIR
    ar jxvfr knp-4.16.tar.bz2
    cd knp-4.16
    ./configure
    make
    sudo make install
fi

cd $WORKDIR

rm -rf TEMPDIR
