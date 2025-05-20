$picturebox1_LoadCompleted=[System.ComponentModel.AsyncCompletedEventHandler]{
    #Event Argument: $_ = [System.ComponentModel.AsyncCompletedEventArgs]
    
        if ($_.Error -ne $null)
        {
            $labelMessage.Text  = $_.Error.Message
        }
    }