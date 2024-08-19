#!/bin/bash
sudo yum update -y
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
sudo echo "<html>
<head>
<title>PGW Website Example</title>
</head>
<body>
<h1>PGW Server 1</h1>
<p>This is PGW Server 1</p>
</body>
</html>" > /usr/share/nginx/html/index.html
sudo systemctl restart nginx