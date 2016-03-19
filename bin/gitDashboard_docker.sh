#!/bin/bash
function installGd {
	docker run \
			-e  GITDASHBOARD_DBTYPE=sqlite3\
			-e GITDASHBOARD_DBCONNECTION=/data/gd/db.sqlite3 \
			-e GIT_PROJECT_ROOT=/data/gd/repos \
			-e GIT_LDAP_CONNECTION="ldap://vlxildap11.intra.infocamere.it:389/" \
			-e GIT_LDAP_BASEDN="ou=utenti,o=Sistema Camerale,c=It"\
			-v /data/gd:/data/gd\
			-d -p 9000:9000\
			--name gitdashboard-cnt\
			gitdashboard/gitdashboard &> /dev/null
			
}

function startGd {
	docker start gitdashboard-cnt
	if [ $? -ne 0 ];then
		echo "No container found, installing one..."
		installGd
	fi
}


case "$1" in
	"start")
		startGd
		;;
	"stop")
		docker stop gitdashboard-cnt
		;;
	"restart")
		docker stop gitdashboard-cnt
		startGd
		;;
	"reinstall")
		docker rm gitdashboard-cnt
		startGd
		;;
	"kill")
		docker kill gitdashboard-cnt
		;;
	*)
		echo "Usage $0 [start|stop|restart|kill|reinstall]"
		exit 1
esac
exit 0
