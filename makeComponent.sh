#!/bin/bash
# @author: natserract
 
# COMMAND ARGS
arg_build_type=$1
arg_build_name=$2
arg_build_path_opt=$3
arg_build_path_to=$4

# ENVIRONMENTS
ENV_SRC_DIRECTORY=examples/src
ENV_PAGE_DIRECTORY=pages
ENV_COMPONENT_DIRECTORY=components

# CONSTANTS
START_PATH="."
PAGE_DIRECTORY="$START_PATH/$ENV_SRC_DIRECTORY/$ENV_PAGE_DIRECTORY"
COMPONENT_DIRECTORY="$START_PATH/$ENV_SRC_DIRECTORY/$ENV_COMPONENT_DIRECTORY"

# STDIN
printf "
 ************** Tools for generate component/page ************** 
"

# MUTATE
find_first_char_of_string=$( echo $arg_build_name | cut -c1-1 )
get_first_char_of_string=$( echo "$find_first_char_of_string" | awk '{print toupper($0)}' ) 

capitalize_name=$( echo $arg_build_name | sed "s/$find_first_char_of_string/$get_first_char_of_string/" )
lowercase_name=$( echo "$arg_build_name" | awk '{print tolower($0)}' ) 

# USED FOR TEMPLATES OF PAGES & COMPONENTS
repl_name={{NAME}}
repl_sub_name={{SUB_NAME}}

build_type=$([ "$arg_build_type" == '-p' ] && echo "page" || echo "component")
build_type_uppercase=$( echo $build_type | tr 'a-z' 'A-Z' )

templ_app=TEMPLATE_$build_type_uppercase.tsx
templ_app_stories=TEMPLATE_STORIES.tsx
templ_app_styles=TEMPLATE_STYLES.ts

# UTILS
function raise_error(){
  local message=$1
  echo "$(tput setaf 1)$message"
}

# arg_name: page/component name
function build_files(){
  arg_name=$1
  arg_build_dir=$2

  app_template=$( 
    sed -e "s/$repl_name/$arg_name/g" -e "s/$repl_sub_name/${lowercase_name}.$build_type/g" $START_PATH/templates/$build_type/$templ_app
  );

  stories_template=$( 
    sed -e "s/$repl_name/$arg_name/g" -e "s/$repl_sub_name/${lowercase_name}.$build_type/g" $START_PATH/templates/$build_type/$templ_app_stories
  );

  result_path=$arg_build_dir/$arg_build_path_to/$arg_name
            
  # Create new page/component file
  echo "$app_template" >> $result_path/${lowercase_name}.$build_type.tsx;

  # Create new stories file
  echo "$stories_template" >> $result_path/${lowercase_name}.$build_type.stories.tsx;

  # Create new styles file
  cat $START_PATH/templates/$build_type/$templ_app_styles >> $result_path/${lowercase_name}.$build_type.styles.ts;
}

# Validate: args only 4
if [ $# -gt 4 ];
  then 
    raise_error "make: illegal option ${@:$#}. Build failed!";
    exit 1
else 
  printf "Pages will build in (${PAGE_DIRECTORY}) 
"
  printf "Components will build in (${COMPONENT_DIRECTORY}) 
"
  printf "If you want to custom path add args {--path path_dir} 
 
"
fi

# MAIN
# Avalaible with default/custom path
case "$1" in
  # Build page
  -p | -path) 
    param_type="$arg_build_type"
    param_path="$arg_build_path_opt"     
      # Action
      page_name=${capitalize_name}Page 

      # With custom path 
      if [ ! -z "$arg_build_path_opt" ]; then 
        if [ ! -z "$arg_build_path_to" ];
          then
            # Create page directory
            mkdir $PAGE_DIRECTORY/$arg_build_path_to/$page_name

            # Build files for page
            build_files $page_name $PAGE_DIRECTORY
        else
          raise_error "Please enter path!"
          exit 1
        fi
      else 
        # Without custom path
        # Create page directory
        mkdir $PAGE_DIRECTORY/$page_name

        # Build files for page
        build_files $page_name $PAGE_DIRECTORY
      fi
    shift;;

  # Build component
  -c | -path) 
    param="$arg_build_type"
      # Action
      component_name=${capitalize_name}Component

       # With custom path 
      if [ ! -z "$arg_build_path_opt" ]; then 
        if [ ! -z "$arg_build_path_to" ];
          then
            # Create component directory
            mkdir $COMPONENT_DIRECTORY/$arg_build_path_to/$component_name

            # Build files for component
            build_files $component_name $COMPONENT_DIRECTORY
        else
          raise_error "Please enter path!"
          exit 1
        fi
      else 
        # Without custom path
        # Create component directory
        mkdir $COMPONENT_DIRECTORY/$component_name

        # Build files for component
        build_files $component_name $COMPONENT_DIRECTORY
      fi
    shift;; 

  # Delete (TODO)
  -d | -path) 
    param="$arg_build_type"
      echo "Delete ${param}"
    shift;; 

  -h | --help)
    param="$1"
      commandLists=("-p: build page", "-c: build component", "-d: delete page/component", "-h: helps")
      optionLists=("-path: Custom path, if -p will build page according to input path")
      
      # action
      printf "Commands: 
"
        for item in "${commandLists[@]}";
          do
            echo "$item"
        done

      printf "
"

      printf "Options: 
"
        for item in "${optionLists[@]}";
          do
            echo "$item"
        done

      printf "
"
      exit 0
    shift;;

  *)
      raise_error  "make: illegal option ${@:$#}";
    shift;; 
esac
shift
