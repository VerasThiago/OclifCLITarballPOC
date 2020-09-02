- When you run the command `tarballcli` The terminal uses the PATH environment variable to resolve the command given to an executable. The PATH variable in bash has the following format:  

```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

- He will find and executable file [tarballcli](tarballcli.sh), he basically will run the `/bin/run` of the `tarballcli` folder located in `/usr/local/lib/tarballcli`   
- So to remove this CLI, just remove `tarballcli` folder and sh file from `/usr/local/bin` and `/usr/local/lib` path