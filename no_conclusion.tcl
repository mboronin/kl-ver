 #Tcl/tk version 8.4.19.5 available here: www.activestate.com/activetcl/downloads 
#ActiveState ActiveTcl
#This is part of a tcl/tk user interface customized to the knowledge-based system shell Klöver.
#Developed by Petter Fogelqvist December-January 2011-2012 
 
 package require BWidget

 set sw [ScrolledWindow .f1 -relief groove -borderwidth 4 -background #EED5B7 ]
    set sf [ScrollableFrame $sw.f -background  #ffe4c4 -width 500 -height 500 ]
    $sw setwidget $sf
    set subf [$sf getframe]


set a [frame $subf.a -relief groove -borderwidth 2]
label $a.object -text "Conclusions" -font Title
pack $a.object -side top -pady 10
pack $a -padx 5 -pady 5 -ipadx 20 -ipady 10 -expand 1 -fill both


set b [frame $subf.b -relief groove -borderwidth 2]
label $b.label -text "No conclusions have been drawn."
pack $b.label -anchor w -padx 5 -side top
button $b.ok -text "Ok" -background #EED5B7 -width 5 -command {prolog_event ok}
pack $b.ok -side left -padx 5 -pady 5
pack $b -padx 5 -pady 5 -ipadx 20 -ipady 10 -expand 1 -fill both

pack $sw -ipadx 40 -ipady 10

bind $b.ok <Enter> { $b.ok config -background #CDB79E }
bind $b.ok <Leave> { $b.ok config -background #EED5B7 }

#tk_setPalette -background #bebebe
tk_bisque
