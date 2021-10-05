# The file always start with cmake_minimum_required to define
# which version of CMake is used.
cmake_minimum_required(VERSION 3.14.0)
# Note: We need at least version 3.14 for the FetchContent Module

# Next we set the project name
project(mySimpleSFMLProject
        VERSION 1.0
        DESCRIPTION "Helper project for working with cmake and SFML"
        LANGUAGES CXX) # work in C++

# Set the language standard
set(CMAKE_CXX_STANDARD 17)

# This is the executable that we are going to make
# It will have the correct extension for the platform(.exe, .app, etc.)
# that we are compiling on.
# We also want to specify all of the source files that we will be using.
add_executable(myApplication
               src/main.cpp)    # Include all the .cpp files


# If you want you can manually check what platform you are on with
message("======================") 
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message("Building on windows") 
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message("Building on Linux") 
    message("Note: For SFML, Linux may require you to download many dependencies from scratch")
    message("e.g., sudo apt-get install -y libfreetype6-dev")
    message("      sudo apt-get install libopenal-dev")
    message("      sudo apt-get install -y libvorbis-dev")
    message("      sudo apt-get install -y libflac-dev")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    message("Building on Mac") 
endif()
message("======================") 

# We can pass additional compilation flags in C++
# (i.e., things handled by the preprocessor)
target_compile_definitions(myApplication PRIVATE SOME_DEFINITION)
# Add any command line compilation options
target_compile_options(myApplication PRIVATE -Wall -Wextra -Wpedantic)


find_library(LIBRARY_SFML sfml)
if(LIBRARY_SFML)
    target_link_libraries(myApplication PRIVATE ${LIBRARY_SFML})
else()
    message("Could not find LIBRARY_SFML--attempting to build it")
    set(SFML_VERSION "2.5.1")
    include(FetchContent)
    FetchContent_Declare(sfml 
                         GIT_REPOSITORY "https://github.com/SFML/SFML.git"
                         GIT_TAG "${SFML_VERSION}")
    FetchContent_GetProperties(sfml)
    if(NOT sfml_POPULATED)
        message("Attempting to populate sfml")
        FetchContent_Populate(sfml)
        add_subdirectory(${sfml_SOURCE_DIR} ${sfml_BINARY_DIR})
    endif()
endif()

# Where to find our header files
include_directories("./_deps/sfml-src/include")

# Tell SFML which directory to find our libraries
link_directories("./_deps/sfml-build/lib/")

# Which of the directories (in the above folder) to actually link
target_link_libraries(myApplication 
                      PRIVATE
                        sfml-window
                        sfml-system
                        sfml-graphics
)



