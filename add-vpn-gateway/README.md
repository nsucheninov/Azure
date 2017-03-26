# Add a VPN gateway to the existing virtual network for point to site connections

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fnsucheninov%2FAzure%2Fmaster%2Fadd-vpn-gateway%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fnsucheninov%2FAzure%2Fmaster%2Fadd-vpn-gateway%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template adds the "GatewaySubnet" subnet to the existing virtual network and creates a virtual network gateway. You need to provide IP range for VPN clients, a base-64 encoded root certificate.
Use Azure portal or Get-AzureRmVpnClientPackage cmdlet to retrive a URL link and download the VPN client configuration package.
