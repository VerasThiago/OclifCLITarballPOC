## Uninstall

- When you run the command `tarballcli` The terminal uses the PATH environment variable to resolve the command given to an executable. The PATH variable in bash has the following format:  

```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

- He will find and executable file [tarballcli](tarballcli.sh), he basically will run the `/bin/run` of the `tarballcli` folder located in `/usr/local/lib/tarballcli`   
- So to remove this CLI, just remove `tarballcli` folder and sh file from `/usr/local/bin` and `/usr/local/lib` path

## Auto Update


- Autoupdater
  To get the updater to work, set oclif.update.s3.host in package.json to a host that has the files built in ./dist from oclif-dev pack. This host does not need to be an S3 host. To customize the URL paths, see the S3 templates in @oclif/config.

- Autoupdate Channels
  You can have separate channels for releases that work like Google Chrome Channels (such as beta, dev, canary). To create a channel, just change the version in package.json from 1.0.0 to 1.0.0-beta (where "beta" is any string you like). Then when you pack with oclif-dev pack, it will create beta tarballs. The user can change their channel with mycli update beta and will receive all the future releases on that channel.

- Example os testing update plugin
  https://github.com/oclif/plugin-update/blob/master/test/commands/update.test.ts

