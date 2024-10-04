# Time File Searcher

## Overview

This Bash script allows users to search for files modified during specific hours of each day within a specified range of years (1991 to 2021). Users can input a specific hour (1-14) to filter the results.

## Features

- Input validation to ensure the hour is between 1 and 14.
- Searches through each day of each month for files modified during the specified hour.
- Handles different month lengths and leap years.

## Usage

1. Clone the repository or download the script.
2. Run the script:
   ```bash
   chmod +x your_script.sh
   ./your_script.sh
   ```
3. Follow the prompt to enter a number between 1 and 14.

## Requirements

- A Unix-like environment (Linux, macOS) with Bash shell.
- Basic command-line knowledge.
