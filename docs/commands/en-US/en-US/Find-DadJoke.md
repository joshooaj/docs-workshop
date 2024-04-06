---
external help file: docs-workshop-help.xml
Module Name: docs-workshop
online version:
schema: 2.0.0
---

# Find-DadJoke

## SYNOPSIS
Finds a matching dad joke from icanhazdadjoke.com.

## SYNTAX

```
Find-DadJoke [[-Term] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The `Find-DadJoke` cmdlet finds a dad joke from icanhazdadjoke.com which matches the provided term(s), or if no terms
are provided, all jokes are returned.

## EXAMPLES

### Example 1
```powershell
Find-DadJoke
```

Gets all dad jokes the api has to offer.

### Example 1
```powershell
Find-DadJoke -Term cat
```

Finds dad jokes about cats 🤷‍♂️

## PARAMETERS

### -Term
A word, or words, to search for in the catalog of dad jokes.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
This common parameter is new in PowerShell 7.4, and PlatyPS v0.14.2 thinks it's one of your function's parameters. Remind me to show you how you can work around this until v2 is released.

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

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

### System.String

## NOTES

## RELATED LINKS
