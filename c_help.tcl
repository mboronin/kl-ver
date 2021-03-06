 #Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Kl�ver.
#Developed by Petter Fogelqvist December-January 2011-2012 
 
 package require BWidget

 font create ObjectO -size -12 -slant italic
 set sw [ScrolledWindow .t -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 410 -height 500 ]
    $sw setwidget $sf
    set subf [$sf getframe]
    
frame $subf.b

frame $subf.b.title
label $subf.b.title.label -text "Completeness" -font Title
pack $subf.b.title.label -side top -ipady 10 -ipadx 10 
pack $subf.b.title -pady 10 -padx 10 
frame $subf.b.info
message $subf.b.info.i -text "The 'Completeness' option detects:
1. Unreachable rules.
2. Missing rules.

The tool checks:
(1)if there exist rules with identical rule numbers and objects in the rule base.
(1)if all rule numbers exists in rule_info/2.
(1)if each object in the rule-base are represented in a clause of rule_info/2.
(1)if each object in the rule-base are represented in the list of goal_conclusions/1.
(2)if rule numbers present in rule_info/2 have a correspondent rule in the rule base." \
 -background #CDB79E  -justify left -width 430
pack $subf.b.info.i -ipady 2 -ipadx 2
pack $subf.b.info -fill x -padx 2

frame $subf.b.bf -relief groove -borderwidth 0

button $subf.b.bf.1 -text "See examples" -background #EED5B7 -command {example $subf}
button $subf.b.bf.2 -text "Back" -width 10 -background #EED5B7 -command {back $subf}

pack $subf.b.bf.1 $subf.b.bf.2  -side left -pady 3 -padx 20
pack $subf.b.bf -expand 1 -fill x
pack $subf.b -ipadx 10 -ipady 10 -padx 20 -expand 1 -fill both

proc back {subf} {
		destroy $subf.c
		prolog_event "'Back'"
}

proc example {subf} {
labelframe $subf.c -relief groove -borderwidth 2 -text "Examples of incompleteness" -font ObjectO -background #CDB79E

	message $subf.c.p -text "Format: rule(Rule_Number, Rule_Class, Rule_Attribute, Certainty_factor)
	
Example of two rules with duplicated rule numbers and conclusions in Kl�ver:
rule(1, Class1, Attribute1, 400) :-
premise(A),
premise(B).
	
has the same rule number and class as:
	
rule(2, Class1, Attribute2, 600) :-
premise(C). 
	
The second rule will never be reached when the first rule succeeds.
	
------------------------------------------------------------------

Example of an unreachable rule in Kl�ver:
rule_info(Class1, (1,3,4,5,6,7,8,9)).
	
rule(2,Class1, Attribute1,600):-
premise(A).
	
The rule-number 2 is not represented in the clause of rule_info/2.
	
-------------------------------------------------------------------
	
Example of a missing clause of rule_info/2 in Kl�ver:
rule_info(Class2,(3)).
	
rule(1,Class1, Attribute1,600):-
premise(A).
	
rule(3,Class2, Attribute1,200):-
premise(B).
	
A clause of rule_info/2 for Class1 is missing.
	
-------------------------------------------------------------------
	
Example of a missing class in goal_conclusions/1 in Kl�ver:
goal_conclusions((Class1))
	
rule(1,Class1, Attribute1,600):-
premise(A).
	
rule(3,Class2, Attribute1,200):-
premise(B).
	
Class2 is missing in goal_conclusions/1.
	
--------------------------------------------------------------------
	
Example of a missing rule in Kl�ver:
(when a number in rule_info\2 does not have a correspondent rule in the rule base)
	
rule_info(Class2,(10,20,30,)).
	
rule(10,Class2, Attribute1,600):-
premise(A).
	
rule(30,Class2, Attribute2,-500):-
premise(B).
	
There is no rule in the rule base with rule-number 20." -background #CDB79E  -justify left -width 420
pack $subf.c.p -fill x

	$subf.b.bf.1 configure -state disabled
	pack $subf.c -ipadx 10 -ipady 10 -expand 1 -fill both
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