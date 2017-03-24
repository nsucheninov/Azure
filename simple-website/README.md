# “Hello world” website with load balancing 

This template deploys:
1.	Storage account
2.	Availability set
3.	Public IP address
4.	Virtual network with one subnet
5.	Load balancer
6.	Load balancer rule that balances traffic on port 80
7.	N-instances of NAT rules to expose RDP of backend VMs on ports 5000, 5001, etc.
8.	N-instances of virtual machine running Windows
9.	DSC extension that:
    a.	Install IIS role
    b.	Install ASP.NET45 feature
    c.	Disable default site (by using xWebAdministration module
    d.	Copy web content
    e.	Create new website
    f.	Delete source content

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnsucheninov%2FAzure%2Fmaster%2Fsimple-website%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnsucheninov%2FAzure%2Fmaster%2Fsimple-website%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
