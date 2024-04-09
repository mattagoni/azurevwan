New-AzureRmResourceGroup -Name magoni_vms-rg -Location AustraliaSouthEast
New-AzResourceGroupDeployment -ResourceGroupName "magoni_vms-rg" -TemplateFile "/home/matthew/magonivwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/magonivwan/VM1parameters.json"
New-AzResourceGroupDeployment -ResourceGroupName "magoni_vms-rg" -TemplateFile "/home/matthew/magonivwan/vmcreatetemplate.json" -TemplateParameterFile "/home/matthew/magonivwan/VM2parameters.json"

az network nic ip-config update --name ipconfig1 --resource-group magoni_vms-rg --nic-name vic-vm01909 --remove PublicIpAddress
Remove-AzureRmPublicIpAddress -Name coles-vic-vm01-ip -ResourceGroupName magoni_vms-rg -force
az network nic ip-config update --name ipconfig1 --resource-group magoni_vms-rg --nic-name vic-vm01910 --remove PublicIpAddress
Remove-AzureRmPublicIpAddress -Name coles-vic-vm02-ip -ResourceGroupName magoni_vms-rg -force
