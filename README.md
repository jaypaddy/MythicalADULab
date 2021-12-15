# MythicalADU

* Create a Resource Group
az group create --name MythicalADU_Lab_RG --location CentralUS

* Deploy a Linux VM
    ```az vm create --resource-group <RESOURCE_GROUP> --name MythicalADULab1 --image UbuntuLTS --size Standard_DS1 --admin-username azureuser --admin-username YYYYYYYYYY --admin-password XXXXXXXXXXXXXX```

* Create IoT Hub
* Create Edge/Gateway in IoT Hub
* Create Device Update in Azure
* Create Device Update Instance (Link IoT Hub to ADU)
* Install and Configure IoT Edge
    - ```curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list```  
    - ```sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/```  
    - ```curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg```
    - ```sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/```  
    - ```sudo apt-get update```  
    - ```sudo apt update && sudo apt-get install -y moby-engine && sudo apt-get install -y aziot-edge```  
    - ```sudo iotedge config mp --connection-string 'CONNECTION STRING'```  
    - ```sudo iotedge config apply```   

* Install ADU Delivery Optimization Agent
    - ```sudo apt-get install deviceupdate-agent deliveryoptimization-plugin-apt```  
* Restart ADU
    - ```sudo systemctl restart adu-agent```  
    - ```sudo systemctl status adu-agent```  
* Check IoTEdge System Logs
    - ```sudo aziotctl system logs```  
* Check ADU Agent Logs
    - ```sudo journalctl -u adu-agent```  
* Verify that libcur-doc is not installed
    - ```apt list --installed | grep libcurl```  
* Review twin in IoT Hub and add tag
    - ```"tags": {"ADUGroup": "ADULAB"},```  
* In Azure Portal goto Device Update for IoT Hub
    - Create ADU Group
    - Import an Update
    - Create Deployment
* On Ubuntu, monitor the progress  
    - ```sudo journalctl -u adu-agent```  
* Verify that libcurl-doc is installed
    - ```apt list --installed | grep libcurl```  


Gateway Only....
    - IoT Gateway  
    ```sudo apt-get install aziot-identity-service```  
    ```sudo cp /etc/aziot/config.toml.template /etc/aziot/config.toml```  
    ```sudo nano /etc/aziot/config.toml```  
    ```sudo aziotctl config apply -c '/etc/aziot/config.toml'``` 