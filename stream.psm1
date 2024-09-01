
$global:playlist = import-clixml 'c:\ex-sys\xml\playlist.xml'
$completor ={ 
  param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
  $playlist | Where-Object {$_.title -like "$wordTocomplete*"}  | ForEach-Object {
    $_.title


  }
                            }
Register-ArgumentCompleter -commandname play-stream -parameterName name -scriptblock $completor
Register-ArgumentCompleter -commandname unsubscribe-playlist -parameterName name -scriptblock $completor


function subscribe-playlist {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory)]
      [string]
      $url,
      # Parameter help description
      [Parameter(Mandatory)]
      [string]
      $name
      ,
      # Parameter help description
      [Parameter()]
      [string]
      $platform = 'twitch'
  )
  


$urlid =[int](( $playlist |Select-Object -Property urlid -last 1).urlid)+1 
  $newplaylist = New-Object PSObject -Property @{

    'url' = $url
    'title'= $name 
    'platform' = $platform
    'urlid'  = $urlID
    'status' = $null
  }
  $newplaylist = $playlist + $newplaylist
  $newplaylist | export-clixml 'c:\ex-sys\xml\playlist.xml'
}

function  unsubscribe-playlist  {
 [CmdletBinding()]
 param (
     [Parameter()]
     [string]
     $name
 
 )
    

 $newplaylist = $playlist |Where-Object {$_.title -ne "*$name*"}

 try {
    $newplaylist | export-clixml 'c:\ex-sys\xml\playlist.xml'
 }
 catch {
'name dose not exist ' 
 }


}



function play-stream{ 
  [CmdletBinding()]
  param (
      [Parameter()]
      [string]
      $name
  )

  
  $url= (Import-Clixml 'c:\ex-sys\xml\playlist.xml'|Where-Object {$_.title -like "$name"}|Select-Object -Property url).url
    

    $link = &  "F:\streamlink\venvs\streamlink\Scripts\python.exe" $pshome\modules\stream\link.py --url  $url
    
    for ($i = 0; $i -lt 5) {
      switch ($link) {
        error { $link = & "F:\streamlink\venvs\streamlink\Scripts\python.exe" $pshome\modules\stream\link.py --url  $url 
      $i++}
        Default { 
          
          
          if ($url -like "*live.bilibili.com*") {
            & "F:\program files\完美解码\Pure Codec\x64\PotPlayerMini64.exe" /url $url
          }
        
          else {
            & "F:\program files\完美解码\Pure Codec\x64\PotPlayerMini64.exe" /url $link
          }
          
   
      $i = 5
      }
        "no play able stream" {

          Write-Host 'no play able stream'
          $i=5
        }
      } 

      if ($i -eq 5 -and $link -eq 'error') {
        Write-Host ' Max retries fail ,please check the internet'

      }
    }



  
 


}

function list-subscribe {
  [CmdletBinding()]
  param (
      [Parameter()]
      [string]
      $name
  )
  class newlist {
      [string] $url 
      [string] $status
  
      newlist([string] $url, [string] $status) {
          $this.url = $url
          $this.status = $status
      }
  }
  class streamslist {
      [string] $url 
      [string] $status
      
      static [System.Collections.Generic.List[newlist]] $newlist
    
      static [void] Initialize()             { [streamslist]::Initialize($false) }
      static [bool] Initialize([bool]$force) {
          if ([streamsList]::newlist.Count -gt 0 -and -not $force) {
              return $false
          }
  
          [streamsList]::newlist = [System.Collections.Generic.List[newlist]]::new()
  
          return $true
      }   
  
      static [void] Add([newlist]$newlist) {
          [streamsList]::Initialize()
          [streamslist]::newlist.Add($newlist)
       
      }
  
  }
  
  
  
  
  $list = import-clixml 'c:\ex-sys\xml\playlist.xml' 
  
  $list| Where-Object {$_.title -like "*$name*"} | ForEach-Object  {
      $status = f:\streamlink\venvs\streamlink\Scripts\python.exe "$pshome\Modules\stream\live.py" --url $_.url
  
      $newlist = [newlist]::new($_.url,$status)
    
      [streamslist]::Add($newlist)
    
  }
  [streamslist]::newlist  

}