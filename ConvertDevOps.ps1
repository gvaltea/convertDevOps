$NID = Import-Csv -Delimiter "`t" -Path '.\Copia di Stime_NID.txt' -Encoding utf8

$issues = @()

$NID | foreach {
    $issue =[PSCustomObject]@{      "Work Item Type" = 'Issue'
                                    "Issue ID" = $_.NID
                                    Area = $_.AREA
                                    Title = $_.Titolo
                                    Description = '<p>' + $_.Descrizione + '</p><p>' + $_.Note + '<p>'
                                    Effort = $_.GG

                                }
    $issues += @($issue)
    
}


$issues | Export-Csv -Path Stime.csv -Encoding UTF8
