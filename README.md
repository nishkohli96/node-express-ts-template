# node-express-ts-template

Express JS Application with Typescript

## Running the app

**Install [pnpm](https://pnpm.io/), if it isn’t already on your system.**

```bash
npm i -g pnpm@latest
```

Run the app in `development` environment:

```bash
pnpm dev
```

Build the app and run production code:

```bash
pnpm prod
```

## Features

- Express app configured
- Handled loading of environment variables
- Preconfigured logger middleware - [winston](https://www.npmjs.com/package/winston) for logging request details and errors 
- Docker image


## Update Dependencies

[npm-check-updates](https://www.npmjs.com/package/npm-check-updates) is an excellent tool for detecting the latest versions of dependencies and updating them in your `package.json`. It simplifies the process of keeping your project up to date with the latest package versions.

### Installation

Install globally to use **npm-check-updates**

```
npm install -g npm-check-updates
```

To update packages while also understanding the impact of the changes, run:

```bash
ncu --format group -u
```
This groups updates by type (**major**, **minor**, **patch**), making it easier to assess potential risks before upgrading.

Update all dependencies && Check build status after updating all packages:

```
pnpm install-updates && pnpm build
```
