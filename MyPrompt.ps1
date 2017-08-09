function prompt
{
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity

    $(if (test-path variable:/PSDebugContext) { '[DBG]: ' }

    elseif($principal.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    { "[ADMIN]: " }

    else { '' }) + 'PS ' + $(Get-Location) + $(if ($nestedpromptlevel -ge 1) { '>>' }) + "`n> "

}

