##Spin up Virtual Networks for vwan

##Create vNET and VM Resoure Groups for virtual networks for vwan
New-AzureRmResourceGroup -Name magoni-VicNetwork-rg -Location AustraliaSouthEast

##Create vnet1 for vwan testing
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName magoni-VicNetwork-rg -Location AustraliaSouthEast -Name vNET1 -AddressPrefix 10.1.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network1 -AddressPrefix 192.168.1.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network2 -AddressPrefix 192.168.2.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork

##Create vnet2 for vwan testing
$virtualNetwork = New-AzVirtualNetwork -ResourceGroupName vNET2-rg -Location AustraliaSouthEast -Name vNET2 -AddressPrefix 172.16.0.0/16
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network1 -AddressPrefix 172.16.1.0/24 -VirtualNetwork $virtualNetwork
$subnetConfig = Add-AzVirtualNetworkSubnetConfig -Name network2 -AddressPrefix 172.16.2.0/24 -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork
