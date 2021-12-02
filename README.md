# Breath: Tools for speed up your development

## Setup

```sh
yarn setup
```

## Running

```sh
yarn breath
```

## API Design

### Default

- `-p`: Page
- `-c`: Component
- `-d`: Delete Page/Component (TODO)
- `-h`: Helps

### Options

- `-path`: Custom path, if `-p` will build **page** according to input path.

## Rules

- Only support one word
- Lowercase input recomended
- Build page/component, you don't need passing `Page / Component` again in your input, just type page/component **title**.
  ```sh
  # Capitalize allowed, but will transform to lowercase
  # Will generate automatically: `web/src/pages/DashboardPage`
  yarn breath -p dashboard
  ```

## Example Use

- Build page:

  ```sh
  # Default (web/src/pages)
  yarn breath -p <page_name>

  # With Custom Path
  yarn breath -p <page_name> -path <path_directory>
  ```

- Build component:

  ```sh
  # Default (web/src/components)
  yarn breath -c <component_name>

  # With Custom Path
  yarn breath -c <component_name> -path <path_directory>
  ```

## By shell script
```sh
# Just type
./makeComponent.sh $args
```