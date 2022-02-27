echo "Generating compilation database"

# Get current working directory
WORKING_DIR=$(pwd)

# Execute tool in Bazel Workspace dir
cd $BUILD_WORKSPACE_DIRECTORY
exec $WORKING_DIR/external/bazel_compdb/generate.py
