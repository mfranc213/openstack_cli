FROM ubuntu

MAINTAINER Margaret Frances "mfrance222@gmail.com" 

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update

RUN apt-get update
RUN apt-get install -y python-keystoneclient python-swiftclient python-troveclient python-glanceclient python-cinderclient python-heatclient python-ceilometerclient python-neutronclient

RUN apt-get install -y git ssh vim curl zip wget

RUN curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python2.7
RUN pip install 'python-openstackclient==3.2.1'

RUN wget -t 3 -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip &&  \
       unzip -d /usr/sbin /tmp/terraform.zip && rm /tmp/terraform.zip

ADD run.sh /run.sh
CMD /run.sh
RUN chmod +x /run.sh
