FROM ubuntu

MAINTAINER Margaret Frances "mfrance222@gmail.com" 

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  build-essential \
  curl \
  git \
  libffi-dev \
  libpython2.7-dev \
  libssl-dev \
  python2.7 \
  python2.7-dev \
  python-keystoneclient \
  python-swiftclient \
  python-troveclient \
  python-glanceclient \
  python-cinderclient \
  python-heatclient \
  python-ceilometerclient \
  python-neutronclient \
  python-gnocchiclient \
  software-properties-common \
  ssh \
  sudo \
  vim \
  wget \
  zip 

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python2.7
RUN pip install --upgrade pip setuptools virtualenv virtualenvwrapper
RUN pip install 'python-openstackclient==3.2.1'
RUN pip install --upgrade cliff

RUN wget -t 3 -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip &&  \
       unzip -d /usr/sbin /tmp/terraform.zip && rm /tmp/terraform.zip

ADD run.sh /run.sh
CMD /run.sh
RUN chmod +x /run.sh
