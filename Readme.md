# Project Structure Parser Script

This script recursively parses the structure of a project directory and displays it in a tree-like format. It works on macOS, Windows (via WSL or native Bash environments), and Linux.

## Features

- Recursively analyzes directories and subdirectories.
- Outputs a clear, tree-like structure.
- Displays both files and folders in a formatted hierarchy.

---

## Setup Instructions

### macOS

1. **Save the Script**  
   Save the script as `project-struct` in a directory of your choice, such as `/usr/local/bin/`.

   ```bash
   sudo mv project_struct_parser.sh /usr/local/bin/project-struct
   ```

2. **Make it Executable**  
   Grant execute permissions:
   ```bash
   chmod +x /usr/local/bin/project-struct
   ```

3. **Ensure the Directory is in PATH**  
   Verify that `/usr/local/bin` is included in your PATH by running:
   ```bash
   echo $PATH
   ```
   If not, add it to your shell configuration file (e.g., `~/.zshrc` or `~/.bash_profile`):
   ```bash
   export PATH="/usr/local/bin:$PATH"
   ```

   Reload your shell configuration:
   ```bash
   source ~/.zshrc
   ```

4. **Run the Script**  
   Test the script:
   ```bash
   project-struct /path/to/project
   ```

---

### Windows (Using WSL or Git Bash)

#### Using Git Bash

1. **Save the Script**  
   Save the script in a folder accessible by Git Bash, such as `C:/Program Files/Git/usr/bin/`.

2. **Make it Executable**  
   Rename and add the `.sh` extension if needed, then make it executable by adding `chmod +x` in Git Bash.

3. **Run the Script**  
   Test the script:
   ```bash
   project-struct /path/to/project
   ```

---

### Linux

1. **Save the Script**  
   Save the script in `/usr/local/bin` or another directory in your PATH.

   ```bash
   sudo mv project_struct_parser.sh /usr/local/bin/project-struct
   ```

2. **Make it Executable**  
   Grant execute permissions:
   ```bash
   chmod +x /usr/local/bin/project-struct
   ```

3. **Verify PATH**  
   Ensure `/usr/local/bin` is in your PATH:
   ```bash
   echo $PATH
   ```

   Add it to your shell configuration file (if not already present):
   ```bash
   export PATH="/usr/local/bin:$PATH"
   ```

   Reload your shell configuration:
   ```bash
   source ~/.bashrc
   ```

4. **Run the Script**  
   Test the script:
   ```bash
   project-struct /path/to/project
   ```

---

## Usage

Run the script by providing the path to a directory. You can use either relative or absolute paths:
```bash
project-struct /path/to/project
project-struct ./relative/path
```

---

## Example Output

Given a directory structure like:
```
project/
├── CODEOWNERS
├── app/
│   ├── __init__.py
│   ├── config.py
│   ├── db/
│   │   └── models.py
```

Running `project-struct /path/to/project` will output:
```
[project]
|--CODEOWNERS
|--app
    |--__init__.py
    |--config.py
    |--db
        |--models.py
```

---

## Troubleshooting

- Ensure you have proper permissions for the script and the directories you are accessing.
- Verify that the directory is valid and accessible.
