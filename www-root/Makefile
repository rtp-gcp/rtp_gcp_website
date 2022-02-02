# set the default goal.
.DEFAULT_GOAL := list_docs
#.phony: list_docs gitupdate clean



list_docs:
	ls -l



gitupdate: clean
	git add .; git commit -m "update www-root"; git push

clean:
	echo "docs: make clean"
	#-find . -name "*.backup" -print | xargs rm
	-rm *.backup *.BACKUP *.swp *.key


# https://cloud.google.com/storage/docs/gsutil/commands/rsync
#
# using rsync in parallel mode, upload all new/changed files.  Use compression
# on html and css files.  Ignore .swp and .bak files.  
#
# NOTE: the docs say to use $ to match end of file name, but that causes errors.
#
# NOTE: the other examples are commented out rookie techniques for reference only
deploy:
	gsutil -m rsync -j html,css -r -x ".*\.swp|.*\.bak"  . gs://www.rtp-gcp.org
#	gsutil cp index.html gs://www.rtp-gcp.org
#	gsutil cp -r css  gs://www.rtp-gcp.org
#	gsutil cp -r imgs  gs://www.rtp-gcp.org
#	gsutil cp -m -r -j html,css www-root/.  gs://www.rtp-gcp.org
#	gsutil rsync -j html, css -m -x ".*\.bak$|.*\.jpg$" www-root gs://www.rtp-gcp.org



