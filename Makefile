# http://www.gnu.org/software/make/manual/make.html#Special-Variables

# set the default goal.
# I want the default to really just dump contents of dirs
# as a stub.  For instance, I don't want it to
# push code or
.DEFAULT_GOAL := deploy
#.phony: all deploy gitupdate clean $(DIRS)

TOPTARGETS := all clean

SUBDIRS := docs imgs my-assets not-mine official-assets www-root 


$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	echo "make arg is" $(MAKECMDGOALS)
	$(MAKE) -C $@ $(MAKECMDGOALS)




SUBCLEAN = $(addsuffix .clean,$(SUBDIRS))

clean: $(SUBCLEAN)

$(SUBCLEAN): %.clean:
#	echo "top: make clean"
#	echo "top: subdirs is $(SUBDIRS)"
#	echo "clean in top dir"
#	echo "first prereq "$<
#	echo "top: all prereqs "$?
#	echo "top: all prereqs " $(SUBDIRS)
#	make -C $? clean
	-rm *.backup *.swp *.BACKUP
	$(MAKE) -C $* clean





# https://cloud.google.com/storage/docs/gsutil/commands/rsync
#
# using rsync in parallel mode, upload all new/changed files.  Use compression
# on html and css files.  Ignore .swp and .bak files.  
#
# NOTE: the docs say to use $ to match end of file name, but that causes errors.
#
# NOTE: the other examples are commented out rookie techniques for reference only
deploy:
	gsutil -m rsync -j html,css -r -x ".*\.swp|.*\.bak"  www-root gs://www.rtp-gcp.org
#	gsutil cp index.html gs://www.rtp-gcp.org
#	gsutil cp -r css  gs://www.rtp-gcp.org
#	gsutil cp -r imgs  gs://www.rtp-gcp.org
#	gsutil cp -m -r -j html,css www-root/.  gs://www.rtp-gcp.org
#	gsutil rsync -j html, css -m -x ".*\.bak$|.*\.jpg$" www-root gs://www.rtp-gcp.org


gitupdate: clean
	git add --all; git commit -m "wip"; git push

