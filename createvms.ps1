New-AzureRmResourceGroup -Name magoni_vms-rg -Location AustraliaSouthEast
New-AzResourceGroupDeployment -ResourceGroupName "magoni_vms-rg" -TemplateFile "/home/matthew/magonivwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/magonivwan/VM1parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName "magoni_vms-rg" -TemplateFile "/home/matthew/magonivwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/magonivwan/VM2parameters.json"

az network nic ip-config update --name ipconfig1 --resource-group magoni_vms-rg --nic-name vic-vm01909 --remove PublicIpAddress
Remove-AzureRmPublicIpAddress -Name coles-vic-vm01-ip -ResourceGroupName magoni_vms-rg -force
az network nic ip-config update --name ipconfig1 --resource-group magoni_vms-rg --nic-name vic-vm01910 --remove PublicIpAddress
Remove-AzureRmPublicIpAddress -Name coles-vic-vm02-ip -ResourceGroupName magoni_vms-rg -force


##Set dns name to colesjumphost.australiasoutheast.cloudapp.azure.com
# Get the network interface object
$nic = Get-AzNetworkInterface -Name "vic-vm01911" -ResourceGroupName "magoni_vms-rg"
# Get the public IP address object associated with the network interface
$publicIp = Get-AzPublicIpAddress -Name $nic.IpConfigurations[0].PublicIpAddress.Id.Split('/')[-1] -ResourceGroupName $nic.ResourceGroupName
# Set the DNS label for the public IP address
$publicIp.DnsSettings = @{
    "DomainNameLabel" = "colesjumphost"
}
# Update the public IP address
Set-AzPublicIpAddress -PublicIpAddress $publicIp
