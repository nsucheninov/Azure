Configuration WebServer
{
  param 
  ( 
	# Target nodes to apply the configuration 
    [string[]]$NodeName = "localhost",

	# Name of the website to create 
    [Parameter(Mandatory)] 
    [ValidateNotNullOrEmpty()] 
    [String]$WebSiteName
  ) 

  Import-DscResource -ModuleName xWebAdministration
  
  Node $NodeName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure 	= "Present"
      Name 		= "Web-Server"
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure 	= "Present"
      Name 		= "Web-Asp-Net45"
	  DependsOn = "[WindowsFeature]IIS"
    }

    # Stop the default website
    xWebsite DefaultSite 
    {
        Ensure          = "Present"
        Name            = "Default Web Site"
        State           = "Stopped"
        PhysicalPath    = "C:\inetpub\wwwroot"
        DependsOn       = "[WindowsFeature]IIS"
    }
    
	# Copy the website content 
    File CopyWebContent 
    { 
        Ensure          = "Present" 
        SourcePath      = "C:\Program Files\WindowsPowerShell\Modules\$WebSiteName"
        DestinationPath = "C:\inetpub\$WebSiteName"
        Recurse         = $true 
        Type            = "Directory" 
        DependsOn       = "[WindowsFeature]ASP" 
    }
	
	File DeleteSourceContent
	{
        Ensure = "Absent"
        Force = $true
        DestinationPath = "C:\Program Files\WindowsPowerShell\Modules\$WebSiteName"
        Type = "Directory"
        DependsOn       = "[File]CopyWebContent" 
	}
	
    # Create a new website 
    xWebsite NewWebSite  
    { 
        Ensure          = "Present" 
        Name            = $WebSiteName 
        State           = "Started" 
        PhysicalPath    = "C:\inetpub\$WebSiteName" 
        DependsOn       = "[File]CopyWebContent" 
    } 
  }
} 