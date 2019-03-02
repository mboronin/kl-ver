#Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 

 package require BWidget

 font create ObjectO -size -12 -slant italic
 set sw [ScrolledWindow .t -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 400 -height 400 ]
    $sw setwidget $sf
    set subf [$sf getframe]
    
frame $subf.b

frame $subf.b.title
label $subf.b.title.label -text "Help menu" -font Title
pack $subf.b.title.label -side top -ipady 10 -ipadx 10 
pack $subf.b.title -pady 10 -padx 10 
frame $subf.b.info
message $subf.b.info.i -text "This is a beta version of an automated verification tool which analyze rule-bases in Klöver.
The purpose of this tool is to help the developer test his/her rules regarding consistency and completeness. 

The verification tool does not alter the rule-base in any way!" -font ObjectO -background #CDB79E  -justify center -width 430
pack $subf.b.info.i -ipady 2 -ipadx 2
label $subf.b.info.in -text "The options below give you more information of the specific implemented error checkers:"
pack $subf.b.info.in -pady 5 -padx 10
pack $subf.b.info -fill x -padx 2
frame $subf.b.bf -relief groove -borderwidth 0

button $subf.b.bf.1 -text "Redundancy" -background #EED5B7 -command {prolog_event "'Redundancy'"}
button $subf.b.bf.2 -text "Subsumption" -background #EED5B7 -command {prolog_event "'Subsumed'"}
button $subf.b.bf.3 -text "Completeness" -background #EED5B7 -command {prolog_event "'Completeness'"}
button $subf.b.bf.4 -text "Quit help" -background #EED5B7 -command {prolog_event "'Quit help'"}

pack $subf.b.bf.1 $subf.b.bf.2 $subf.b.bf.3 $subf.b.bf.4 -side left -pady 3 -padx 8
pack $subf.b.bf -expand 1
pack $subf.b -ipadx 10 -ipady 10 -padx 10 -expand 1 -fill both


pack $sw -ipadx 40 -ipady 10 -padx 40

bind $subf.b.bf.1 <Enter> { $subf.b.bf.1 config -background #CDB79E }
bind $subf.b.bf.1 <Leave> { $subf.b.bf.1 config -background #EED5B7 }
bind $subf.b.bf.2 <Enter> { $subf.b.bf.2 config -background #CDB79E }
bind $subf.b.bf.2 <Leave> { $subf.b.bf.2 config -background #EED5B7 }
bind $subf.b.bf.3 <Enter> { $subf.b.bf.3 config -background #CDB79E }
bind $subf.b.bf.3 <Leave> { $subf.b.bf.3 config -background #EED5B7 }
bind $subf.b.bf.4 <Enter> { $subf.b.bf.4 config -background #CDB79E }
bind $subf.b.bf.4 <Leave> { $subf.b.bf.4 config -background #EED5B7 }

#tk_setPalette tk_bisque #bebebe
tk_bisque
 font delete ObjectO
#-background #ffff99