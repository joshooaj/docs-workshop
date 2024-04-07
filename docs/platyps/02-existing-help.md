# Built-in Help

With the the `dadjokes` module imported, you can get help in the terminal with the `Get-Help` command.
The help system is one of the many neat features of PowerShell. The format of help for every function
or cmdlet has the same schema. And even if you don't document __anything__, you still get some basic
information about the expected parameters, parameter types, and which parameters (if any) are required
when using the command.

In the sample `dadjoke` module, I intentionally added comment-based help for `Get-DadJoke` and not for
`Find-DadJoke`. You can see in the `Find-DadJoke` tab below that the built-in help system still gives
you a good idea of how to use the command, and thanks to the use of the `[OutputType()]` attribute,
it even declares the output type for the command.

``` powershell title="Command" linenums="1"
Get-Command -Module dadjokes | Get-Help -Full
```

<div class="result" markdown>

=== "Get-DadJoke"

    ``` text
    --8<-- "platyps/get-dadjoke.txt"
    ```

=== "Find-DadJoke"

    ``` text
    --8<-- "platyps/find-dadjoke.txt"
    ```

</div>
