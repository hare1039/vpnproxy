echo "DO NOT RUN THIS FILE. YET"; exit 0;

# start
docker run -d \
       -v /dev/net/tun:/dev/net/tun \
       -v ${PWD}:/vpn \
       --cap-add=NET_ADMIN \
       --name vpnproxy hare1039/vpnproxy;

# forwarder
docker run -d \
       --name vpnproxy-forward \
       --volumes-from vpnproxy \
       -p 3129:3129 \
       alpine/socat \
       TCP4-LISTEN:3129,fork,reuseaddr UNIX-CONNECT:/vpn/3proxy.sock;

# connect to vpn
docker exec -it vpnproxy openvpn a.ovpn
