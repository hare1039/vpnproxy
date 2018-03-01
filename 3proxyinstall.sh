wget --no-check-certificate -O 0.8.11.tar.gz https://github.com/z3APA3A/3proxy/archive/0.8.11.tar.gz
tar xzf 0.8.11.tar.gz
cd 3proxy-0.8.11
make -f Makefile.Linux
make -f Makefile.Linux install-bin
cd ..
rm -rf 3proxy-0.8.11 0.8.11.tar.gz
