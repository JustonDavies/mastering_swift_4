cmake_minimum_required(VERSION 3.8)
project(swift_chapter_3_collections)

add_custom_target(swift_chapter_3_collections ALL
    COMMAND /home/juston.davies/.swiftenv/versions/4.0.2-RELEASE/usr/bin/swift build
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    SOURCES Sources/main.swift)
