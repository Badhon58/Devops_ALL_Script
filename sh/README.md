# Shell Scripting Interview Questions & Answers (0–3 Years DevOps Engineer)

---

## 1. What is the use of `#!/bin/bash` in shell script?

### Answer:
It is called a **shebang**. It tells the operating system to execute the script using the Bash shell interpreter.

```bash
#!/bin/bash
```

---

## 2. What is the use of `$0` variable?

### Answer:
`$0` stores the name of the currently running script.

```bash
echo $0
```

---

## 3. What is the use of `$1`, `$2`, `$3` parameters?

### Answer:
These are positional parameters used to access command-line arguments passed to the script.

```bash
./script.sh hello world

$1 = hello
$2 = world
```

---

## 4. What is the use of `$#` variable?

### Answer:
`$#` gives the total number of arguments passed to the script.

```bash
echo $#
```

---

## 5. What is the use of `$?` variable?

### Answer:
`$?` stores the exit status of the last executed command.

- `0` → Success
- Non-zero → Failure

```bash
ls
echo $?
```

---

## 6. What is the use of `if` statement?

### Answer:
The `if` statement is used to execute commands conditionally.

```bash
if [ $a -gt 10 ]
then
  echo "Greater"
fi
```

---

## 7. What is the use of `elif` statement?

### Answer:
`elif` is used to check multiple conditions.

```bash
if [ $a -eq 1 ]
then
  echo "One"
elif [ $a -eq 2 ]
then
  echo "Two"
fi
```

---

## 8. What is the use of `case` statement?

### Answer:
The `case` statement is used for pattern matching and multiple conditions.

```bash
case $var in
  start) echo "Start" ;;
  stop) echo "Stop" ;;
esac
```

---

## 9. What is the use of `for` loop?

### Answer:
A `for` loop is used to repeat commands for a list of items.

```bash
for i in 1 2 3
do
  echo $i
done
```

---

## 10. What is the use of `while` loop?

### Answer:
A `while` loop executes commands repeatedly while a condition is true.

```bash
while [ $a -lt 5 ]
do
  echo $a
done
```

---

## 11. What is the use of `break` statement?

### Answer:
`break` is used to exit a loop immediately.

```bash
break
```

---

## 12. What is the use of `continue` statement?

### Answer:
`continue` skips the current iteration and moves to the next iteration of the loop.

```bash
continue
```

---

## 13. What is the use of functions in shell scripting?

### Answer:
Functions help reuse code and make scripts modular and readable.

```bash
hello() {
  echo "Hello"
}
```

---

## 14. What is the use of `read` command?

### Answer:
The `read` command is used to take user input.

```bash
read name
echo $name
```

---

## 15. What is the use of `echo` command?

### Answer:
The `echo` command prints output to the terminal.

```bash
echo "Hello World"
```

---

## 16. What is the use of `expr` command?

### Answer:
`expr` is used for arithmetic and evaluating expressions.

```bash
expr 5 + 3
```

---

## 17. What is the use of `cut` command?

### Answer:
The `cut` command extracts specific columns or fields from text.

```bash
cut -d":" -f1 /etc/passwd
```

---

## 18. What is the use of `sort` command?

### Answer:
The `sort` command sorts lines alphabetically or numerically.

```bash
sort file.txt
```

---

## 19. What is the use of `uniq` command?

### Answer:
The `uniq` command removes duplicate consecutive lines.

```bash
uniq file.txt
```

---

## 20. What is the use of `wc` command?

### Answer:
The `wc` command counts lines, words, and characters in a file.

```bash
wc file.txt
```

---

## 21. What is the use of `head` command?

### Answer:
The `head` command displays the first 10 lines of a file.

```bash
head file.txt
```

---

## 22. What is the use of `tail` command?

### Answer:
The `tail` command displays the last 10 lines of a file.

```bash
tail file.txt
```

---

## 23. What is the use of `tee` command?

### Answer:
The `tee` command stores output in a file and displays it on the terminal simultaneously.

```bash
ls | tee output.txt
```

---

## 24. What is the use of `xargs` command?

### Answer:
`xargs` converts standard input into command-line arguments.

```bash
cat file.txt | xargs rm
```

---

## 25. What is the use of `export` command?

### Answer:
The `export` command creates environment variables available to child processes.

```bash
export PATH=$PATH:/new/path
```

---

## 26. What is the use of input/output redirection?

### Answer:
Input/output redirection is used to redirect command input or output.

### Operators:
- `>` → Redirect output
- `>>` → Append output
- `<` → Redirect input

```bash
echo "Hello" > file.txt
```

---

## 27. What is the use of pipes (`|`) in Linux?

### Answer:
A pipe sends the output of one command as input to another command.

```bash
ls | grep txt
```

---

## 28. What is the use of environment variables?

### Answer:
Environment variables store system-wide or user-specific configuration values.

```bash
echo $HOME
```

---

## 29. What is the use of command substitution?

### Answer:
Command substitution stores command output into a variable.

```bash
DATE=$(date)
echo $DATE
```

---

## 30. What is the use of shell scripting in DevOps?

### Answer:
Shell scripting is widely used in DevOps for:

- Automation
- Server management
- CI/CD pipelines
- Monitoring
- Backup automation
- Deployment automation
- Docker and Kubernetes management

### Example:

```bash
kubectl get pods
docker ps
```

---