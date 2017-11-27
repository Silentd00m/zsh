POWERLEVEL9K_FOLDER_ICON=""
# POWERLEVEL9K_HOME_SUB_ICON="$(print_icon "HOME_ICON")"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh root_indicator context dir dir_writable
                                   vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_job
                                    sanaconda virtualenv)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=20

POWERLEVEL9K_SHOW_CHANGESET=false

antigen theme bhilburn/powerlevel9k powerlevel9k

function __theme_Init()
{
}

function __theme_Hook()
{
}

function __theme_OnCMD()
{
}
