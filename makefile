secure-port-forwarding:
		# execute from client
		#ssh -L 49172:localhost:49172 edward@codespace.top -i ~/.ssh/id_rsa_ben -p 2222
		autossh -L 49172:localhost:49172 edward@codespace.top -i ~/.ssh/id_rsa_ben -p 2222
server:
		docker run --name mirror-server --restart unless-stopped -d --init -it -u $$(id -u):$$(id -g) -v /home/edward/Desktop/ROOT/SHARED:/data -p 49172:49172 mirror server
client:
	docker run --name mirror-client --restart unless-stopped -d --net=host -u $$(id -u):$$(id -g) -v /home/edward/Desktop/ROOT/SHARED:/data -it mirror client -l /data -r /data -h localhost
		

