#!/bin/bash
apt-get update -y
apt-get install -y apache2 awscli

# Get instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Create HTML file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
</head>
<body>
  <h1>Terraform Project Server</h1>
  <h2>Instance ID: $INSTANCE_ID</h2>
  <p>Welcome to Cloud Server</p>
</body>
</html>
EOF

# Start Apache
systemctl start apache2
systemctl enable apache2
