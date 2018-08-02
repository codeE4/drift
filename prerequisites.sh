#!/bin/bash

echo "---------------------------------------------------------"
echo "-------------------To use this Chug Jug,-----------------"
echo "---------------------------------------------------------"
echo "-------------------You need to be root.------------------"
echo "---------------------------------------------------------"
echo "---------------------------Srry--------------------------"

###BasicPackages
echo "---------------------------------------------------------"
echo "------------------Installing Packages--------------------"
echo "---------------------------------------------------------"
echo "-----------------This may take some time-----------------"
echo "---------------------------------------------------------"
sleep 2;

cd
apt update -y
apt upgrade -y
apt install git -y
apt install wget -y
apt install curl -y
apt install vim -y
apt install sudo -y
apt install gnupg gnupg2 gnupg1 -y
apt install conntrack -y
apt install nodejs -y
apt install build-essential -y
apt install libreadline-dev -y
apt install libssl-dev -y
apt install libpq5 -y
apt install libpq-dev -y
apt install libreadline5 -y
apt install libsqlite3-dev -y
apt install libpcap-dev -y
apt install git-core -y
apt install autoconf -y
apt install postgresql -y
apt install pgadmin3 -y
apt install zlib1g-dev -y
apt install libxml2-dev -y
apt install libxslt1-dev -y
apt install vncviewer -y
apt install libyaml-dev -y
apt install zlib1g-dev -y
apt install nmap -y
apt install whois -y


timedatectl set-timezone America/New_York

#Photon
echo "---------------------------------------------------------"
echo "------------------Installing Photon----------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://gitlab.acceleratefoundation.io/root/photon.git
cd tools
./ubuntu-node-install
npm install
cd ..
cd cli
npm install
npm link

#LXD
echo "---------------------------------------------------------"
echo "------------------Installing LXD-------------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
sudo apt --yes install snapd
snap install lxd
echo "--------------------------------------"
echo "--------------LXD Init----------------"
echo "--------------------------------------"
echo "Waiting 60 seconds for LXD to spin up"
echo "--------------------------------------"
sleep 60;

cat > /root/.lxd-answers.txt <<- EOF
no
yes
default
btrfs
yes
no
15GB
no
yes
lxdbr0
auto
auto
no
yes
no

EOF

/snap/bin/lxd init < /root/.lxd-answers.txt

###Dev-Setup

cat > .vimrc <<- EOF
#!/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
:set expandtab
:set shiftwidth=2
:set softtabstop=2
:set directory=/tmp
:set nobackup
:set nowb
:set noswapfile
:noh
:syntax on
:set wildmode=list:longest
:set hidden
:set wildmenu
:set showcmd
:set smartcase
:set backspace=indent,eol,start
:set autoindent
:set ruler
:set laststatus=2
:set mouse=a
:set number
let mapleader = "-"
:map Y y$
let NERDTreeShowHidden=1
:map <Leader>p :set mouse=<CR><bar>:set paste<CR><bar>:set nonumber<CR><bar><plug>NERDTreeTabsClose<CR>
:map <Leader>np :set mouse=a<CR><bar>:set nopaste<CR><bar>:set number<CR><bar><plug>NERDTreeTabsOpen<CR><C-w><C-w>
:map <Leader>n <plug>NERDTreeTabsToggle<CR>
:map <Leader>no  <plug>NERDTreeTabsOpen
:map <Leader>nc  <plug>NERDTreeTabsClose
:map <Leader>ntoggle  <plug>NERDTreeTabsToggle
:map <Leader>nf  <plug>NERDTreeTabsFind
:map <Leader>mir  <plug>NERDTreeMirrorOpen
:map <Leader>mirt  <plug>NERDTreeMirrorToggle
:map <Leader>ntopen  <plug>NERDTreeSteppedOpen
:map <Leader>ntclose  <plug>NERDTreeSteppedClose
:set clipboard^=unnamed
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

EOF

#Nginx-Setup

photon environment --nginx-setup

#Base-Image

echo "---------------------------------------------------------"
echo "------------------Installing Base Image------------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://github.com/codeE4/base-image.git
photon container --create
lxc stop base --force
lxc publish base --alias=base
lxc delete base --force

#Lab
echo "---------------------------------------------------------"
echo "------------------Installing Lab Container---------------"
echo "---------------------------------------------------------"
sleep 2;

cd /root/
git clone https://github.com/codeE4/lab.git

echo "---------------------------------------------------------"
echo "---------------------Build Complete----------------------"
echo "---------------------------------------------------------"
echo "----------------Dont do anything illegal-----------------"
echo "---------------------------------------------------------"
echo "--------------------------or-----------------------------"
echo "--------------------S------------------------------------"
echo "-------------------------T-------------------------------"
echo "-------------------------------A-------------------------"
echo "------------------------------------Y--------------------"
echo "-------------------------------A-------------------------"
echo "-------------------------N-------------------------------"
echo "--------------------O------------------------------------"
echo "---------------N-----------------------------------------"
echo "---------Y-----------------------------------------------"
echo "---M-----------------------------------------------------"
echo "---------O-----------------------------------------------"
echo "---------------U-----------------------------------------"
echo "---------------------S-----------------------------------"
echo "---------------------------------------------------------"
