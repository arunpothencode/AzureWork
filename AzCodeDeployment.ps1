$comp = Read-Host "Select the component:
======================
Press 1 for Pipelines
Press 2 for Linkedservice
Press 3 for Dataflow
Press 4 for Dataset

ctrl + c to abort the operation
======================================>"



$inppara = Get-Content "C:\Users\arun.r\Documents\Sharath\names.txt"| Select-Object -Skip 1


if($comp -eq 1){
    
    function ExecPipeline {
        param ([string]$PipelineName,[string]$WorkspaceName)

        Get-AzSynapsePipeline -WorkspaceName $WorkspaceName -Name $PipelineName 
        #Set-AzSynapsePipeline -WorkspaceName $WorkspaceName -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                          }

    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'pipeline'){
        &ExecPipeline $i.split(',')[0] $i.split(',')[2]
                                           }

                           }continue


                }
elseif($comp -eq 2){


    function ExecLinkedService {
        param ([string]$LinkedName,[string]$WorkspaceName)

        Get-AzSynapseLinkedService -WorkspaceName $WorkspaceName -Name $LinkedName 
        #Set-AzSynapsePipeline -WorkspaceName $WorkspaceName -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                               }
                     
    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'linkedservice'){
        &ExecLinkedService $i.split(',')[0] $i.split(',')[2]
                                                }

                           }continue

                   }
elseif($comp -eq 3){


    function ExecDataflow {
        param ([string]$DataflowName,[string]$WorkspaceName)

        Get-AzSynapseDataFlow -WorkspaceName $WorkspaceName -Name $DataflowName 
        #Set-AzSynapsePipeline -WorkspaceName $WorkspaceName -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                               }
                     
    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'dataflow'){
        &ExecDataflow $i.split(',')[0] $i.split(',')[2]
                                                }

                           }continue

                   }
elseif($comp -eq 4){


    function ExecDataset {
        param ([string]$DatasetName,[string]$WorkspaceName)

        Get-AzSynapseDataset -WorkspaceName $WorkspaceName -Name $DatasetName 
        #Set-AzSynapseDataset -WorkspaceName $WorkspaceName -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                               }
                     
    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'dataset'){
        &ExecDataset $i.split(',')[0] $i.split(',')[2]
                                                }

                           }continue

                   }