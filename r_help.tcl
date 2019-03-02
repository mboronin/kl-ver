 #Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 
 
 package require BWidget

 font create ObjectO -size -12 -slant italic
 set sw [ScrolledWindow .t -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 400 -height 500 ]
    $sw setwidget $sf
    set subf [$sf getframe]
    
frame $subf.b

frame $subf.b.title
label $subf.b.title.label -text "Redundancy" -font Title
pack $subf.b.title.label -side top -ipady 10 -ipadx 10 
pack $subf.b.title -pady 10 -padx 10 
frame $subf.b.info
message $subf.b.info.i -text "The 'Redundancy' option detects:

Syntactically redundant rules in the rule-base
   -Two syntactical redundant rules are two identical rules with identical premises and identical \
conclusions, belonging to the same rule class." -background #CDB79E  -justify center -width 430
pack $subf.b.info.i -ipady 2 -ipadx 2
pack $subf.b.info -fill x -padx 2

frame $subf.b.bf -relief groove -borderwidth 0

button $subf.b.bf.1 -text "See example" -background #EED5B7 -command {example $subf}
button $subf.b.bf.2 -text "Back" -width 10 -background #EED5B7 -command {back $subf}
#button $subf.b.bf.3 -text "Completeness" -background #EED5B7 -command {prolog_event "'Completeness'"}
#button $subf.b.bf.4 -text "Quit help" -background #EED5B7 -command {prolog_event "'Quit help'"}
#button $subf.b.bf.5 -text "Back" -background #EED5B7 -command {prolog_event "'Back'"}
#button $subf.b.bf.6 -text "Fetch old session" -background #EED5B7 -command {prolog_event "'Fetch old session'"}
#button $subf.b.bf.7 -text "List database" -background #EED5B7 -command {prolog_event "'List database'"}
#button $subf.b.bf.8 -text "Verify rules" -background #EED5B7 -command {prolog_event "'Verify rules'"}

pack $subf.b.bf.1 $subf.b.bf.2  -side left -pady 3 -padx 20
pack $subf.b.bf -expand 1
pack $subf.b -ipadx 10 -ipady 10 -padx 20 -expand 1 -fill both
#$subf.b.bf.3 $subf.b.bf.4

proc back {subf} {
		destroy $subf.c
		prolog_event "'Back'"
}

proc example {subf} {
labelframe $subf.c -relief groove -borderwidth 2 -text "Example of two redundant rules" -font ObjectO -background #CDB79E

	message $subf.c.p -text "Format: rule(Rule_Number, Rule_Class, Rule_Attribute, Certainty_factor)
	
	rule(1, Class2, Attribute1, 400) :-
	premise(A),
	premise(B).
	
	redundant with:
	
	rule(2, Class2, Attribute1, 600) :-
	premise(B),
	premise(A)." -background #CDB79E  -justify left -width 430
	pack $subf.c.p -fill x -padx 2

	$subf.b.bf.1 configure -state disabled
	pack $subf.c -ipadx 10 -ipady 10 -padx 10 -expand 1 -fill both
}

pack $sw -ipadx 40 -ipady 10 -padx 40

bind $subf.b.bf.1 <Enter> { $subf.b.bf.1 config -background #CDB79E }
bind $subf.b.bf.1 <Leave> { $subf.b.bf.1 config -background #EED5B7 }
bind $subf.b.bf.2 <Enter> { $subf.b.bf.2 config -background #CDB79E }
bind $subf.b.bf.2 <Leave> { $subf.b.bf.2 config -background #EED5B7 }
#bind $subf.b.bf.3 <Enter> { $subf.b.bf.3 config -background #CDB79E }
#bind $subf.b.bf.3 <Leave> { $subf.b.bf.3 config -background #EED5B7 }
#bind $subf.b.bf.4 <Enter> { $subf.b.bf.4 config -background #CDB79E }
#bind $subf.b.bf.4 <Leave> { $subf.b.bf.4 config -background #EED5B7 }
#bind $subf.b.bf.5 <Enter> { $subf.b.bf.5 config -background #CDB79E }
#bind $subf.b.bf.5 <Leave> { $subf.b.bf.5 config -background #EED5B7 }

#tk_setPalette tk_bisque #bebebe
tk_bisque
 font delete ObjectO
#-background #ffff99