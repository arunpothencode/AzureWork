$comp = Read-Host "Select the component:
======================
Press 1 for Pipelines
Press 2 for Linkedservice
Press 3 for Dataflow
Press 4 for Dataset

ctrl + c to abort the operation
======================================>"


$inppara = Get-Content "C:\Users\arun.r\Documents\Sharath\names.txt"

if($comp -eq 1){
    
    function ExecPipeline {
        param ([string]$PipelineName)

        Get-AzSynapsePipeline -WorkspaceName pstestarun -Name $PipelineName 
        #Set-AzSynapsePipeline -WorkspaceName pstestarun -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                          }

    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'pipeline'){
        &ExecPipeline($i.split(',')[0])
                                           }

                           }continue


                }
elseif($comp -eq 2){


    function ExecLinkedService {
        param ([string]$LinkedName)

        Get-AzSynapseLinkedService -WorkspaceName pstestarun -Name $LinkedName 
        #Set-AzSynapsePipeline -WorkspaceName pstestarun -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                               }
                     
    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'linkedservice'){
        &ExecLinkedService($i.split(',')[0])
                                                }

                           }continue

                   }
elseif($comp -eq 3){


    function ExecDataflow {
        param ([string]$DataflowName)

        Get-AzSynapseDataFlow -WorkspaceName pstestarun -Name $DataflowName 
        #Set-AzSynapsePipeline -WorkspaceName pstestarun -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"

                               }
                     
    foreach($i in $inppara){
        if($i.split(',')[1] -eq 'dataflow'){
        &ExecDataflow($i.split(',')[0])
                                                }

                           }continue

                   }


