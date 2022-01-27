#!/usr/bin/env julia=".."
using RobotOS
@rosimport std_msgs.msg.String
rostypegen()
using .std_msgs.msg: StringMsg
function callback(msg)
    loginfo("$(RobotOS.get_caller_id()) I heard $(msg.data)")
end
function listener()
    init_node("listener")  # node name
    # subscribe to the topic "chatter"; the keyword argument queue_size is optional
    sub = Subscriber{StringMsg}("chatter", callback; queue_size=10)
    # spin() simply keeps Julia from exiting until this node is stopped
    spin()
end
if !isinteractive()
    listener()
end