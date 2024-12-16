#!/bin/bash

echo "Initializing new SSH agent..."
# spawn ssh-agent
/usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
echo succeeded
chmod 600 ${SSH_ENV}
. ${SSH_ENV} > /dev/null
/usr/bin/ssh-add $SSH_KEY_HOME 
