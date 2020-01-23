---
external help file: OctoPwsh-help.xml
Module Name: OctoPwsh
online version:
schema: 2.0.0
---

# Get-Lifecycle

## SYNOPSIS
List all lifecycles

## SYNTAX

```
Get-Lifecycle [-OctopusBaseURL] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
List all lifecycles in your Octopus Deploy environment

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-Lifecycle -OctopusBaseURL http://localhost:8081/api
```

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OctopusBaseURL
Octopus URL (same one as when you log into your environment)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
