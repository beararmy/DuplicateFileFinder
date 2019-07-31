# Quick hacky nonsense to find the fastest hashing algorithm

param
(
    $testFile = "J:\Phone.zip",
    $thisScript = "./Test-Hashspeed.ps1",
    $numberAttempts = "100"
)

$container = @()
1..$numberAttempts | ForEach-Object {
    "SHA1", "SHA256", "SHA384", "SHA512", "MACTripleDES", "MD5", "RIPEMD160" | ForEach-Object {
        $ht = [PSCustomObject]@{
            Algorithm    = $_;
            Milliseconds = (measure-command -Expression { Get-FileHash $testFile -Algorithm $_; Get-FileHash $thisScript -Algorithm $_ }).totalmilliseconds
        }
        $container += $ht
    } 
}
Write-Host "Lower is better, time is average time to hash $testfile in milliseconds."    
$container | Group-Object -Property Algorithm | ForEach-Object { 
    [PSCustomObject]@{
        Algorithm = $_.Name
        Average   = ($_.Group | Select-Object -ExpandProperty milliseconds | Measure-Object -Average ).average 
    }
} | Sort-Object -Property Average