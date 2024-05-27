# Domain Scanner

![Scanner](https://i.ibb.co/k9CZfhK/scannerog.png)

## Overview

This script allows you to scan for subdomains of a given domain in parallel. It utilizes the `dig` command to resolve the IP addresses of the subdomains.

## Features

- Parallel processing for faster scanning
- Customizable list of subdomains to scan
- Simple command-line interface

## Prerequisites

- `dig` command-line tool (usually pre-installed on most Unix-like systems)

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/SleepTheGod/domain-scanner
    ```

2. Navigate to the directory:

    ```bash
    cd domain-scanner
    ```

3. Make the script executable:

    ```bash
    chmod +x domain.sh
    ```

4. Run the script:

    ```bash
    ./domain.sh search
    ```

    Replace `search` with the domain you want to scan.

## Command-line Options

- To display usage instructions:

    ```bash
    ./domain.sh -h
    ```

- To display usage instructions with an extended flag:

    ```bash
    ./domain.sh --h
    ```

## Customization

You can customize the list of subdomains to scan by modifying the `subdomains` array in the script.

## Author

Taylor Christian Newsome

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
