FROM nimmis/golang:1.5.3

RUN apt-get update
RUN apt-get install -y libgit2-22 libldap-2.4-2

RUN go get -v github.com/gitDashboard/gitDashboard
RUN go get -v github.com/revel/cmd/revel
RUN go get -v ...
RUN /gopath/bin/revel build github.com/gitDashboard/gitDashboard /gitDashboard

EXPOSE 9000

ENTRYPOINT ["/gitDashboard/run.sh"]

