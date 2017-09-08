# ssh-remote-forward

Script that makes it easy to login over ssh to your local machine

```
npm install -g ssh-remote-forward
ssh-remote-forward user@my-public-server.com
```

After running the above you can login to your local machine by doing

```
ssh -p 2200 local-user@my-public-server.com
```

(Note, you have to set `GatewayPorts yes` in your sshd config on your public server)

## License

MIT
