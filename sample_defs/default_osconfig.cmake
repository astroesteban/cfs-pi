##########################################################################
#
# CFE-specific configuration options for OSAL
#
# This file specifies the CFE-specific values for various compile options
# supported by OSAL.
#
# OSAL has many configuration options, which may vary depending on the
# specific version of OSAL in use.  The complete list of OSAL options,
# along with a description of each, can be found OSAL source in the file:
#
#    osal/default_config.cmake
#
# A CFE framework build utilizes mostly the OSAL default configuration.
# This file only contains a few specific overrides that tune for a debug
# environment, rather than a deployment environment.
#
# ALSO NOTE: There is also an arch-specific addendum to this file
# to allow further tuning on a per-arch basis, in the form of:
#
#    ${TOOLCHAIN_NAME}_osconfig.cmake
#
# See "native_osconfig.cmake" for options which apply only to "native" builds.
#
##########################################################################

#
# OSAL_CONFIG_DEBUG_PERMISSIVE_MODE
# ----------------------------------
#
# The OSAL_CONFIG_DEBUG_PERMISSIVE_MODE option controls how privileged operations
# are handled by the OSAL in the event that the user does not have sufficient permission.
# In particular this applies to task priorities and message queues.
#
# If set FALSE, then all permissions are enforced, and a failure due to lack of permission
# will cause a failure of the overall operation, which is passed back to the application.
#
# If set to TRUE, this will treat some errors non-fatal and enable a graceful fallback,
# allowing the overall operation to complete in a reduced form.  This makes the
# OSAL library compatible with a non-root (normal user mode) environment.
#
# In the PC-Linux/Posix build, this means:
#  - A message queue deeper than the maximum system limit will be silently truncated
#    to the maximum system limit (no error).
#  - If the user does not have permission to create elevated priority tasks, then the tasks will
#    be created at the default priority (no error).
#
set(OSAL_CONFIG_DEBUG_PERMISSIVE_MODE ON)

#
# OSAL_CONFIG_DEBUG_PRINTF
# ----------------------------------
#
# Controls inclusion of OS_DEBUG statements in the code
#
# If set FALSE, all OS_DEBUG statements are compiled out.
#
# If set TRUE, all the "OS_DEBUG" statements will be compiled in and displayed
# on the debug console.  The statements may still be suppressed at runtime.
#
set(OSAL_CONFIG_DEBUG_PRINTF OFF)