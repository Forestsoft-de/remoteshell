FROM kroniak/ssh-client

ADD remoteshell.sh /usr/local/bin/remoteshell.sh
RUN chmod 755 /usr/local/bin/remoteshell.sh


ENTRYPOINT [ "/usr/local/bin/remoteshell.sh" ]