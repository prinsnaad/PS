﻿function Install-MDT2013 {
    New-SmbShare -Name DeploymentShare$ -Path $DeploymentShare -FullAccess Administrator -ReadAccess Everyone