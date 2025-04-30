# ======================================================================
# Template Makefile for Fortran Projects
# Compiler and flags defined externally via environment:
#   $FC       : Fortran compiler
#   $fflags   : Base flags (e.g., -fcheck=all)
#   $Wflags   : Warning flags
#   $oflags   : Optimization/debug flags
# ======================================================================

# Program name
PROGRAM = main-coarray-swarm

# Directories
SRC_DIR      = .
SHARED_DIR   = libs
OBJ_DIR      = obj
MOD_DIR      = mod
INCLUDE_DIR  = include
LIB_DIR      = lib

# Source and object files
SRCS       = $(wildcard $(SRC_DIR)/*.f08) $(wildcard $(SHARED_DIR)/*.f08)
OBJS       = $(patsubst %.f08, $(OBJ_DIR)/%.o, $(notdir $(SRCS)))
PRG_OBJ    = $(OBJ_DIR)/$(PROGRAM).o
MOD_OBJS   = $(filter-out $(PRG_OBJ), $(OBJS))

# ================================================================
# Default Build Targets
# ================================================================

.PHONY: default
default: $(PROGRAM)

# Build the main program by linking all object files.
# $(PROGRAM): The output executable.
# $<: The source file.
# $@: The corresponding object file output.
# $(MOD_OBJS) $(PRG_OBJ): Dependencies - all compiled module and program object files.
$(PROGRAM): $(MOD_OBJS) $(PRG_OBJ)
	@echo " * * * * * * Building program $(PROGRAM) from dependencies"
	@echo " * * * * * * links all the compiled object files ($(MOD_OBJS) and $(PRG_OBJ)) into the executable"
	@echo " * * * * * * Compile output program (-o) into target ($@) using dependencies ($^)"
	@echo "$(FC) -o $@ $^"
	$(FC) $(fflags) $(Wflags) $(oflags) -J $(MOD_DIR) -o $@ $^

# Compile individual source files from the source directory into object files.
# $<: The source file.
# $@: The corresponding object file output.
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.f08 | $(OBJ_DIR)
	@echo " * * * * * * Compiling source file ($<) into object file ($@)"
	@echo "$(FC) $(fflags) $(Wflags) $(oflags) -J $(MOD_DIR) -o $@ $<"
	$(FC) $(fflags) $(Wflags) $(oflags) -c -J $(MOD_DIR) -o $@ $<

# Compile shared files from the shared directory into object files.
$(OBJ_DIR)/%.o: $(SHARED_DIR)/%.f08 | $(OBJ_DIR)
	@echo " * * * * * * Compiling shared file ($<) into object file ($@)"
	@echo "$(FC) $(fflags) $(Wflags) $(oflags) -J $(MOD_DIR) -o $@ $<"
	$(FC) $(fflags) $(Wflags) $(oflags) -c -J $(MOD_DIR) -o $@ $<

# Ensure object and module directories exist before compiling.
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# ================================================================
# Module Dependency Map
# Add explicit build-order rules below to ensure correct compilation.
# Example:
# $(OBJ_DIR)/module_a.o: $(OBJ_DIR)/module_b.o
# ================================================================

obj/libs/clEnergies.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstAstro.o obj/libs/libConstMath.o
obj/libs/clMomenta.o:  obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o obj/libs/libConstAstro.o obj/libs/utilVectorOps.o
obj/libs/libBusSpecs.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o obj/clSatellite.o
obj/libs/libConstAstro.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o
obj/libs/libConstMath.o: obj/libs/mPrecisionDefinitions.o
obj/libs/libConstQuat.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o
obj/libs/libOrbitCases.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o obj/libs/libConstAstro.o
obj/libs/libSatType.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o obj/libs/libOrbitCases.o obj/libs/libBusSpecs.o obj/clSatellite.o
obj/libs/mFDalloc.o: obj/libs/mPrecisionDefinitions.o
obj/libs/mFDbasics.o: obj/libs/mPrecisionDefinitions.o
obj/libs/mPrecisionDefinitions.o:
obj/libs/utilQuatOps.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstMath.o obj/libs/libConstQuat.o obj/libs/utilVectorOps.o
obj/libs/utilVectorOps.o: obj/libs/libConstMath.o obj/libs/mPrecisionDefinitions.o
obj/clSatellite.o: obj/libs/mPrecisionDefinitions.o obj/libs/libConstAstro.o obj/libs/libConstMath.o
obj/clPropagator.o: obj/libs/mPrecisionDefinitions.o obj/libs/mFDalloc.o obj/libs/libConstAstro.o obj/libs/libConstMath.o obj/clSatellite.o
obj/mTaskManager.o: obj/clSatellite.o obj/libs/libConstMath.o obj/libs/mPrecisionDefinitions.o
obj/main-coarray-swarm.o: obj/libs/libConstMath.o obj/libs/mFDbasics.o obj/libs/mPrecisionDefinitions.o obj/mTaskManager.o

# ================================================================
# Cleaning Targets
# ================================================================

# Clean only object and module files
.PHONY: clean
clean:
	@echo "Cleaning object and module files..."
	rm -rf $(OBJ_DIR)/*.o $(OBJ_DIR)/*.mod $(OBJ_DIR)/*.smod

.PHONY: rebuild
rebuild: clean default

# Purge all generated files and artifacts
.PHONY: purge
purge:
	@echo "Purging all build artifacts..."
	rm -rf $(OBJ_DIR) $(PROGRAM)

# ================================================================
# Debugging and Information
# ================================================================

# Debugging information
.PHONY: debug
debug:
	@echo "====== DEBUG INFORMATION ======"
	@echo "Program Name       : $(PROGRAM)"
	@echo "Main Object File   : $(PRG_OBJ)"
	@echo "Source Files       : $(SRCS)"
	@echo "Object Files       : $(OBJS)"
	@echo "Module Object Files: $(MOD_OBJS)"
	@echo "================================"

# List program directories
.PHONY: directories
directories:
	@echo "Source Directory   : $(SRC_DIR)"
	@echo "Shared Directory   : $(SHARED_DIR)"
	@echo "Objects Directory  : $(OBJ_DIR)"
	@echo "Include Directory  : $(INCLUDE_DIR)"
	@echo "Library Directory  : $(LIB_DIR)"

# ================================================================
# Flags Information
# ================================================================

.PHONY: flags
flags:
	@echo "Compiler Flags:"
	@echo "  $(fflags) $(Wflags) $(oflags)"

# ================================================================
# Options Target
# ================================================================

.PHONY: options
options:
	@echo "Available Targets:"
	@echo "  default       - Build the entire program"
	@echo "  clean         - Remove object and module files"
	@echo "  purge         - Remove all build artifacts"
	@echo "  debug         - Display debugging information"
	@echo "  directories   - Display source, shared, and object directories"
	@echo "  flags         - Display current compiler flags"
	@echo "  options       - Display this help message"
