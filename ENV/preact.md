# Preact project setup with `create-vite`

Vite is a build tool for faster development thanks to super fast Hot Module Reload (HMR), fast cold start times, and CSS + JSX + TypeScript support out of the box. In addition, Vite is highly extensible via its Plugin API and JavaScript API with full typing support. [Read the Docs to Learn More](https://vitejs.dev).
Create-vite is a tool to quickly start a project from a basic template for popular frameworks.

## Supported Templates

Currently supported template presets include:

- `vanilla`
- `vanilla-ts`
- `vue`
- `vue-ts`
- `react`
- `react-ts`
- `preact`
- `preact-ts`
- `lit`
- `lit-ts`
- `svelte`
- `svelte-ts`

## Community Templates

Check out [Awesome Vite](https://github.com/vitejs/awesome-vite#templates) for community maintained templates.
You can use a tool like [degit](https://github.com/Rich-Harris/degit) to scaffold your project with one of the templates.

## Setup

```sh
npm create vite@latest
```

Then follow the prompts to specify the project name and template.
You can also directly specify the project name and the template you want to use via additional command line options.

For example, to scaffold a Vite + Preact + Typescript project, run:

```sh
# npm 7+, extra double-dash is needed:
npm create vite@latest my-project-name -- --template preact-ts
```

You can use `.` for the project name to scaffold in the current directory.

## Creating a single JS file output for React/Preact projects

1. Scaffold a Vite project with the desired template, eg. preact-ts:

```sh
 npm create vite@latest my-project-name -- --template preact-ts
```

2. Install vite-plugin-css-injected-by-js to automatically inject the app's styles into the document `<head>`:

```sh
cd my-project-name
npm i -D vite-plugin-css-injected-by-js
```

3. Configure Vite to use that plugin via plugins and to disable CSS code splitting via `build.cssCodeSplit`:

```js
// vite.config.js
import { defineConfig } from "vite";
import cssInjectedByJsPlugin from "vite-plugin-css-injected-by-js";
export default defineConfig({
  plugins: [cssInjectedByJsPlugin()],
  build: {
    cssCodeSplit: false,
  },
});
```

4. Configure Vite to build a single JavaScript file (i.e., the main.jsx file) via `build.rollupOptions.input`:

```js
// vite.config.js
import { defineConfig } from "vite";
export default defineConfig({
  build: {
    rollupOptions: {
      input: {
        app: "./src/main.jsx",
      },
    },
  },
});
```

5. Build the app:

```sh
cd my-react-project
npm run build
```

The build then produces a dist directory containing these files:

```
dist/assets/app.d91c60c0.js
dist/assets/logo.ecc203fb.svg
```
