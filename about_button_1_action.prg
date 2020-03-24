#include "hmg.ch"

declare window about

Function about_button_1_action

setProperty("Main", "enabled", .t. )
about.Release()

Return Nil
