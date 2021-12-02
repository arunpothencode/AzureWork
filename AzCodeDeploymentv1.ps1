$parameterfile = Get-Content "C:\Users\arun.r\Documents\Sharath\names.txt"
$inppara = Get-Content "C:\Users\arun.r\Documents\Sharath\names.txt"| Select-Object -Skip 1
Write-Host "###########Parameter file contains##############"
$parameterfile

function ExecPipeline {
        param ([string]$PipelineName,[string]$WorkspaceName)

        (Get-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json).replace('dev', 'qa') | Set-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json
        #Get-AzSynapsePipeline -WorkspaceName $WorkspaceName -Name $PipelineName }
        Set-AzSynapsePipeline -WorkspaceName $WorkspaceName -Name $PipelineName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$PipelineName.json"}

foreach($p in $inppara){
    if($p.split(',')[1] -eq 'pipeline'){
    &ExecPipeline $p.split(',')[0] $p.split(',')[2]
}}

function ExecDataset {
        param ([string]$DatasetName,[string]$WorkspaceName)
        
        (Get-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$DatasetName.json).replace('dev', 'qa') | Set-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$DatasetName.json
        #Get-AzSynapseDataset -WorkspaceName $WorkspaceName -Name $DatasetName }
        Set-AzSynapseDataset -WorkspaceName $WorkspaceName -Name $DatasetName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\dataset\$DatasetName.json"}


foreach($d in $inppara){
    if($d.split(',')[1] -eq 'dataset'){
    &ExecDataset $d.split(',')[0] $d.split(',')[2]
}}

function ExecLinked {
        param ([string]$LinkedName,[string]$WorkspaceName)

        (Get-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$LinkedName.json).replace('dev', 'qa') | Set-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$LinkedName.json}
        #Get-AzSynapseLinkedService -WorkspaceName $WorkspaceName -Name $LinkedName }
        #Set-AzSynapseLinkedService -WorkspaceName $WorkspaceName -Name $LinkedName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\linkedservice\$LinkedName.json"

foreach($l in $inppara){
    if($l.split(',')[1] -eq 'linkedservice'){
    &ExecLinked $l.split(',')[0] $l.split(',')[2]
}}

function ExecDataflow {
        param ([string]$FlowName,[string]$WorkspaceName)
        
        (Get-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$FlowName.json).replace('dev', 'qa') | Set-Content C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\pipeline\$FlowName.json}
        #Get-AzSynapseDataFlow -WorkspaceName $WorkspaceName -Name $FlowName }
        #Set-AzSynapseDataFlow -WorkspaceName $WorkspaceName -Name $FlowName -DefinitionFile "C:\Users\arun.r\Documents\Sharath\StandardPipeline_support_live\dataflow\$FlowName.json"

foreach($f in $inppara){
    if($f.split(',')[1] -eq 'dataflow'){
    &ExecDataflow $f.split(',')[0] $f.split(',')[2]
}}