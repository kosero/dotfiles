#!/bin/sh

sudo mkdir -p /etc/cron.weekly

sudo tee /etc/cron.weekly/fstrim << 'EOF'
#!/bin/sh

fstrim /
EOF

sudo chmod u+x /etc/cron.weekly/fstrim
