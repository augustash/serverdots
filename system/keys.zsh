# Remove the hosts that I don't want to keep around- in this case, only
# keep the first host.
alias hosts="head -2 ~/.ssh/known_hosts | tail -1 > ~/.ssh/known_hosts"
