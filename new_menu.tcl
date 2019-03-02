 #Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 
 
 package require BWidget

 set sw [ScrolledWindow .t -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 130 -height 450 ]
    $sw setwidget $sf
    set subf [$sf getframe]
    
set b [frame $subf.b] 
set label [label $b.label -text "Main menu" -font Title]

set bf [frame $b.bf -relief groove -borderwidth 0]

button $bf.1 -text "New session" -background #EED5B7 -command {prolog_event "'New session'"}
button $bf.2 -text "Consult given answers" -background #EED5B7 -command {prolog_event "'Consult with given answers'"}
button $bf.3 -text "Change answers" -background #EED5B7 -command {prolog_event "'Change answers'"}
button $bf.4 -text "Save answers" -background #EED5B7 -command {prolog_event "'Save answers'"}
button $bf.5 -text "Save session" -background #EED5B7 -command {prolog_event "'Save session'"}
button $bf.6 -text "Fetch old answers" -background #EED5B7 -command {prolog_event "'Fetch old answers'"}
button $bf.7 -text "Fetch old session" -background #EED5B7 -command {prolog_event "'Fetch old session'"}
button $bf.8 -text "List database" -background #EED5B7 -command {prolog_event "'List database'"}
button $bf.9 -text "Verify rules" -background #EED5B7 -command {prolog_event "'Verify rules'"}
button $bf.10 -text "How explanation" -background #EED5B7 -command {prolog_event "'How explanation'"}
button $bf.11 -text "Quit" -background #EED5B7 -command {prolog_event "'Interrupt'"}
pack $label -side top -pady 20 -padx 10
pack $bf.1 $bf.2 $bf.3 $bf.4 $bf.5 $bf.6 $bf.7 $bf.8 $bf.9 $bf.10 $bf.11 -fill x -pady 3 -padx 30

pack $bf -expand 1
pack $b -ipadx 10 -ipady 10 -expand 1 -fill both
pack $sw -ipadx 40 -ipady 10 -padx 40

bind $bf.1 <Enter> { $bf.1 config -background #CDB79E }
bind $bf.1 <Leave> { $bf.1 config -background #EED5B7 }
bind $bf.2 <Enter> { $bf.2 config -background #CDB79E }
bind $bf.2 <Leave> { $bf.2 config -background #EED5B7 }
bind $bf.3 <Enter> { $bf.3 config -background #CDB79E }
bind $bf.3 <Leave> { $bf.3 config -background #EED5B7 }
bind $bf.4 <Enter> { $bf.4 config -background #CDB79E }
bind $bf.4 <Leave> { $bf.4 config -background #EED5B7 }
bind $bf.5 <Enter> { $bf.5 config -background #CDB79E }
bind $bf.5 <Leave> { $bf.5 config -background #EED5B7 }
bind $bf.6 <Enter> { $bf.6 config -background #CDB79E }
bind $bf.6 <Leave> { $bf.6 config -background #EED5B7 }
bind $bf.7 <Enter> { $bf.7 config -background #CDB79E }
bind $bf.7 <Leave> { $bf.7 config -background #EED5B7 }
bind $bf.8 <Enter> { $bf.8 config -background #CDB79E }
bind $bf.8 <Leave> { $bf.8 config -background #EED5B7 }
bind $bf.9 <Enter> { $bf.9 config -background #CDB79E }
bind $bf.9 <Leave> { $bf.9 config -background #EED5B7 }
bind $bf.10 <Enter> { $bf.10 config -background #CDB79E }
bind $bf.10 <Leave> { $bf.10 config -background #EED5B7 }
bind $bf.11 <Enter> { $bf.11 config -background #CDB79E }
bind $bf.11 <Leave> { $bf.11 config -background #EED5B7 }

#tk_setPalette -background #bebebe
tk_bisque