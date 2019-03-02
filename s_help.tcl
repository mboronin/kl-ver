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
label $subf.b.title.label -text "Subsumption" -font Title
pack $subf.b.title.label -side top -ipady 10 -ipadx 10 
pack $subf.b.title -pady 10 -padx 10 
frame $subf.b.info
message $subf.b.info.i -text "Klöver is a rule-based system utilizing inexact reasoning by implementing Certainty Factors (CF).
Whith Certainty Factors, two subsumed rules are two rules with identical conclusions in the same rule class, \
where the conditions of the first rule is a subset of the conditions of the second rule, and where the CF of the first rule is greater than than the CF of the second rule.

Subsumed rules with CF can sometimes be utilized by purpose. However, according to the definition above, subsumed \
rules may be an indication of non-intended developer-induced errors, or misinterpretation of knowledge." \
 -background #CDB79E  -justify left -width 430
pack $subf.b.info.i -ipady 2 -ipadx 2
pack $subf.b.info -fill x -padx 2

frame $subf.b.bf -relief groove -borderwidth 0

button $subf.b.bf.1 -text "See example" -background #EED5B7 -command {example $subf}
button $subf.b.bf.2 -text "Back" -width 10 -background #EED5B7 -command {back $subf}

pack $subf.b.bf.1 $subf.b.bf.2  -side left -pady 3 -padx 20
pack $subf.b.bf -expand 1
pack $subf.b -ipadx 10 -ipady 10 -expand 1 -fill both

proc back {subf} {
		destroy $subf.c
		prolog_event "'Back'"
}

proc example {subf} {
labelframe $subf.c -relief groove -borderwidth 2 -text "Example of two subsumed rules" -font ObjectO -background #CDB79E

	message $subf.c.p -text "Format: rule(Rule_Number, Rule_Class, Rule_Attribute, Certainty_factor)
	
	rule(1, Class1, Attribute1, 400) :-
	premise(A),
	premise(B).
	
	subsumed by:
	
	rule(2, Class1, Attribute1, 600) :-
	premise(B). " -background #CDB79E  -justify left -width 430
	pack $subf.c.p -fill x -padx 2

	$subf.b.bf.1 configure -state disabled
	pack $subf.c -ipadx 10 -ipady 10 -padx 10 -expand 1 -fill both
}

pack $sw -ipadx 40 -ipady 10 -padx 40

bind $subf.b.bf.1 <Enter> { $subf.b.bf.1 config -background #CDB79E }
bind $subf.b.bf.1 <Leave> { $subf.b.bf.1 config -background #EED5B7 }
bind $subf.b.bf.2 <Enter> { $subf.b.bf.2 config -background #CDB79E }
bind $subf.b.bf.2 <Leave> { $subf.b.bf.2 config -background #EED5B7 }

#tk_setPalette tk_bisque #bebebe
tk_bisque
 font delete ObjectO
#-background #ffff99