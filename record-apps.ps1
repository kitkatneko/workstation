# ./record.ps1 changes the version numbers listed in packagelist.config in the current
# directory to the ones currently installed.
#
# * It does not add packages to packagelist.config that are installed but not currently
#   listed, which allows the user to only track the versions of the packages they care
#   about, and not all of their transititve dependencies.
#

echo "Writing currently installed package versions to packagelist.config.."

# get the list of all installed packages and versions
$installed = choco list -lo -r -y | % { @{ id = $($_.SubString(0, $_.IndexOf("|"))); version = $($_.SubString($_.IndexOf("|") + 1)) } }

# take each package listed in packagelist.config, and rebuild the xml <package /> line but with version set to the currently installed version
$packagelist = select-xml -path .\packagelist.config -xpath //package `
    | % { "   <package id=""$($_.node.id)"" version=""$(($installed | where-object id -eq $_.node.id).version)"" $(if ($_.node.packageParameters) { write-output "packageParameters=""""$($_.node.packageParameters)"""" " })/>" } `
    | sort-object

# rewrite packages listed in packagelist.config with versions currently installed
@"
<?xml version="1.0" encoding="utf-8"?>
<packages>
$($packagelist -join "`r`n")
</packages>
"@ | out-file packagelist.config -encoding utf8