project(tracking)

set(
  SRC
  connection.cpp
  connection.hpp
  protocol.cpp
  protocol.hpp
  reporter.cpp
  reporter.hpp
  archival_file.cpp
  archival_file.hpp
  archival_manager.cpp
  archival_manager.hpp
  archival_reporter.cpp
  archival_reporter.hpp
  archive.cpp
  archive.hpp
)

omim_add_library(${PROJECT_NAME} ${SRC})

omim_add_pybindings_subdirectory(pytracking)
omim_add_test_subdirectory(tracking_tests)
