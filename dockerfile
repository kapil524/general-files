FROM centos:7
#RUN  yum update -y 
RUN  yum install openssh-server -y 
RUN  useradd remote_user 
RUN  echo "12345" |passwd --stdin remote_user 
RUN  mkdir /home/remote_user/.ssh 
RUN  chmod 700 /home/remote_user/.ssh  
   
COPY remote-key.pub  /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user/.ssh && \
    chmod  600 /home/remote_user/.ssh/authorized_keys

RUN  /usr/sbin/sshd-keygen

CMD ["/usr/sbin/sshd", "-D"] 
