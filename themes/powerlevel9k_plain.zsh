POWERLEVEL9K_MODE='compatible'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh root_indicator context dir dir_writable
                                   vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs anaconda virtualenv)
POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

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
