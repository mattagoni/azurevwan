$resourceGroup = Get-AzResourceGroup -ResourceGroupName "magoni_vwan-rg" 
$virtualWan = Get-AzVirtualWan -ResourceGroupName "magoni_vwan-rg" -Name "magoni_vwan"
$virtualHub = Get-AzVirtualHub -ResourceGroupName "magoni_vwan-rg" -Name "Hub1"
$remoteVirtualNetwork = Get-AzVirtualNetwork -Name "VNet1" -ResourceGroupName "magoni-vnet-rg"
New-AzVirtualHubVnetConnection -ResourceGroupName "magoni_vwan-rg" -VirtualHubName "Hub1" -Name "vnet1-to-hub" -RemoteVirtualNetwork $remoteVirtualNetwork

$resourceGroup = Get-AzResourceGroup -ResourceGroupName "magoni_vwan-rg" 
$virtualWan = Get-AzVirtualWan -ResourceGroupName "magoni_vwan-rg" -Name "magoni_vwan"
$virtualHub = Get-AzVirtualHub -ResourceGroupName "magoni_vwan-rg" -Name "Hub2"
$remoteVirtualNetwork = Get-AzVirtualNetwork -Name "VNet2" -ResourceGroupName "magoni-vnet-rg"
New-AzVirtualHubVnetConnection -ResourceGroupName "magoni_vwan-rg" -VirtualHubName "Hub2" -Name "vnet2-to-hub" -RemoteVirtualNetwork $remoteVirtualNetwork
