package require tdom

option readfile ~/.tkabber/dark1.xrdb userDefault

set autologin 1
set keep_alive 1
set keep_alive_interval 5
hook::add finload_hook {
	bind . <Alt-Key-h> [bind . <Control-Key-Prior>]
	bind . <Alt-Key-l> [bind . <Control-Key-Next>]
	bind . <Alt-Key-j> [bind . <Alt-Key-Next>]
	bind . <Alt-Key-k> [bind . <Alt-Key-Prior>]
}

hook::add generate_completions_hook {apply {{chatid compsvar wordstart line} {
	upvar 0 $compsvar comps
    
	if {!$wordstart} {
	lappend comps {/np}
    }
}}}
