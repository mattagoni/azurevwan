# Define variables
$location = "australiasoutheast"
$resourceGroupName = "magoni_vwan-rg"
$vwanName = "magoni_vwan"

##createds vwan with 2 Hubs
New-AzResourceGroup -Location $location -Name $resourceGroupName
$virtualWan = New-AzVirtualWan -ResourceGroupName $resourceGroupName -Name $vwanName -Location $location 
New-AzVirtualHub -VirtualWan $virtualWan -ResourceGroupName $resourceGroupName -Name "hub1" -AddressPrefix "10.0.1.0/24" -Location $location ; New-AzVirtualHub -VirtualWan $virtualWan -ResourceGroupName $resourceGroupName -Name "hub2" -AddressPrefix "10.0.2.0/24" -Location $location 





