---
external help file: docs-workshop-help.xml
Module Name: docs-workshop
online version:
schema: 2.0.0
---

# Get-DadJoke

## SYNOPSIS
Get a random dad joke, or a specific joke by Id from icanhazdadjoke.com.

## SYNTAX

```
Get-DadJoke [[-JokeId] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The `Get-DadJoke` cmdlet gets a random dad joke from icanhazdadjoke.com, it but won't help you "get" the joke. Get it?

I know, Steven Judd is _much_ better at this 😅

## EXAMPLES

### Example 1
```powershell
Get-DadJoke
```

Gets a random dad joke.

### Example 2
```powershell
Get-DadJoke -Id DtWSnydN7h
```

Gets a joke about "shells".

## PARAMETERS

### -JokeId
The Id of a specific dad joke to get.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Id

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
