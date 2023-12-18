# Config
$apiToken = "pk_50137100_IV0UITEHWM3Z9EBLFWKFJRQN9CSMCNQQ"
$spaceName = "The Constructors"
$listName = "2023 October [MS5]"
$assigneeEmail = "m.karaniewicz.biedna@ancientforgestudio.com"
$statuses = @(
    "ONGOING IMPLEMENTATION",
    "READY TO IMPLEMENT",
    "TO DO"
)

# Const
$spaceCharReplacement = "%20"

# Auth
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "$apiToken")

# Team
$response = (Invoke-WebRequest -Uri "https://api.clickup.com/api/v2/team" -Method GET -Headers $headers).Content | ConvertFrom-Json
$teamId = $response.teams[0].id

# Space
$response = (Invoke-WebRequest -Uri "https://api.clickup.com/api/v2/team/$teamId/space?archived=false" -Method GET -Headers $headers).Content | ConvertFrom-Json 
$spaceId = ($response.spaces | Where-Object { $_.name -eq $spaceName }).id

## Lists in folders
# $response = (Invoke-WebRequest -Uri "https://api.clickup.com/api/v2/space/$spaceId/folder?archived=false" -Method GET -Headers $headers).Content | ConvertFrom-Json

# Folderless lists
$response = (Invoke-WebRequest -Uri "https://api.clickup.com/api/v2/space/$spaceId/list?archived=false" -Method GET -Headers $headers).Content | ConvertFrom-Json
$listId = ($response.lists | Where-Object { $_.name -eq $listName }).id

# Assignee
$response = (Invoke-WebRequest -Uri "https://api.clickup.com/api/v2/list/$listId/member" -Method GET -Headers $headers).Content | ConvertFrom-Json
$assigneeId = ($response.members | Where-Object { $_.email -eq $assigneeEmail }).id

# Tasks
$statusPrefix = "&statuses[]="
$statusString = [string]::Join("", $statuses.ForEach({$statusPrefix + $_.Replace(" ", $spaceCharReplacement)}))

$response = (Invoke-WebRequest -Uri "https://api.clickup.com/api/v2/list/$listId/task?archived=false&assignees[]=$assigneeId$statusString" -Method GET -Headers $headers).Content | ConvertFrom-Json
# $tasks = ($response.tasks | Where-Object { $_.name -eq $listName }).id

foreach ($task in $response.tasks){
    Write-Output $task.name
}