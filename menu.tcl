#Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 
 
 package require BWidget

 font create Title -family calibri -size -20 -underline yes
 set sw [ScrolledWindow .t -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 130 -height 350 ]
    $sw setwidget $sf
    set subf [$sf getframe]
 
frame $subf.b
label $subf.b.label -text "Main menu" -font Title
  
frame $subf.b.bf -relief groove -borderwidth 0
button $subf.b.bf.1 -text Consult -background #EED5B7 -command {prolog_event "'Consult'"}
button $subf.b.bf.2 -text "Consult given answers" -background #EED5B7 -command {prolog_event "'Consult with given answers'"}
#button $subf.b.bf.3 -text "Save answers" -background #EED5B7 -command {prolog_event "'Save answers'"}
#button $subf.b.bf.4 -text "Save session" -background #EED5B7 -command {prolog_event "'Save session'"}
button $subf.b.bf.5 -text "Fetch old answers" -background #EED5B7 -command {prolog_event "'Fetch old answers'"}
button $subf.b.bf.6 -text "Fetch old session" -background #EED5B7 -command {prolog_event "'Fetch old session'"}
button $subf.b.bf.7 -text "List database" -background #EED5B7 -command {prolog_event "'List database'"}
button $subf.b.bf.8 -text "Verify rules" -background #EED5B7 -command {prolog_event "'Verify rules'"}
#button $subf.b.bf.9 -text "How explanation" -background #EED5B7 -command {prolog_event "'How explanation'"}
button $subf.b.bf.10 -text "Quit" -background #EED5B7 -command {prolog_event "'Interrupt'"}
pack $subf.b.label -side top -pady 20 -padx 10
pack $subf.b.bf.1 $subf.b.bf.2 $subf.b.bf.5 $subf.b.bf.6 $subf.b.bf.7 $subf.b.bf.8 $subf.b.bf.10 -fill x -pady 3 -padx 30
#$subf.b.bf.3 $subf.b.bf.4 

pack $subf.b.bf -expand 1
pack $subf.b -ipadx 10 -ipady 10 -expand 1 -fill both

pack $sw -ipadx 40 -ipady 10 -padx 40

bind $subf.b.bf.1 <Enter> { $subf.b.bf.1 config -background #CDB79E }
bind $subf.b.bf.1 <Leave> { $subf.b.bf.1 config -background #EED5B7 }
bind $subf.b.bf.2 <Enter> { $subf.b.bf.2 config -background #CDB79E }
bind $subf.b.bf.2 <Leave> { $subf.b.bf.2 config -background #EED5B7 }
#bind $subf.b.bf.3 <Enter> { $subf.b.bf.3 config -background #CDB79E }
#bind $subf.b.bf.3 <Leave> { $subf.b.bf.3 config -background #EED5B7 }
#bind $subf.b.bf.4 <Enter> { $subf.b.bf.4 config -background #CDB79E }
#bind $subf.b.bf.4 <Leave> { $subf.b.bf.4 config -background #EED5B7 }
bind $subf.b.bf.5 <Enter> { $subf.b.bf.5 config -background #CDB79E }
bind $subf.b.bf.5 <Leave> { $subf.b.bf.5 config -background #EED5B7 }
bind $subf.b.bf.6 <Enter> { $subf.b.bf.6 config -background #CDB79E }
bind $subf.b.bf.6 <Leave> { $subf.b.bf.6 config -background #EED5B7 }
bind $subf.b.bf.7 <Enter> { $subf.b.bf.7 config -background #CDB79E }
bind $subf.b.bf.7 <Leave> { $subf.b.bf.7 config -background #EED5B7 }
bind $subf.b.bf.8 <Enter> { $subf.b.bf.8 config -background #CDB79E }
bind $subf.b.bf.8 <Leave> { $subf.b.bf.8 config -background #EED5B7 }
#bind $subf.b.bf.9 <Enter> { $subf.b.bf.9 config -background #CDB79E }
#bind $subf.b.bf.9 <Leave> { $subf.b.bf.9 config -background #EED5B7 }
bind $subf.b.bf.10 <Enter> { $subf.b.bf.10 config -background #CDB79E }
bind $subf.b.bf.10 <Leave> { $subf.b.bf.10 config -background #EED5B7 }

#tk_setPalette tk_bisque #bebebe
tk_bisque

#-background #ffff99