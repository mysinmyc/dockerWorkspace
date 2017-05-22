IMAGE_TAG=mysinmyc/mybackupclient
srcdir=$(PWD)


build: rclone 
	docker build -t $(IMAGE_TAG) .

rclone: 
	docker run --rm -v $(srcdir):/go/bin golang go get github.com/mysinmyc/rclone


.PHONY: clean

clean:
	if [ -e $(srcdir)/rclone ] ; then \
		 rm $(srcdir)/rclone;  \
	fi
