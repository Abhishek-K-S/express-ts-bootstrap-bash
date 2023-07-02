#!/bin/bash

# check if npm is available, else abort
if command -v npm >/dev/null 2>&1; then
  echo "Using node $(node -v) and npm v$(npm -v)"
else
  echo "Node and npm not installed. Aborting..."
  exit 1
fi

this_folder=$(basename "$(pwd)")
echo "Creating a Type/Express project with name $this_folder"

# create a custom package.json file
echo "{
  \"name\": \"$this_folder\",
  \"version\": \"1.0.0\",
  \"description\": \"Created using BashScript (https://github.com/Abhishek-K-S/express-ts-bootstrap-bash/tree/main)\",
  \"main\": \"dist/index.js\",
  \"scripts\": {
    \"build\": \"npx tsc\",
    \"start\": \"node dist/index.js\",
    \"dev\": \"concurrently \\\"npx tsc --watch\\\" \\\"nodemon -q dist/index.js\\\"\"
  },
  \"keywords\": [],
  \"author\": \"Abhishek K S\",
  \"license\": \"MIT\"
}
" > package.json

#create a default ts file
echo "import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
const port = process.env.PORT;

app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScript Server');
});

app.listen(port, () => {
  console.log(\`⚡️[server]: Server is running at http://localhost:\${port}\`);
});" > index.ts

echo "Installing packages with npm"

#install essential libraries
npm install express dotenv > /dev/null
npm install --save-dev typescript @types/express @types/node concurrently nodemon> /dev/null
echo "Packages installed"

#create a environment file
echo "PORT=9999" >.env

# create a tsconfig file with outDir set to dist folder
mkdir dist 2>/dev/null
if [ -e "tsconfig.json" ]; then
  rm tsconfig.json
fi
npx tsc --init --outDir ./dist > /dev/null

#compile the existing code
npx tsc>/dev/null 
