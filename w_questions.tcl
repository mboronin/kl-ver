 #Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 
 
 package require BWidget
 package require Tablelist

 #scrollable window setup
 set sw [ScrolledWindow .t -relief groove -borderwidth 0 -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 380 -height 500 ]
    $sw setwidget $sf
    set subf [$sf getframe]

#global var

set Object []
set Prompt []
set Meny []
set Type []
set Fragevillkor []
set Explain []
set evar []
font create ObjectO -size -12
font create Big -family calibri -size -20

prolog {tcl_question(Object, Prompt, M, Type, Fragevillkor)}


labelframe $subf.a -relief groove -borderwidth 2 -text "Category" -font ObjectO

label $subf.a.object -text "$prolog_variables(Object)" -font Big -width 35
pack $subf.a.object -pady 5 -fill x
pack $subf.a -padx 40 -pady 10 -ipadx 5 -ipady 5 -expand 1 -fill both

labelframe $subf.b -relief groove -borderwidth 2 -text "Question" -font ObjectO
message $subf.b.prompt -text "$prolog_variables(Prompt)" -width 300 -justify left -font ObjectO
pack $subf.b.prompt -padx 5 -pady 10 -side top -fill x

frame $subf.b.ebox
label $subf.b.ebox.input -text "Input your answer here:"
entry $subf.b.ebox.entry -textvariable evar -background #EED5B7 
pack $subf.b.ebox.input -anchor w -padx 2 -side left
pack $subf.b.ebox.entry -anchor w -padx 5 -side left
pack $subf.b.ebox -side top -anchor nw -padx 5 -pady 5 -ipadx 5 -ipady 5 -expand 1 -fill both

pack $subf.b -padx 40 -pady 10 -ipadx 20 -ipady 10 -expand 1 -fill both


frame $subf.d 
button $subf.d.ok -text "Ok" -background #EED5B7 -width 5 -command {ok $evar $subf}
pack $subf.d.ok -side left -padx 10
button $subf.d.why -text "Why" -background #EED5B7 -width 5 -command {why $prolog_variables(Object) $subf}
pack $subf.d.why -side left -padx 10 
button $subf.d.change -text "Change previous answers" -background #EED5B7 -command {prolog_event "'change_answers'"}
pack $subf.d.change -side left -padx 10

pack $subf.d -padx 40 -ipadx 10 -expand 1 -fill x

proc ok {result subf} {

	if {$result == ""} {
		tk_messageBox -type ok -icon error -parent .t -message "You have not given an answer!"
	} else {
		destroy $subf.c
		prolog_event "'$result'"
	}
}

proc why {store subf} {
labelframe $subf.c -relief groove -borderwidth 2 -text "Why explanation" -font ObjectO
frame $subf.c.g4

	if [prolog "definition('$store', Explain)"] {
		message $subf.c.g4.p -text "$prolog_variables(Explain)" -width 300 -justify left
		pack $subf.c.g4.p -padx 5 -side top
	} else {
		message $subf.c.g4.pp -text "No definition is given" -width 200 -justify left
		pack $subf.c.g4.pp -padx 5 -side top
	}
	
$subf.d.why configure -state disabled
pack $subf.c -padx 40 -pady 10 -ipadx 20 -ipady 10 -expand 1 -fill both
pack $subf.c.g4 -side top -anchor nw -padx 5 -pady 5 -ipadx 5 -ipady 5 -expand 1 -fill both
}
#end procedure why

pack $sw -ipadx 40 -ipady 10 -padx 30

bind $subf.b.ebox.entry <Enter> { $subf.b.ebox.entry config -background #CDB79E }
bind $subf.b.ebox.entry <Leave> { $subf.b.ebox.entry config -background #EED5B7 }
bind $subf.d.ok <Enter> { $subf.d.ok config -background #CDB79E }
bind $subf.d.ok <Leave> { $subf.d.ok config -background #EED5B7 }
bind $subf.d.why <Enter> { $subf.d.why config -background #CDB79E }
bind $subf.d.why <Leave> { $subf.d.why config -background #EED5B7 }
bind $subf.d.change <Enter> { $subf.d.change config -background #CDB79E }
bind $subf.d.change <Leave> { $subf.d.change config -background #EED5B7 }

#tk_setPalette -background #bebebe
tk_bisque
font delete ObjectO
font delete Big