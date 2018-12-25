case "$1" in 
start)
	GEOSERVER_HOME=/usr/share/geoserver/
   /usr/share/geoserver/bin/startup.sh &
   echo $!>/var/run/GeoserverStartup.pid
   ;;
stop)
   kill `cat /var/run/GeoserverStartup.pid`
   rm /var/run/GeoserverStartup.pid
   ;;
restart)
   $0 stop
   $0 start
   ;;
status)
   if [ -e /var/run/GeoserverStartup.pid ]; then
      echo GeoserverStartup.sh is running, pid=`cat /var/run/GeoserverStartup.pid`
   else
      echo GeoserverStartup.sh is NOT running
      exit 1
   fi
   ;;
*)
   echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0
