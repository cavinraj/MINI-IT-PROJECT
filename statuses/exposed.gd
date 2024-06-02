class_name MyAwesomeStatus
extends Status

var member_var = 0


func initialize_status(target):
	print("Initialize my status for target %s" % target)
	
	
func apply_status(target):
	print("My status targets %s" % target)
	print("It does %s something" % member_var)
	
	status_applied.emit(self)

