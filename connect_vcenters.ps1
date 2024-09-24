# Carregar o módulo do VMware PowerCLI
Import-Module VMware.PowerCLI

# Desabilitar a verificação de certificado SSL (opcional, use se necessário)
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

# Lista de vCenters para se conectar
$vCenters = @(
    "vcenter1.seudominio.com",
    "vcenter2.seudominio.com",
    "vcenter3.seudominio.com"
)

# Credenciais (você pode usar Get-Credential ou armazenar as credenciais de outra forma)
$cred = Get-Credential

# Loop para conectar-se a cada vCenter
foreach ($vCenter in $vCenters) {
    try {
        Write-Host "Conectando ao $vCenter..."
        Connect-VIServer -Server $vCenter -Credential $cred -ErrorAction Stop
        Write-Host "Conectado com sucesso ao $vCenter!"
    } catch {
        Write-Host "Falha ao conectar ao $vCenter: $_"
    }
}

# Fazer o que for necessário após a conexão (como obter VMs, hosts, etc.)
# Exemplo: Listar todas as VMs em todos os vCenters
#Get-VM | Select-Object Name, PowerState

# Desconectar de todos os vCenters ao final
#Disconnect-VIServer * -Confirm:$false