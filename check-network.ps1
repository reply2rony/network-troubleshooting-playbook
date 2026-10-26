# Network quick check — SAMPLE script (Windows).
# Usage: .\check-network.ps1 -Gateway 192.168.1.1 -HostName example.com -Port 80
# This script only tests connections. It does not change settings.

param(
    [string]$Gateway = "192.168.1.1",
    [string]$HostName = "example.com",
    [int]$Port = 80
)

Write-Host "=== Network quick check ==="
Write-Host "Gateway: $Gateway | Host: $HostName | Port: $Port"
Write-Host ""

Write-Host "1. Ping gateway:"
if (Test-Connection -ComputerName $Gateway -Count 3 -Quiet) {
    Write-Host "   OK — gateway replies."
} else {
    Write-Host "   FAIL — gateway does not reply. Check cable/Wi-Fi and the router first."
}
Write-Host ""

Write-Host "2. Resolve a name (DNS):"
try {
    $address = [System.Net.Dns]::GetHostAddresses($HostName)
    Write-Host "   OK — $HostName resolves to $($address[0].IPAddressToString)."
} catch {
    Write-Host "   FAIL — DNS does not resolve $HostName. Check DNS settings."
}
Write-Host ""

Write-Host "3. Test port:"
if (Test-NetConnection -ComputerName $HostName -Port $Port -WarningAction SilentlyContinue) {
    # Test-NetConnection prints its own result; the line above is the check itself.
    Write-Host "   See the result above for port $Port on $HostName."
}
