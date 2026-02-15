cmake_minimum_required(VERSION 3.16)
project(G4HepRep)

find_package(Geant4 REQUIRED)
include(${Geant4_USE_FILE})

set(HEPREP "${CMAKE_CURRENT_SOURCE_DIR}")
include_directories("${HEPREP}/include" "${HEPREP}/include/private")
file(GLOB_RECURSE SOURCES "${HEPREP}/src/*.cc")
add_library(${PROJECT_NAME} SHARED ${SOURCES})
target_link_libraries(${PROJECT_NAME} PRIVATE ${Geant4_LIBRARIES})

file(GLOB HEADERS "${HEPREP}/include/*.hh")
install(FILES ${HEADERS} DESTINATION /usr/include/Geant4)
install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION /usr/lib64)
