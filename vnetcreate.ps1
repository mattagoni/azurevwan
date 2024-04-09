##Spin up Virtual Networks for vwan with connection into hubs

##Create vNET and VM Resoure Groups for virtual networks for vwan
New-AzureRmResourceGroup -Name magoni-vnet-rg -Location AustraliaSouthEast

##Create vnet1 for vwan testing
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni-vnet-rg -Location AustraliaSouthEast -Name vNET1 -AddressPrefix 192.168.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network1 -AddressPrefix 192.168.1.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network2 -AddressPrefix 192.168.2.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork

##Create vnet2 for vwan testing
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni-vnet-rg -Location AustraliaSouthEast -Name vNET2 -AddressPrefix 172.16.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network1 -AddressPrefix 172.16.1.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network2 -AddressPrefix 172.16.2.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork


##virtual network connect vnet1 into hub1
$resourceGroup = Get-AzResourceGroup -ResourceGroupName "magoni_vwan-rg" 
$virtualWan = Get-AzVirtualWan -ResourceGroupName "magoni_vwan-rg" -Name "magoni_vwan"
$virtualHub = Get-AzVirtualHub -ResourceGroupName "magoni_vwan-rg" -Name "Hub1"
$remoteVirtualNetwork = Get-AzVirtualNetwork -Name "VNet1" -ResourceGroupName "magoni-vnet-rg"
New-AzVirtualHubVnetConnection -ResourceGroupName "magoni_vwan-rg" -VirtualHubName "Hub1" -Name "vnet1-to-hub" -RemoteVirtualNetwork $remoteVirtualNetwork

##virtual network connect vnet2 into hub2
$resourceGroup = Get-AzResourceGroup -ResourceGroupName "magoni_vwan-rg" 
$virtualWan = Get-AzVirtualWan -ResourceGroupName "magoni_vwan-rg" -Name "magoni_vwan"
$virtualHub = Get-AzVirtualHub -ResourceGroupName "magoni_vwan-rg" -Name "Hub2"
$remoteVirtualNetwork = Get-AzVirtualNetwork -Name "VNet2" -ResourceGroupName "magoni-vnet-rg"
New-AzVirtualHubVnetConnection -ResourceGroupName "magoni_vwan-rg" -VirtualHubName "Hub2" -Name "vnet2-to-hub" -RemoteVirtualNetwork $remoteVirtualNetwork

echo "You need to manually go into each hub and within the virtual network connection add both hubs under route propgation"
