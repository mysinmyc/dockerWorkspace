IMAGE_TAG=mysinmyc/mybackupclient
srcdir=$(PWD)


build: rclone 
	docker build -t $(IMAGE_TAG) .

rclone: 
	docker run --userns host --rm -v $(srcdir):/go/bin golang sh -c 'mkdir -p $$GOPATH/src/github.com/ncw/rclone && git clone https://github.com/mysinmyc/rclone.git  $$GOPATH/src/github.com/ncw/rclone && go get github.com/ncw/rclone'

.PHONY: clean

clean:
	if [ -e $(srcdir)/rclone ] ; then \
		 rm $(srcdir)/rclone;  \
	fi
