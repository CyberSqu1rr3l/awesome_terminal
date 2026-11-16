# Bash Shell Prompt

This folder servers as a visual collection of Bash shell prompts with their source code and a preview script to explore different styles directly in the terminal.
A *shell prompt* is the text displayed in the terminal when the shell is ready to accept a command. It typically contains information such as the username, hostname and current working directory.

> [!NOTE]
> The default bash prompt might look like in the following, with the username, hostname and current directory.
> ```text
> user@hostname:~/projects$
> ```
> The prompt can be customized with the `PS1` environment variable to display additional information, use different colors, or span multiple lines.
> For example, we can set the prompt to the following unicolor string.
> ```bash
> PS1='\u@\h:\w\$ '
> ```

| Sequence | Special Character Description [^2] |
|---:|:---|
| `\u` | current username |
| `\h` | hostname |
| `\w` | current working directory |
| `\W` | current directory name |
| `\t` | current time in *24-hour* format |
| `\A` | current time in `HH:MM` |
| `\$` | `$` for regular users and `#` for root |
| `\n` | new line character |
| `\[` `\]` | enclose non-printing characters, e.g. *ANSI* color codes |

By combining these sequences with ANSI escape codes, it is possible to create colorful and informative prompts. [^1]

## Requirements

- **Bash:** to execute the scripts and interpret prompt definitions
- **Git:** required for git-aware prompts
- **ANSI-compatible terminal:** to display colors and formatting
- **Nerd Font:** for styles using Powerline symbols or special icons

## Preview Script Usage

The `preview_prompt.sh` script provides a way to inspect different bash prompts without changing our current shell configuration. First, we want to make the script executable with `chmod +x preview_prompt.sh` and then list all available prompts with `./preview_prompt.sh list`.
In order, to preview a specific prompt style, we can use `./preview_prompt.sh cyberpunk` and to preview all prompts at once, we can use `./preview_prompt.sh all`.

> [!WARNING]
> Note, that the preview is not a full interactive prompt rendering. Certain dynamic prompts, particularly those relying on interactive bash features or complex command substitutions, may behave differently. Since prompt definitions are executed as bash code, make sure to preview styles from trusted sources only.

> [!TIP]
> In order to use a style in future interactive bash sessions, we can add the corresponding `PS1` definition or source command to our `~/.bashrc` file and then reload teh configuration with `source ~/.bashrc`.

[^1]: https://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
[^2]: https://www.gnu.org/software/bash/manual/html_node/Controlling-the-Prompt.html
