IMAGE_TAG=mysinmyc/ekanited
srcdir=$(PWD)


build: ekanited
	docker build -t $(IMAGE_TAG) .

ekanited: 
	docker run --userns host --rm -v $(srcdir):/go/bin golang sh -c 'mkdir -p $$GOPATH/src/github.com/ekanite && git clone https://github.com/mysinmyc/ekanite.git  $$GOPATH/src/github.com/ekanite/ekanite && go get github.com/ekanite/ekanite/cmd/ekanited'


.PHONY: clean

clean:
	if [ -e $(srcdir)/ekanited ] ; then \
		 rm $(srcdir)/ekanited;  \
	fi
