function Get-Antal {
param(
    [Int]$Kurs = $(Read-host = "Kurs"),
    [Int]$Kapital = $(Read-host = "Kapital"),
    [Int]$Stoploss = $(Read-host = "Stoploss")
)

$risk = ($kapital * 0.03)
$marginal = ($kurs - $stoploss)

$antal = ($risk / $marginal)

Write-Host "$antal"
}