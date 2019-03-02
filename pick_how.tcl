#Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 

package require BWidget
 package require Tablelist

 #scrollable window setup
 set sw [ScrolledWindow .t -relief groove -borderwidth 0 -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 360 -height 420 ]
    $sw setwidget $sf
    set subf [$sf getframe]

set Index 0
set Num []
set Object []

frame $subf.f1 -relief groove -borderwidth 2
label $subf.f1.label -text "Conclusions reached" -font Title
pack $subf.f1.label -side top -pady 5
pack $subf.f1 -padx 5 -pady 10 -ipadx 5 -ipady 5 -expand 1 -fill x

prolog {num_answers(Num)}

set ftable [frame $subf.ftable]

frame $ftable.g3
label $ftable.g3.label -text "*Select a conclusion:"
pack $ftable.g3.label -padx 5 -fill x
pack $ftable.g3 -side top -anchor nw -padx 5 -expand 1 -fill x

tablelist::tablelist $ftable.table \
-columns {0 "Conclusion"} -height 8 -width 30 -stretch all -selectmode single \
-yscrollcommand [list $ftable.scroll set] -background #eee9e9
 
scrollbar $ftable.scroll -orient vertical -command [list $ftable.table yview] 
while {$Index < $prolog_variables(Num)} {
	prolog {answer_options(Object)}
	$ftable.table insert end [list "$prolog_variables(Object)"]
	if {$Index>0 && $Index%2} {
	$ftable.table rowconfigure $Index -background #eee9e9 
	} else {
	$ftable.table rowconfigure $Index -background #b0c4de
	}
	prolog {retract_answer(N,M)}
	incr Index
	}

pack $ftable.table -side left -fill x -expand 1
pack $ftable.scroll -side left -fill y
pack $ftable -side top -padx 70 -pady 5 -ipadx 5 -ipady 5 -expand 1 -fill x

set f2 [frame $subf.f2]
frame $f2.g1
button $f2.g1.ok -text "Ok" -background #EED5B7 -width 5 -command {ok $ftable}
pack $f2.g1.ok -anchor s -padx 5 -pady 0
message $f2.g1.sics -text "Explanations of how the chosen conclusion was reached will be displayed in SICStus!" -width 210
pack $f2.g1.sics -fill x -pady 5
pack $f2.g1 -side top -anchor nw -padx 5 -pady 5 -ipadx 5 -ipady 0 -expand 1 -fill both



pack $f2 -side top -padx 5 -pady 5 -ipadx 10 -ipady 10 -expand 1 -fill both

proc ok {ftable} {
	prolog_event "'[$ftable.table curselection]'"
	}

pack $sw -padx 40 -pady 20
bind $f2.g1.ok <Enter> { $f2.g1.ok config -background #CDB79E }
bind $f2.g1.ok <Leave> { $f2.g1.ok config -background #EED5B7 }

#tk_setPalette -background #bebebe
tk_bisque

#font create TkFixedFont -family Courier -size -12
