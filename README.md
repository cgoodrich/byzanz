#Byzanz scripts
- This repo helps you to easily make screencasts on Unix (.gif)

#What it's for
- Mostly, when you need to screencast + upload to JIRA/Confluence or
    share some bug with your team.

#How to
- [Original Reference Article](http://askubuntu.com/questions/107726/how-to-create-animated-gif-images-of-a-screencast)

#Dependencies
- Install [xrectsel](https://github.com/lolilolicon/xrectsel)

- Install Byzanz

```
sudo apt-get install byzanz
```

#Note
- I have modified the scripts a bit from that original article

#In your ```~/.bash_profile```

```
# Set it up so that you can just type "record" on the CLI and it will record
#
# NOTE: Images are saved to ${HOME}/Pictures by
#       default with timestamps in the filename.
alias record='cd ${BYZANZ_REPO_CLONE_PATH} && ./byzanz-record-region.sh'
```
