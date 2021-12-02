
printf "Tools Setup \n"
read -p "Parent src directory path: " input_src
read -p "Enter your page directory path: " input_page
read -p "Enter your component directory path: " input_component

# Default config
new_src="${input_src}/src"

# Validate input
if [ ! -z $input_src ]; then 
  :
else 
  exit 1
fi;

if [ ! -z $input_page ]; then 
  :
else 
  exit 2
fi;

if [ ! -z $input_component ]; then 
  :
else 
  exit 3
fi;

# Add file
start=$( 
  sed -e "s/{{ENV_SRC_DIRECTORY}}/$input_src/g" -e "s/{{ENV_PAGE_DIRECTORY}}/$input_page/g" -e "s/{{ENV_COMPONENT_DIRECTORY}}/$input_component/g" libs/breath.sh
);

echo "$start" >> makeComponent.sh;
