#!/bin/sh
# File Name: install_env.sh
# Author: AikenHong
# mail: h.aiken.970@gmail.com
# Created Time: Wed 03 Nov 2021 10:48:10 AM HKT

# TODO: u can change the aiken related info to input or yours.
# and this file is recommended to carry out by bash or zsh in your shell
# and the apex path should be change to urs

# change passwd
echo "do u want change the default passwd? y/n"
read flag
if [ "$flag" = "y" ] ; then
    echo "your passwd"
    read PASS
    echo root:${PASS}|chpasswd
    echo "yout passwd is $PASS"
else
    echo -e "keep your passwd \n ============= \n"
fi

# change download source
version=`cat /etc/issue`
echo "your ubuntu version is ${version}"
echo "change source as default(16.04) y/n"
read flag
if [ "$flag" = "y" ] ; then
    rm /etc/apt/sources.list
    echo "deb http://mirrors.xjtu.edu.cn/ubuntu/ xenial main" >>/etc/apt/sources.list
    echo "deb-src http://mirrors.xjtu.edu.cn/ubuntu/ xenial main" >>/etc/apt/sources.list

    echo "deb http://mirrors.xjtu.edu.cn/ubuntu/ xenial-updates main" >>/etc/apt/sources.list
    echo "deb-src http://mirrors.xjtu.edu.cn/ubuntu/ xenial-updates main" >>/etc/apt/sources.list

    echo "deb http://mirrors.xjtu.edu.cn/ubuntu/ xenial universe" >>/etc/apt/sources.list
    echo "deb-src http://mirrors.xjtu.edu.cn/ubuntu/ xenial universe" >>/etc/apt/sources.list
    echo "deb http://mirrors.xjtu.edu.cn/ubuntu/ xenial-updates universe" >>/etc/apt/sources.list
    echo "deb-src http://mirrors.xjtu.edu.cn/ubuntu/ xenial-updates universe" >>/etc/apt/sources.list

    echo "deb http://mirrors.xjtu.edu.cn/ubuntu/ xenial-security main" >>/etc/apt/sources.list
    echo "deb-src http://mirrors.xjtu.edu.cn/ubuntu/ xenial-security main" >>/etc/apt/sources.list
    echo "deb http://mirrors.xjtu.edu.cn/ubuntu/ xenial-security universe" >>/etc/apt/sources.list
    echo "deb-src http://mirrors.xjtu.edu.cn/ubuntu/ xenial-security universe" >>/etc/apt/sources.list

    echo -e "finishing change source, check your source list  \n ============= \n"
    apt-get update
else
    echo -e "skip changing, modify it manual in /etc/apt/sources.list  \n ============= \n"
fi

echo "init this env y/n/?  \n ============= \n"
read init_f
if [ "${init_f}" = "y" ]; then
    # activate conda
    conda init bash
    source /root/.bashrc

    # install zsh,vim,tmux,htop,
    apt-get install vim tmux htop zsh
    pip install torchstat torchsummary thop
    conda install tensorboard tqdm
    conda init zsh
else
    echo -e "skip init the dev-env for classifier pipeline  \n ============= \n"
fi

# settup git for clone with cnpmjs
git config --global http.sshverify false
git config --global user.name "AikenHong"
git config --global user.email h.aiken.970@gmail.com
export GIT_SSL_NO_VERIFY=1

# TODO: using a simplified version of zsh to install of this
echo "do u want init zsh as ur default shell? y/n"
read flag
if [ "$flag" = "y" ] ; then
    chsh -s /bin/zsh
    # install oh my zsh
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    echo -e "fi install oh-my-zsh , then we will install plugins  \n ============= \n"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com.cnpmjs.org/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo -e "clone the repo for zsh's plugins, need to settup in the zshrc  \n ============= \n"

    # add nvcc in env after zsh
    echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\$LD_LIBRARY_PATH" >>~/.zshrc
    echo "export PATH=/usr/local/cuda/bin:\$PATH" >>~/.zshrc
    echo "export LC_ALL=en.US.UTF-8" >>~/.zshrc
    echo "export Lang=en.US.UTF-8" >>~/.zshrc

else
    echo -e "skip install zsh \n ============= \n "
fi

# generate the ssh-key for forward used
if  [ -f ~/.ssh/*.pub ]
then
    echo -e "ssh key had been generate already! \n ============= \n"
else
    echo -e "generate ssh-key for github used ↓ \n ============= \n"
    ssh-keygen -t ed25519 -C "h.aiken.970@gmail.com"
fi

# TODO: config vim by clone my repo
git clone https://github.com/AikenH/configs_scripts.git ~/.aiken_configs
cp ~/.aiken_configs/.vimrc ~/.vimrc

# install opencv, augmentation
echo " install opencv y/n ?"
read opencv_f
if [ "$opencv_f" = "y" ] ; then
    apt-get install -y python-opencv
    pip install opencv
    pip install -U albumentations
else
    echo -e "skip install opencv and albumentations \n ============= \n"
fi

# install apex
echo "Do u want install apex in this env y/n?"
read apex_f
if [ "$apex_f" = "y" ] ; then
    cd /workspace/temp/apex
    pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
else
    echo -e "skip install apex for now  \n ============= \n"
fi
