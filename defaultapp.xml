try
{
    Write-Host "Starting script execution..."
    $namespaceName = "root\cimv2\mdm\dmmap"
    $className = "MDM_Policy_Config01_ApplicationDefaults02"
    $obj=Get-CimInstance -Namespace $namespaceName -ClassName $className -Filter "ParentID='./Vendor/MSFT/Policy/Config' and InstanceID='ApplicationDefaults'"
    if($obj)
    {
        $obj.DefaultAssociationsConfiguration = 'PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjxEZWZhdWx0QXNzb2NpYXRpb25zPg0KICA8QXNzb2NpYXRpb24gSWRlbnRpZmllcj0iLmh0bSIgUHJvZ0lkPSJDaHJvbWVIVE1MIiBBcHBsaWNhdGlvbk5hbWU9Ikdvb2dsZSBDaHJvbWUiIC8+DQogIDxBc3NvY2lhdGlvbiBJZGVudGlmaWVyPSIuaHRtbCIgUHJvZ0lkPSJDaHJvbWVIVE1MIiBBcHBsaWNhdGlvbk5hbWU9Ikdvb2dsZSBDaHJvbWUiIC8+DQogIDxBc3NvY2lhdGlvbiBJZGVudGlmaWVyPSJodHRwIiBQcm9nSWQ9IkNocm9tZUhUTUwiIEFwcGxpY2F0aW9uTmFtZT0iR29vZ2xlIENocm9tZSIgLz4NCiAgPEFzc29jaWF0aW9uIElkZW50aWZpZXI9Imh0dHBzIiBQcm9nSWQ9IkNocm9tZUhUTUwiIEFwcGxpY2F0aW9uTmFtZT0iR29vZ2xlIENocm9tZSIgLz4NCjwvRGVmYXVsdEFzc29jaWF0aW9ucz4='
        Set-CimInstance -CimInstance $obj
    }
    else
    {
        $obj = New-CimInstance -Namespace $namespaceName -ClassName $className -Property @{ParentID="./Vendor/MSFT/Policy/Config";InstanceID="ApplicationDefaults";DefaultAssociationsConfiguration="PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4NCjxEZWZhdWx0QXNzb2NpYXRpb25zPg0KICA8QXNzb2NpYXRpb24gSWRlbnRpZmllcj0iLmh0bSIgUHJvZ0lkPSJDaHJvbWVIVE1MIiBBcHBsaWNhdGlvbk5hbWU9Ikdvb2dsZSBDaHJvbWUiIC8+DQogIDxBc3NvY2lhdGlvbiBJZGVudGlmaWVyPSIuaHRtbCIgUHJvZ0lkPSJDaHJvbWVIVE1MIiBBcHBsaWNhdGlvbk5hbWU9Ikdvb2dsZSBDaHJvbWUiIC8+DQogIDxBc3NvY2lhdGlvbiBJZGVudGlmaWVyPSJodHRwIiBQcm9nSWQ9IkNocm9tZUhUTUwiIEFwcGxpY2F0aW9uTmFtZT0iR29vZ2xlIENocm9tZSIgLz4NCiAgPEFzc29jaWF0aW9uIElkZW50aWZpZXI9Imh0dHBzIiBQcm9nSWQ9IkNocm9tZUhUTUwiIEFwcGxpY2F0aW9uTmFtZT0iR29vZ2xlIENocm9tZSIgLz4NCjwvRGVmYXVsdEFzc29jaWF0aW9ucz4="}
    }
    
}
catch
{
    $_.Exception.Message
}

Write-Host "Script execution completed."