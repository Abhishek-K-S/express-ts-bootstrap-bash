# express-ts-bootstrap-bash# express-ts-bootstrap-bash
# Express with TypeScript Server Generator

This repository contains a Bash script that generates a basic Express server with TypeScript, along with all the necessary libraries installed.

## Prerequisites

To use this script, ensure that you have the following prerequisites installed on your system:

- Node.js (version >= 14.x)
- npm (Node Package Manager)

## Getting Started

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/express-typescript-server-generator.git
2. Rename the folder to the project name:
   ```bash
   mv express-ts-bootstrap-bash your_project_name
   
3. Navigate to the cloned repository:
   ```bash
   cd your_project_name
4. Run the script to generate the Express server:
   ```bash
   sh default/setup.sh
   ```
   Wait for the packages to download.
5. Voila!! Now the server is ready to code. To start the server, run the following code
   ```bash
   npm run dev

##Note
1. Once installed, you can remove the folder 'default', which contains the script.
2. The script can be copies to any folder and executed. The project always takes the name of  parent folder.
3. If the working directory already has a tscofig.json file, then it will be deleted and new one is created. Other files are overwritten.
4. "dist" folder contains all tranpiled codes.