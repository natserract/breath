# Tools for speed up your development

## Setup

```sh
sudo chmod +x tools/makeComponent.sh

# Or
sudo chmod +x tools/renameGitFile.sh
```

## Running

```sh
./makeComponent.sh

# Or
./renameGitFile.sh
```

## Design API

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
  ./makeComponent.sh -p dashboard
  ```

## Example Use

- Build page:

  ```sh
  # Default (web/src/pages)
  ./makeComponent.sh -p <page_name>

  # With Custom Path
  ./makeComponent.sh -p <page_name> -path <path_directory>
  ```

- Build component:

  ```sh
  # Default (web/src/components)
  ./makeComponent.sh -c <component_name>

  # With Custom Path
  ./makeComponent.sh -c <component_name> -path <path_directory>
  ```
