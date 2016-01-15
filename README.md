# Database backup cron

Edit the script and set it to cronjob

```sh
$ crontab -e
```

Content

```
* * * * * /home/user/path/to/cron/mysql.sh >> /dev/null 2>&1
```

## License

Released under the [GPL](http://www.gnu.org/licenses/gpl.html)
