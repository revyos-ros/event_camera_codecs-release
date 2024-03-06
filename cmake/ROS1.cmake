#
# Copyright 2022 Bernd Pfrommer <bernd.pfrommer@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

add_compile_options(-Wall -Wextra -pedantic -Werror)
add_definitions(-DUSING_ROS_1)

find_package(catkin REQUIRED COMPONENTS
  event_camera_msgs)

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES codec
  CATKIN_DEPENDS event_camera_msgs)

include_directories(
  include
  ${catkin_INCLUDE_DIRS})

#
# ----- encoding/decoding library
#
add_library(codec
  src/encoder.cpp)
target_link_libraries(codec ${catkin_LIBRARIES})

#
# ---- performance test tool
#
add_executable(codec_perf src/perf.cpp)
target_link_libraries(codec_perf codec ${catkin_LIBRARIES})


#############
## Install ##
#############

install(TARGETS
  codec
  codec_perf
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(TARGETS codec
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION})

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})

#############
## Testing ##
#############

# To be done...
