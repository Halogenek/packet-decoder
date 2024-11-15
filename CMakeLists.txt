cmake_minimum_required(VERSION 3.15...3.31)

project(
  PacketDecoder
  VERSION 0.1
  DESCRIPTION "A tool for detecting and analyzing packets in captured embedded data streams"
  LANGUAGES CXX
)

# If we are building this as a standalone app
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(CMAKE_CXX_STANDARD 20 CACHE STRING "Enforcing C++20")
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  #I want the code to be portable, so no compiler-specific language extensions
  set(CMAKE_CXX_EXTENSIONS OFF)

  # Enable folder organization if build in IDEs instead CLIs
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)

  include(CTest)

  find_package(Doxygen)
  if(Doxygen_FOUND)
    add_subdirectory(docs)
  else()
    message(STATUS "No Doxygen support found, no doxygen documentation will be build")
  endif()
endif()

# Include tests only when build as a standalone app
# BUILD_TESTING set when CTest is included
if((CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME) AND BUILD_TESTING)
  add_subdirectory(tests)
endif()

add_subdirectory(src)
