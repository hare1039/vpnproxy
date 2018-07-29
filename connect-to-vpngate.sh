
if [[ "$@" == "" ]]; then
	echo "Give me a openvpn link or openvpn conf file";
	exit 0;
fi

TARGET="$@";
OVPN_CONF_FILE="http.ovpn" 
echo "Stoping....";
# clean up
docker stop vpnproxy-forward vpnproxy;
sudo rm -f ./3proxy.sock $OVPN_CONF_FILE;

# target is http link
if [[ "$TARGET" == "http"* ]]; then
	curl -o $OVPN_CONF_FILE "$TARGET"
else
	cp $TARGET $OVPN_CONF_FILE
fi

docker start vpnproxy vpnproxy-forward;
# start a screen
screen docker exec -it vpnproxy openvpn $OVPN_CONF_FILE
