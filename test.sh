#!/bin/bash
VK_LOADER_DEBUG=all VK_DRIVER_FILES=$(realpath gltun.json) VK_ICD_FILENAMES=$(realpath gltun.json) vulkaninfo
