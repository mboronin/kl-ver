#Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 

 package require BWidget

 set sw [ScrolledWindow .t -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 400 -height 400 ]
    $sw setwidget $sf
    set subf [$sf getframe]
    
frame $subf.b

frame $subf.b.title
label $subf.b.title.label -text "Verification menu" -font Title
pack $subf.b.title.label -side top -ipady 10 -ipadx 10 
pack $subf.b.title -pady 10 -padx 10 
labelframe $subf.b.info -relief groove -borderwidth 1 -text "Information" 
label $subf.b.info.i -text "Result of the verification is printed to SICStus!"
pack $subf.b.info.i -ipady 5 -ipadx 5
pack $subf.b.info -fill x -pady 5 -padx 5
frame $subf.b.bf -relief groove -borderwidth 0
button $subf.b.bf.1 -text "Redundancy" -background #EED5B7 -command {prolog_event "'Redundancy'"}
button $subf.b.bf.2 -text "Subsumption" -background #EED5B7 -command {prolog_event "'Subsumption'"}
button $subf.b.bf.3 -text "Completeness" -background #EED5B7 -command {prolog_event "'Completeness'"}
button $subf.b.bf.4 -text "Help" -background #EED5B7 -command {prolog_event "'Help'"}
button $subf.b.bf.5 -text "Back" -background #EED5B7 -command {prolog_event "'Back'"}

pack $subf.b.bf.1 $subf.b.bf.2 $subf.b.bf.3 $subf.b.bf.4  $subf.b.bf.5 -fill x -pady 3 -padx 30
pack $subf.b.bf -expand 1
pack $subf.b -ipadx 10 -ipady 10 -padx 105 -expand 1 -fill both


pack $sw -ipadx 40 -ipady 10 -padx 40

bind $subf.b.bf.1 <Enter> { $subf.b.bf.1 config -background #CDB79E }
bind $subf.b.bf.1 <Leave> { $subf.b.bf.1 config -background #EED5B7 }
bind $subf.b.bf.2 <Enter> { $subf.b.bf.2 config -background #CDB79E }
bind $subf.b.bf.2 <Leave> { $subf.b.bf.2 config -background #EED5B7 }
bind $subf.b.bf.3 <Enter> { $subf.b.bf.3 config -background #CDB79E }
bind $subf.b.bf.3 <Leave> { $subf.b.bf.3 config -background #EED5B7 }
bind $subf.b.bf.4 <Enter> { $subf.b.bf.4 config -background #CDB79E }
bind $subf.b.bf.4 <Leave> { $subf.b.bf.4 config -background #EED5B7 }
bind $subf.b.bf.5 <Enter> { $subf.b.bf.5 config -background #CDB79E }
bind $subf.b.bf.5 <Leave> { $subf.b.bf.5 config -background #EED5B7 }

#tk_setPalette tk_bisque #bebebe
tk_bisque

#-background #ffff99