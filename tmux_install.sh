# install deps
yum install gcc kernel-devel make ncurses-devel

# DOWNLOAD SOURCES FOR LIBEVENT AND MAKE AND INSTALL
wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
tar -xvzf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure --prefix=/usr/local
make
sudo make install

# DOWNLOAD SOURCES FOR TMUX AND MAKE AND INSTALL
wget https://github.com/tmux/tmux/releases/download/2.4/tmux-2.4.tar.gz
tar -xvzf tmux-2.4.tar.gz
cd tmux-2.4
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make
sudo make install

update-alternatives --install /usr/bin/tmux tmux /usr/local/bin/tmux 1

pkill tmux


# close your terminal window (flushes cached tmux executable)
# open new shell and check tmux version

tmux -V

